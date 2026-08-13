# Contributing Guide

This guide explains how to contribute to the **Thinking in Systems** blog, built with Hugo and the LoveIt theme. It covers how to write posts, the lint rules enforced in CI, the local development setup, and the publishing workflow.

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

1. **Prerequisites** – Hugo Extended ≥ 0.128.0 (SCSS processing), Node.js ≥ 22 (for lint tooling). See `README.md` for install instructions.
2. **Clone the repository** and create a feature branch:

   ```bash
   git clone <repository-url>
   git checkout -b post/<topic>
   ```

3. **Install dependencies**:

   ```bash
   npm install        # installs markdownlint-cli2, husky, lint-staged
   hugo mod get -u    # fetches the LoveIt theme module
   ```

---

## Local Development Setup

Run the development server with drafts included. Fast render is disabled because the LoveIt theme can break with it:

```bash
npm run serve
# equivalent to: hugo server --disableFastRender -D
```

Visit `http://localhost:1313`. Drafts (`draft: true`) are visible locally but excluded from production builds.

---

## Writing a New Post

Create a post from the archetype (recommended, it pre-fills all front-matter fields):

```bash
hugo new posts/<slug>.md
```

Replace `<slug>` with a short, hyphenated identifier, e.g. `2026-02-10-feedback-loops.md` or `microservices-systems-thinking.md`.

The date in the front-matter defaults to the creation time. Adjust it if you want the post to appear at a different point in the archive. Posts are sorted by `date` in descending order.

### Draft Lifecycle

1. Start with `draft: true` while writing.
2. Review it in the browser at `http://localhost:1313`.
3. Set `draft: false` when it is ready to publish.

---

## Post Front-Matter Template

```yaml
---
title: "Your Post Title"
date: 2026-01-26T10:24:36Z
lastmod: 2026-01-26T10:24:36Z
draft: true
author: "Thomas Wölfle"
description: "One-sentence summary used for SEO meta descriptions and lists."
featuredImage: "/images/your-featured-image.svg"
featuredImagePreview: "/images/your-featured-image.svg"
tags: ["systems-thinking", "engineering"]
categories: ["software-design"]
hiddenFromHomePage: false
hiddenFromSearch: false
toc:
  enable: true
  auto: true
code:
  copy: true
  maxShownLines: 50
math:
  enable: false
---
```

### Field Guide

| Field | Required | Notes |
| --- | --- | --- |
| `title` | Yes | Short, descriptive; may end with `?` (allowed by lint config). |
| `date` | Yes | ISO 8601; controls archive ordering. |
| `lastmod` | No | Update when the content changes materially. |
| `draft` | Yes | `true` hides the post from production. |
| `author` | Yes | Set to the site author by default. |
| `description` | Yes | Fills the meta description; keep it to one sentence. |
| `featuredImage` / `featuredImagePreview` | No | Path under `static/images/`. |
| `tags` | No | Free-form; lowercase. |
| `categories` | No | Lowercase; group posts into sections. |
| `toc` | No | Table of contents settings; `auto: true` picks up headings. |
| `code` | No | Code block behavior; `maxShownLines` collapses long blocks. |
| `math` | No | Enable KaTeX rendering only when the post uses math. |
| `share`, `hiddenFromHomePage`, `hiddenFromSearch` | No | Privacy/visibility flags. |

Use the summary divider to control what appears on list pages and in feeds:

```markdown
<!--more-->
```

---

## Writing Guidelines

- **Front-matter keys** are lowercase, snake_case (e.g. `featuredImage` follows the theme's camelCase convention for nested keys).
- **Headings** form a proper hierarchy: `##` → `###` → `####` (no skipping).
- Use **one blank line** between blocks (paragraphs, lists, code blocks). No double blank lines.
- **External links** open in a new tab with `rel="noopener noreferrer"` (enforced by repo rules).
- **No inline CSS or hard-coded colors** in Markdown; use `static/css/` or the theme's CSS variables (see `docs/CSS_CUSTOMIZATION.md`).
- Prefer **Hugo's built-in functions** and the LoveIt theme's shortcodes over custom ones. Useful LoveIt shortcodes: `admonition`, `image`, `mermaid`, `typeit`.
- Wrap longer prose in **short lines**? No — line length is intentionally not enforced (`MD013` off); write naturally.
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
- `MD041` (first line must be a top-level heading) – **off**

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
5. After merging to `main`, **CI deploys** the site to GitHub Pages automatically.

The CI pipeline lives in `.github/workflows/ci.yml` and runs: markdown lint → yamllint → `hugo --minify` → deploy (push to `main` only).

---

## Repository Structure

```text
./
├── hugo.toml                 # Site configuration
├── config.yaml               # (if used) legacy config
├── content/
│   ├── posts/                # Blog posts (the main content type)
│   ├── tags/                 # Tag taxonomy terms
│   └── categories/           # Category taxonomy terms
├── archetypes/default.md     # Front-matter template for new posts
├── assets/
│   └── css/                  # SCSS overrides (_override.scss, _custom.scss)
├── layouts/
│   ├── _default/             # list.html, single.html, baseof.html, term.html
│   └── partials/             # custom-head, custom-header, custom-footer, custom-social
├── static/                   # Copied verbatim (robots.txt, images, css, js)
├── docs/                     # Guides (CONTRIBUTING.md, CSS_CUSTOMIZATION.md, ...)
├── .markdownlint-cli2.jsonc  # markdownlint config
├── .yamllint                 # yamllint config
├── .github/workflows/ci.yml  # CI/CD pipeline
└── package.json              # npm scripts (serve, build, lint, test)
```

---

## Need Help?

1. Re-read the relevant guide: `docs/CSS_CUSTOMIZATION.md` (styling), `docs/CUSTOM_PARTIALS.md` (layout injections), or this file.
2. Check the [LoveIt Theme Documentation](https://hugoloveit.com/theme-documentation-basics/).
3. Ask in the team channel with the output of `hugo --minify` or the lint command that failed.

---

**Last Updated:** August 12, 2026  
**Framework:** Hugo + LoveIt Theme
