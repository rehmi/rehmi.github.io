# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Rehmi Post's academic/research portfolio site, built with [Franklin.jl](https://franklinjl.org/)
(a Julia static site generator) and deployed to GitHub Pages. Content is Markdown with TOML
front-matter; there is no application code to speak of — the "build" is Franklin rendering Markdown
to HTML.

## Commands

Run from the repo root. First run instantiates the Julia environment.

```bash
# Live preview with hot reload at http://localhost:8000/
julia --project=. -e 'using Franklin; serve()'

# One-off local build (writes to __site/)
julia --project=. -e 'using Franklin; optimize()'

# Install/refresh Julia deps (Franklin, NodeJS)
julia --project=. -e 'import Pkg; Pkg.instantiate()'
```

Deployment is automatic: pushing to `main` triggers `.github/workflows/Deploy.yml`, which runs
`optimize()` and publishes `__site/` to the `gh-pages` branch. Do not edit `__site/` by hand — it is
generated output (gitignored). `.gitlab-ci.yml` is a legacy GitLab Pages equivalent; GitHub Actions
is the live path.

## Franklin conventions that matter here

- **Underscore dirs are Franklin infrastructure**, copied/processed specially: `_layout/` (HTML
  templates + `commands.md`), `_css/`, `_assets/`, `_libs/`, `_rss/`. `__site/` is the build output.
- **`config.md`** (root) holds global page variables and the site's `\newcommand` / `\newenvironment`
  definitions — LaTeX-style Franklin macros usable in any page: `\youtube{id}`, `\vimeo{id}`,
  `\fig{...}`, `\columns{}{}`, and the `\project` card / `projectgrid` environment. Add reusable
  embed/layout helpers here.
- **`utils.jl`** (root) defines `hfun_*` Julia functions invoked from Markdown as `{{fname args}}`:
  `hfun_project_grid` / `hfun_project_card` (the homepage/project grids), `hfun_taglist`,
  `hfun_showtags`. This is where dynamic HTML generation lives. Note the project grid is driven by
  positional args (url, thumb, title, date, [description]) — see `projects/index.md` for the format.
- `config.md` sets `ignore = ["node_modules/", "OLD/"]`, so those are never rendered.

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
