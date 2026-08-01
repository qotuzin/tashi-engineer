# tashi.engineer

Professional engineering portfolio for **Tashi Visschedijk**.

Built with [Zola](https://www.getzola.org/) **0.22.x** (Rust static site generator), served by nginx, deployed via Docker on TrueNAS. Public exposure is handled by existing Pangolin / tunnel infrastructure.

> **Zola 0.22 note:** Syntax highlighting uses the new `[markdown.highlighting]` section (Giallo replaces Syntect). Theme is set to `github-dark` to match the dark site.

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

### 1. Put the repo on GitHub

Create a repository (e.g. `tashi-engineer`) and push this project.  
The workflow lives at `.github/workflows/build-and-push.yml`.

On every push to `main`/`master` (and on manual “Run workflow”), it:

- Builds the multi-stage Docker image
- Pushes to **GitHub Container Registry**:
  - `ghcr.io/<your-github-username>/tashi-engineer:latest`
  - `ghcr.io/<your-github-username>/tashi-engineer:sha-<commit>`

`GITHUB_TOKEN` is enough for public repos. For a **private** package, TrueNAS will need a Personal Access Token (see below).

### 2. Make the package visible (first push)

After the first successful Actions run:

1. GitHub → your profile → **Packages** → `tashi-engineer`
2. Package settings → set visibility to **Public** (simplest for TrueNAS),  
   **or** keep Private and use a PAT with `read:packages` on TrueNAS.

### 3. TrueNAS Custom App

1. **Apps → Discover Apps → Custom App** (or “Install via YAML” / Compose if you prefer).
2. Image:
   ```text
   ghcr.io/<your-github-username>/tashi-engineer:latest
   ```
3. Port: container `80` → host e.g. `8080` (or whatever you use for Pangolin).
4. Restart policy: **Unless Stopped**.
5. If the package is **private**, add registry credentials:
   - Registry: `ghcr.io`
   - Username: your GitHub username
   - Password: a classic PAT with `read:packages` (and `write:packages` only if you push from elsewhere)

### 4. Updating the live site

```bash
# Edit content, commit, push
git add -A && git commit -m "Update project write-up" && git push
```

Wait for the Actions run to finish (green check). Then on TrueNAS:

- **Apps → your portfolio app → Update** (or stop/start so it pulls `:latest`),  
  **or** enable any “pull on start” / watchtower-style option if you use one.

Point Pangolin at `http://<truenas-ip>:<host-port>` as before.

### 5. Local build still works

```bash
docker compose up -d --build
```

No need to use GHCR for day-to-day local testing.

### Notes

- Image name in the workflow is `tashi-engineer` under your GitHub user/org. Change `IMAGE_NAME` in the workflow if you prefer another name.
- Prefer `:latest` on TrueNAS for simplicity; use the `sha-…` tag if you want pinned rollbacks.
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

Add a new project by creating a Markdown file in `content/projects/` with front matter (`title`, `description`, `weight`, `extra.tags`, etc.).  
Add a blog post the same way under `content/blog/` with a `date`.

Place images in `static/images/` and reference them from front matter or Markdown.

Place `resume.pdf` in `static/resume/resume.pdf`.

## Design

Dark, minimal, technical aesthetic (inspired by NASA JPL, Boston Dynamics, SpaceX, GitHub, Linear).

Colours are defined as CSS variables in `static/style.css`.

## Licence / ownership

Content and design © Tashi Visschedijk.
