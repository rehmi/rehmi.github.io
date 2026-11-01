+++
title = "Diffraction & Reconstruction Code"
project_date = "2020–2022"
tags = String[]
+++

# Diffraction & reconstruction — code

The core forward model (diffraction through the display) and the two inverse filters used to
produce the figures on the [Camera Behind the Display](/projects/camera-behind-display/) page.
Plain Julia (`FFTW` + `Images`), self-contained and general — illustrative implementations derived
from the public patents. Each color channel is handled independently because the display's
point-spread function scales with wavelength (chromatic dispersion).

## The display point-spread function

The display's periodic aperture $a$ diffracts light; the monochromatic PSF is $|\mathcal{F}\{a\}|^2$,
and it scales spatially with wavelength. Summing that over the visible band, weighted by each
wavelength's RGB response $w_c(\lambda)$, gives a per-channel PSF that carries continuous chromatic
dispersion — the same spectral sweep that builds the white-light PSF:

$$ h_c \;\propto\; \sum_{\lambda=400}^{700} w_c(\lambda)\;\mathrm{scale}_{\lambda/\lambda_{\mathrm{ref}}}\!\bigl[\,|\mathcal{F}\{a\}|^2\,\bigr],\qquad H = \mathcal{F}\{h_c\}. $$

```julia
using FFTW, Images, Statistics, Random

"Incoherent PSF of the display aperture: |F{a}|^2, peak-normalized."
base_psf(a) = (p = abs2.(fftshift(fft(ifftshift(a)))); p ./ maximum(p))

crop_center(A, k) = (c = size(A, 1) ÷ 2 + 1; h = k ÷ 2; A[c-h:c+h, c-h:c+h])

function fit_center(A, N)                       # crop or zero-pad to N×N, centered
    h = size(A, 1)
    h >= N && (s = h ÷ 2 - N ÷ 2 + 1; return A[s:s+N-1, s:s+N-1])
    out = zeros(eltype(A), N, N); p = (N - h) ÷ 2
    out[p+1:p+h, p+1:p+h] .= A; out
end

"Bruton's approximate linear-RGB response of a wavelength (nm)."
function wav2rgb(wl)
    (wl < 380 || wl > 750) && return [0.0, 0.0, 0.0]
    if     wl < 440; r, g, b = -(wl-440)/60, 0.0, 1.0
    elseif wl < 490; r, g, b = 0.0, (wl-440)/50, 1.0
    elseif wl < 510; r, g, b = 0.0, 1.0, -(wl-510)/20
    elseif wl < 580; r, g, b = (wl-510)/70, 1.0, 0.0
    elseif wl < 645; r, g, b = 1.0, -(wl-645)/65, 0.0
    else;            r, g, b = 1.0, 0.0, 0.0
    end
    f = wl < 420 ? 0.3 + 0.7*(wl-380)/40 : (wl > 700 ? 0.3 + 0.7*(750-wl)/50 : 1.0)
    [r, g, b] .* f
end

"Per-channel PSF kernels from a full 400–700 nm sweep (continuous dispersion)."
function spectral_psfs(a; ref=550.0, lo=400, hi=700, step=10, K=95)
    base = base_psf(a); N = size(base, 1)
    acc = zeros(N, N, 3)
    for wl in lo:step:hi
        z = max.(fit_center(imresize(base, ratio = wl/ref), N), 0.0)
        rgb = wav2rgb(wl)
        for c in 1:3
            acc[:, :, c] .+= z .* rgb[c]
        end
    end
    Dict(ch => (k = crop_center(acc[:, :, i], K); k ./ sum(k))
         for (i, ch) in enumerate(('r', 'g', 'b')))
end

"Center a PSF kernel in a full-size array; transform to the OTF H(u,v)."
function otf(psf, shp)
    P = zeros(shp); k = size(psf, 1); c = shp[1] ÷ 2 + 1; h = k ÷ 2
    P[c-h:c+h, c-h:c+h] .= psf
    fft(ifftshift(P))
end
```

## Forward model — an image through the display

Convolve each color channel with its PSF (the diffraction) and add sensor noise:

$$ g_c \;=\; f_c \ast h_c + n,\qquad c \in \{r,g,b\}. $$

```julia
padto(a, sz) = (o = zeros(eltype(a), sz); o[1:size(a,1), 1:size(a,2)] .= a; o)

"Linear convolution cropped to size(img)."
function conv_same(img, psf)
    si, sp = size(img), size(psf); sf = si .+ sp .- 1
    full = real(ifft(fft(padto(img, sf)) .* fft(padto(psf, sf))))
    s1, s2 = (sp[1]-1) ÷ 2, (sp[2]-1) ÷ 2
    full[s1+1:s1+si[1], s2+1:s2+si[2]]
end

function through_display(rgb, psfs; noise=0.02, seed=3)
    out = similar(rgb)
    for (i, ch) in enumerate(('r', 'g', 'b'))
        out[:, :, i] = conv_same(rgb[:, :, i], psfs[ch])
    end
    out .+ noise .* randn(MersenneTwister(seed), size(out))
end
```

## Reconstruction 1 — naive Wiener inverse filter

A single fixed regularization $K$ divides out the blur in the Fourier domain
($G=\mathcal{F}\{g_c\}$, capitals denote transforms):

$$ \hat X \;=\; \frac{H^{\ast}}{|H|^{2}+K}\,G,\qquad \hat x = \mathcal{F}^{-1}\{\hat X\}. $$

```julia
function wiener(through, psfs; K=0.02)
    out = similar(through)
    for (i, ch) in enumerate(('r', 'g', 'b'))
        c = through[:, :, i]
        H = otf(psfs[ch], size(c)); G = fft(c)
        out[:, :, i] = real(ifft(G .* conj(H) ./ (abs2.(H) .+ K)))
    end
    out
end
```

## Reconstruction 2 — self-regularizing inverse filter

Constrained least squares: penalize high-frequency roughness with a Laplacian operator $C$, so the
filter sets its own regularization from the residual and noise instead of a hand-tuned constant:

$$ \hat X \;=\; \frac{H^{\ast}}{|H|^{2}+\gamma\,|C|^{2}}\,G. $$

The penalty $\gamma|C|^{2}$ is heavy at high spatial frequencies (where the inverse would amplify
noise) and light at low frequencies (where the image energy lives).

```julia
const LAPLACIAN = Float64[0 -1 0; -1 4 -1; 0 -1 0]

function self_regularizing(through, psfs; gamma=0.015, K0=1e-4)
    out = similar(through)
    for (i, ch) in enumerate(('r', 'g', 'b'))
        c = through[:, :, i]
        H = otf(psfs[ch], size(c)); C = otf(LAPLACIAN, size(c)); G = fft(c)
        out[:, :, i] = real(ifft(G .* conj(H) ./ (abs2.(H) .+ gamma .* abs2.(C) .+ K0)))
    end
    out
end
```

## Peak signal-to-noise ratio

Reconstructions are scored against the original image by

$$ \mathrm{PSNR} \;=\; 10\,\log_{10}\frac{1}{\mathrm{MSE}},\qquad
   \mathrm{MSE} \;=\; \bigl\langle (a-b)^{2} \bigr\rangle, $$

for images $a,b$ on $[0,1]$.

```julia
psnr(a, b) = (m = mean((clamp.(a, 0, 1) .- clamp.(b, 0, 1)) .^ 2); m ≤ 0 ? 99.0 : 10log10(1/m))
```

---

The `a` passed to `spectral_psfs` is a binary transmittance map of the display's open sub-pixel and
interconnect gaps (a generic Diamond-PenTile OLED layout); it builds the three chromatic PSF kernels,
`through_display` applies the diffraction, and the two filters invert it — the naive Wiener with one
fixed constant, the self-regularizing filter deriving its own frequency-dependent regularization.

[← Back to Camera Behind the Display](/projects/camera-behind-display/)
