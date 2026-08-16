# Deployment Plan: IONOS Deploy Now

This document captures the plan for deploying the **Thinking in Systems** blog (Hugo + Blowfish) via IONOS Deploy Now.

## Current State

| Item | Status |
| --- | --- |
| `build.sh` | IONOS Deploy Now build script (installs Hugo Extended, runs `hugo --minify --baseURL "${HUGO_BASEURL:-https://thomaswoelfle.com}"`) |
| `baseURL` | `https://thomaswoelfle.com` (`config/_default/hugo.toml`) |
| CI (`.github/workflows/ci.yml`) | Lint + build only; deployment is external |
| Local build | Verified: `hugo --minify` succeeds (Hugo 0.165.0 extended, Go 1.24.4 for Hugo modules) |
| Git remotes | `github` → `git@github.com:woelfle/website-thomas.woelfle.git`; `origin` → Synology NAS |
| Git state | Phase 1 complete: content edit committed (`1603122`) and pushed to the `github` remote |

## Phase 1 — Pre-flight (repo side) — DONE

1. Commit/push the pending content edit to the `github` remote. Deploy Now hooks into GitHub, so the repository must be current. **Done** (commit `1603122`, "resolve TODOs in ai-accelerates article").
2. Confirm the GitHub repository to connect. **Decision: `woelfle/website-thomas.woelfle`** (the repo name does not matter to Deploy Now).

## Phase 2 — Create the Deploy Now project

1. Open IONOS Deploy Now → "Create project" → authorize GitHub → select repository `woelfle/website-thomas.woelfle`.
2. Select branch `main` and set the build command to `./build.sh` (Hugo is auto-detected, but an explicit command is safer since we need Hugo Extended + Go).
3. **Implemented.** `build.sh` now runs `hugo --minify --baseURL "${HUGO_BASEURL:-https://thomaswoelfle.com}"`. Set `HUGO_BASEURL` in the Deploy Now environment for **preview/staging deployments** so they load assets from their own URL; production falls back to `https://thomaswoelfle.com`.

## Phase 3 — First deployment

1. Deploy Now runs `./build.sh` on push to `main`, generating a staging URL and an initial production URL (`.ionos` subdomain).

## Phase 4 — Custom domain + SSL

1. Add `thomaswoelfle.com` in project settings; point DNS (CNAME/A record) at Deploy Now; Let's Encrypt SSL provisions automatically. No Hugo change needed — `baseURL` already matches.

## Phase 5 — Verify

1. Check homepage, subpages, `sitemap.xml`, `robots.txt`, RSS feed, images, and the 404 page on production and preview.

## Phase 6 — Ongoing workflow

1. Push → `main` → CI validates → Deploy Now builds → deploys. Rollback via Deploy Now deployment history.
2. Update `docs/DEPLOYMENT.md` with final URLs and any changes once the site is live (the `baseURL` override from Phase 2, step 3 is already in place).

## Resolved Questions

- **Which GitHub repository should be connected to Deploy Now?** → `woelfle/website-thomas.woelfle`.
- **Should the `build.sh` baseURL override (Phase 2, step 3) be implemented now?** → Yes; `HUGO_BASEURL` override added to `build.sh`.
