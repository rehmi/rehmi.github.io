# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Rehmi Post's academic/research portfolio site, built with [Franklin.jl](https://franklinjl.org/)
(a Julia static site generator) and deployed to GitHub Pages. Content is Markdown with TOML
front-matter; there is no application code to speak of — the "build" is Franklin rendering Markdown
to HTML.

## Commands

Run from the repo root. First run instantiates the Julia environment.

**Use Julia 1.11**, not the default. `Manifest.toml` is resolved for 1.11.3; Julia 1.12 dropped
`MbedTLS_jll` from the stdlib and fails to precompile Franklin. Locally, prefix commands with
`julia +1.11` (juliaup); CI is pinned to 1.11 in `Deploy.yml`.

```bash
# Live preview with hot reload at http://localhost:8000/
julia +1.11 --project=. -e 'using Franklin; serve()'

# One-off local build (writes to __site/). Add prerender=false,minify=false for a fast HTML-only pass.
julia +1.11 --project=. -e 'using Franklin; optimize()'

# Install/refresh Julia deps (Franklin, NodeJS)
julia +1.11 --project=. -e 'import Pkg; Pkg.instantiate()'
```

Deployment is automatic: pushing to `main` triggers `.github/workflows/Deploy.yml`, which runs
`optimize()` and publishes `__site/` to the `gh-pages` branch root. The live site is served at the
**custom domain `www.rehmi.io`** (CNAME committed on `gh-pages`; `rehmi.github.io` 301-redirects
there). Do not edit `__site/` by hand — it is generated output (gitignored). `.gitlab-ci.yml` is a
legacy GitLab Pages equivalent; GitHub Actions is the live path.

**Preview / staging.** Pushing to the **`preview`** branch triggers `.github/workflows/Preview.yml`,
which builds with `optimize(prepath=<PREVIEW_PATH>)` and deploys into a subfolder of `gh-pages`,
served (unlinked) at `www.rehmi.io/<PREVIEW_PATH>/`. `PREVIEW_PATH` is a repo **secret** (kept out of
source). Workflow to preview before going live: work on `preview` → push → check the preview URL →
merge `preview` → `main` to publish. Two safety rails make this non-destructive: the preview deploy
uses `clean:false` + `target-folder` (never touches the live root), and the live deploy's
`clean-exclude` protects both `CNAME` and the `<PREVIEW_PATH>` folder. The deploy action
(JamesIves v4) has **no `cname` input** — the custom domain is preserved solely by excluding `CNAME`
from the clean. (Repo is public, so the preview path is unlisted, not truly secret.)

## Franklin conventions that matter here

- **Underscore dirs are Franklin infrastructure**, copied/processed specially: `_layout/` (HTML
  templates + `commands.md`), `_css/`, `_assets/`, `_libs/`, `_rss/`. `__site/` is the build output.
- **`config.md`** (root) holds global page variables and the site's `\newcommand` / `\newenvironment`
  definitions — LaTeX-style Franklin macros usable in any page: `\youtube{id}`, `\vimeo{id}`,
  `\fig{...}`, `\columns{}{}`, and the `\project` card / `projectgrid` environment. Add reusable
  embed/layout helpers here.
- **`utils.jl`** (root) defines `hfun_*` Julia functions invoked from Markdown/layout as
  `{{fname args}}`: `hfun_project_grid` / `hfun_project_card` (homepage/project grids, positional
  args url, thumb, title, date, [description] — see `projects/index.md`), `hfun_breadcrumb` and
  `hfun_project_tags` (auto-added to individual project pages via `_layout/head.html` and
  `_layout/page_foot.html`; both no-op off project pages via `_is_project_page()`). Tag pages use
  Franklin's **built-in** `{{taglist}}` (don't re-add a custom one — the old override only scanned
  flat `projects/*.md` and missed the `projects/<slug>/index.md` subdirs).
- **Styling is one file, `_css/site.css`** (loaded after `franklin.css` in `_layout/head.html`),
  built on CSS custom properties in `:root` with a `prefers-color-scheme: dark` block — edit the
  variables to retheme. It defines the single `.project-grid`/`.project-card` system. The old
  `minimal-mistakes.css` + `adjust/custom/archive/projects/project-images/project-cards` stylesheets
  were removed; don't reintroduce per-page `style = "@import ..."` front-matter.
- **`page_foot.html` is auto-appended** by Franklin to each page's content (do not manually
  `{{insert}}` it — that double-renders the footer).
- `config.md` `ignore` excludes `node_modules/ .venv/ OLD/ projects.borked/ rehmi_site/` and the dev
  docs (`INVENTORY.md CLAUDE.md INSTRUCTIONS.md README.md`), so none of those render into the build.

## Content structure

- **`projects/<slug>/index.md`** — one directory per project, with its images/media colocated in the
  same directory. Front-matter is `+++ ... +++` TOML (`title`, `project_date`, `tags`,
  `project_thumb`). `projects/index.md` is the curated grid; `projects/upcoming.md` lists WIP.
- **`projects.borked/`** — draft/incomplete project pages (flat `.md` files, plus `_template.md` /
  `_project_template.md`). Work-in-progress, not part of the polished project set.
- **Top-level pages**: `index.md`, `about.md`, `publications.md`, `PATENTS.md`, `erpatents.md`,
  `contact.md`, `404.md`.
- **`os24/`** — the OpenFINCH project (2024-era), with its own `index.md`.
- **`rehmi_site/`** — a *separate*, self-contained recreation of the old `www.rehmi.info` site from
  archive.org (its own `config.md`, static HTML). It is not the deployed portfolio; treat it as an
  independent sub-site.
- **`OLD/`** — original source material for the portfolio migration (gitignored, Franklin-ignored).
  `content.sh` / `newcontent.sh` are shell archives of that original content; `_material/`
  subdirectories inside `OLD/portfolio/content/` hold source assets worth mining for project pages.

## Working notes (from INSTRUCTIONS.md)

- **Always check a file exists before overwriting or modifying it.** When editing a page, prefer
  targeted edits; the original instructions asked for full-file rewrites when changing a file.
- The repo-map tool returns incorrect results for this tree — use `tree -I _material` to explore
  instead.
- New project pages should follow the template in `INSTRUCTIONS.md` / `README.md`: `+++` front-matter
  (title, project_date, tags, project_thumb) followed by Overview → Technical Details → results/
  publications sections. Thumbnails live under `/assets/thumbnails/<category>/<project>/`.
