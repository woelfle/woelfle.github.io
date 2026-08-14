# Contributing Guide

This guide explains how to contribute to the **Thinking in Systems** blog, built with Hugo and the [Blowfish](https://blowfish.page/) theme. It covers how to write posts, the lint rules enforced in CI, the local development setup, and the publishing workflow.

## Table of Contents

- [Getting Started](#getting-started)
- [Local Development Setup](#local-development-setup)
- [Writing a New Post](#writing-a-new-post)
- [Post Front-Matter Template](#post-front-matter-template)
- [Writing Guidelines](#writing-guidelines)
- [Lint Rules](#lint-rules)
- [Testing Your Changes](#testing-your-changes)
- [Publishing Workflow](#publishing-workflow)
- [Repository Structure](#repository-structure)
- [Need Help?](#need-help)

---

## Getting Started

1. **Prerequisites** – Hugo Extended ≥ 0.165.0 (see `.hugo-version`), Node.js ≥ 22 (for lint tooling). See `README.md` for install instructions.
2. **Clone the repository** and create a feature branch:

   ```bash
   git clone <repository-url>
   git checkout -b post/<topic>
   ```

3. **Install dependencies**:

   ```bash
   npm install        # installs markdownlint-cli2, husky, lint-staged
   hugo mod get -u    # fetches the Blowfish theme module
   ```

---

## Local Development Setup

Run the development server with drafts included:

```bash
npm run serve
# equivalent to: hugo server -D
```

Visit `http://localhost:1313`. Drafts (`draft: true`) are visible locally but excluded from production builds.

---

## Writing a New Post

Create a post from the archetype (recommended, it pre-fills all front-matter fields):

```bash
hugo new posts/<slug>.md
```

Replace `<slug>` with a short, hyphenated identifier, e.g. `2026-02-10-feedback-loops.md` or `microservices-systems-thinking.md`.

The `date` in the front-matter defaults to the creation time. Adjust it if you want the post to appear at a different point in the archive. Posts are sorted by `date` in descending order.

### Draft Lifecycle

1. Start with `draft: true` while writing.
2. Review it in the browser at `http://localhost:1313`.
3. Set `draft: false` when it is ready to publish.

---

## Post Front-Matter Template

```yaml
---
title: "Your Post Title"
slug: your-post-slug
description: "One-sentence summary used for SEO meta descriptions and lists."
date: 2026-01-26T10:24:36Z
lastmod: 2026-01-26T10:24:36Z
draft: true
author: "Thomas Wölfle"
tags: ["systems-thinking", "engineering"]
categories: ["software-design"]
featureimage: "/images/featured-software-design.svg"
showTableOfContents: true
showWordCount: true
showReadingTime: true
---
```

### Field Guide

| Field | Required | Notes |
| --- | --- | --- |
| `title` | Yes | Short, descriptive; may end with `?` (allowed by lint config). |
| `slug` | Yes | URL path segment; used for clean `/posts/<slug>/` permalinks. |
| `description` | Yes | Fills the meta description; keep it to one sentence. |
| `date` | Yes | ISO 8601; controls archive ordering. |
| `lastmod` | No | Update when the content changes materially. |
| `draft` | Yes | `true` hides the post from production. |
| `author` | Yes | Set to the site author by default. |
| `tags` | No | Free-form; lowercase. |
| `categories` | No | Lowercase; group posts into sections. |
| `featureimage` | No | Path under `assets/images/`; shown as the post hero and card image. |
| `showTableOfContents` | No | Enables the table of contents (sticky right TOC on desktop, collapsible on mobile). |
| `showWordCount` / `showReadingTime` | No | Meta display flags. |

Use the summary divider to control what appears on list pages and in feeds:

```markdown
<!--more-->
```

---

## Writing Guidelines

- **Front-matter keys** are lowercase (theme-specific camelCase keys like `featureimage` and `showTableOfContents` follow Blowfish's conventions).
- **Headings** form a proper hierarchy: `##` → `###` → `####` (no skipping).
- Use **one blank line** between blocks (paragraphs, lists, code blocks). No double blank lines.
- **External links** open in a new tab with `rel="noopener noreferrer"` (enforced by repo rules).
- **No inline CSS or hard-coded colors** in Markdown; use `assets/css/custom.css` (see `docs/CSS_CUSTOMIZATION.md`).
- Prefer **Blowfish's shortcodes** over custom ones. Useful ones for this blog: `alert` (callouts/admonitions), `katex` (math), `figure`, `gallery`, `mermaid`, `chart`, `badge`, `lead`, `icon`. List: <https://blowfish.page/docs/shortcodes/>.
- The theme supports **light and dark mode**; avoid anything that breaks in one mode.

---

## Lint Rules

Two linters run locally via pre-commit hooks and in CI:

| Linter | Scope | Config file | Command |
| --- | --- | --- | --- |
| `markdownlint-cli2` | All `*.md` | `.markdownlint-cli2.jsonc` | `npm run lint:md` |
| `yamllint` | All `*.yml` / `*.yaml` (front-matter, workflows) | `.yamllint` | `npm run lint:yml` |

The markdownlint config relaxes the defaults for blog content:

- `MD013` (line length) – **off**
- `MD026` (heading trailing punctuation) – allowed except `. , ; : !`
- `MD041` (first line must be a top-level heading) – **off** (Hugo front-matter is not a heading)
- `MD001` (heading-increment) – **on**; enforces a proper `##` → `###` hierarchy. Post content must not use `#` (h1) — the title from front-matter is the sole h1. See `docs/CONTENT_GUIDE.md` for the full heading convention.

yamllint allows lines up to 120 chars and accepts the `on:` trigger key used by GitHub Actions.

Run both locally before committing:

```bash
npm run lint:md
npm run lint:yml
```

---

## Testing Your Changes

```bash
# Full lint (markdown + yaml)
npm run lint:md && npm run lint:yml

# Production build (catches template errors)
hugo --minify

# Experimental Hugo test mode (placeholder; no tests defined yet)
npm test
```

### Pre-commit Hooks

This repository uses **husky** with **lint-staged**. On every `git commit`, staged files are linted automatically:

- `*.md` → `markdownlint-cli2`
- `*.yml` / `*.yaml` → `yamllint`

If a staged file fails linting, the commit is aborted and the file is reverted to its staged state. Fix the reported issues and commit again.

> The hooks are installed automatically by `npm install` (via the `prepare` script). If they ever stop running, re-run `npm install` or `npx husky`.

---

## Publishing Workflow

1. **Write** the post with `draft: true` and preview it locally.
2. **Lint** it: `npm run lint:md`.
3. **Commit** it with a descriptive message (e.g. `add post on feedback loops`). Pre-commit hooks run automatically.
4. **Push** to a branch and open a pull request to `main`. CI runs lint + build on every PR; no deploy happens.
5. After merging to `main`, the connected IONOS Deploy Now project runs `./build.sh` and deploys the site.

The CI pipeline lives in `.github/workflows/ci.yml` and runs: markdown lint → yamllint → `hugo --minify`. Deployment is handled outside CI by IONOS Deploy Now (`build.sh`).

---

## Repository Structure

```text
./
├── config/
│   └── _default/            # Blowfish config: hugo.toml, params.toml, menus.en.toml,
│                            # languages.en.toml, markup.toml, module.toml
├── content/
│   ├── posts/               # Blog posts (the main content type)
│   ├── about.md             # About page and colophon
│   ├── impressum.md, imprint.md, privacy.md, privacy-policy.md   # Legal pages
├── archetypes/default.md    # Front-matter template for new posts
├── assets/
│   ├── images/              # Featured images and avatar (featureimage, via resources.Get)
│   └── css/custom.css       # Optional custom styles (auto-included by the theme)
├── static/                  # Copied verbatim (logo.svg, robots.txt, css, js)
├── docs/                    # Guides (CONTRIBUTING.md, CSS_CUSTOMIZATION.md, ...)
├── .hugo-version            # Hugo version pin (used by build.sh and the devcontainer)
├── build.sh                 # IONOS Deploy Now build script
├── .markdownlint-cli2.jsonc # markdownlint config
├── .yamllint                # yamllint config
├── .github/workflows/ci.yml # CI pipeline (lint + build validation)
└── package.json             # npm scripts (serve, build, lint, test)
```

---

## Need Help?

1. Re-read the relevant guide: `docs/CSS_CUSTOMIZATION.md` (styling) or this file.
2. Check the [Blowfish Theme Documentation](https://blowfish.page/docs/) and [theme configuration](https://blowfish.page/theme-documentation/).
3. Ask in the team channel with the output of `hugo --minify` or the lint command that failed.

---

**Last Updated:** August 13, 2026  
**Framework:** Hugo + Blowfish Theme (v2.105.0, Hugo module)
