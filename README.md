# tashi.engineer

Professional engineering portfolio for **Tashi Visschedijk**.

Built with [Zola](https://www.getzola.org/) **0.22.1** (Rust static site generator), served by nginx, deployed via Docker on TrueNAS. Public exposure is handled by my VPS running Pangolin.

## Quick start (local)

```bash
# Install Zola: https://www.getzola.org/documentation/getting-started/installation/

zola serve
# → http://127.0.0.1:1111
```

## Docker

```bash
docker compose up -d --build
# → http://localhost:8080
```

The multi-stage Dockerfile:

1. Builds the site with the official Zola image
2. Copies the generated `public/` folder into a minimal nginx:alpine image

## Automated deploy (GitHub Actions → GHCR → TrueNAS)

### Overview

```text
git push → GitHub Actions builds image → pushes to ghcr.io
                                              ↓
                         TrueNAS Custom App pulls image on update/restart
```

### Notes

- The container only serves static files on port 80. DNS, TLS, and public exposure stay with Pangolin.

## Content

All content lives in Markdown under `content/`:

| Path | Purpose |
|------|---------|
| `content/_index.md` | Home |
| `content/about.md` | About |
| `content/resume.md` | Resume page |
| `content/contact.md` | Contact |
| `content/projects/*.md` | Individual project case studies |
| `content/blog/*.md` | Blog posts |

New projects can be added easily by creating a Markdown file in `content/projects/` with front matter (`title`, `description`, `weight`, `extra.tags`, etc.).  
Blog posts can be made in the same way under `content/blog/` with a `date`.

Images are placed in `static/images/` and referenced to from front matter or Markdown.

## Design

Dark, minimal, technical aesthetic.
Colours are defined as CSS variables in `static/style.css`.

## Licence / ownership

Content and design © Tashi Visschedijk.
