# Deployment Guide

This guide documents the build and deployment process for the **Thinking in Systems** blog, built with Hugo and the Blowfish theme.

## Build & Deployment Workflow

### Local Build

Run the Hugo build command to generate the static site:

```bash
npm run build
# equivalent to: hugo --minify
```

This produces the static site in `public/`.

### Production Build via CI

The CI pipeline in `.github/workflows/ci.yml` runs on every push to `main` and on pull requests:

1. **Lint** – Markdown lint (`npm run lint:md`) → YAML lint (`npm run lint:yml`)
2. **Build** – `hugo --minify`
3. **Status** – No deploy happens on CI; deployment is handled externally

### External Deployment

Deployment is managed by **IONOS Deploy Now** via the `build.sh` script:

```bash
./build.sh
```

The script:

1. Reads the Hugo version from `.hugo-version`
2. Installs `hugo_extended` if not already present
3. Runs `hugo --minify` to build into `public/`
4. Syncs `public/` to the IONOS Deploy Now target

**Deployment URL:** The site is deployed to the IONOS Deploy Now project associated with this repository.

---

## Environment-Specific Configuration

### Hugo Configuration Files

| File | Purpose |
| --- | --- |
| `config/_default/hugo.toml` | Main Hugo config: theme, baseURL, taxonomies, sitemap, pagination |
| `config/_default/params.toml` | Blowfish theme options: color scheme, appearance, homepage layout, article settings |
| `config/_default/languages.en.toml` | English locale: title, description, logo, author |
| `config/_default/menus.en.toml` | Navigation menus: main, footer, legal |

### Local Development vs Production

- **Drafts**: Include locally with `hugo server -D` or `npm run serve`; excluded from production builds
- **Base URL**: Set via `baseURL` in `hugo.toml`; overridden by IONOS Deploy Now environment
- **Environment vars**: Can be set in IONOS Deploy Now project settings for build-time overrides

---

## Rollback Procedures

If a deployment introduces issues:

1. **Identify the previous successful build** – Check the IONOS Deploy Now deployment history
2. **Redeploy previous version** – Use IONOS Deploy Now's "Rollback" feature to restore the prior deployment
3. **Investigate the cause** – Review CI logs, `hugo --minify` output, and changed content

**No manual rollback script is needed** – IONOS Deploy Now maintains a history of deployments and provides a UI for rollback.

---

## Troubleshooting

| Issue | Resolution |
| --- | --- |
| Build fails on CI | Run `hugo --minify` locally to see error output; check for markdown lint or YAML lint issues |
| Local build differs from production | Ensure same Hugo version (`.hugo-version`); verify no environment-specific config differences |
| Site not updating after push | Verify the branch is pushing to `main`; check IONOS Deploy Now project configuration |

---

## Last Updated

August 14, 2026

**Framework:** Hugo + Blowfish Theme (v2.105.0, Hugo module)
