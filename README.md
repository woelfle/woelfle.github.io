# Thinking in Systems

> A System of Thoughts — a private software engineering blog by **Thomas Wölfle** exploring architecture, methodologies, and systems thinking.

## About This Project

**Thinking in Systems** is a private blog and personal knowledge repository where the author documents insights, patterns, and lessons learned throughout a software engineering journey. Content focuses on seeing software as interconnected systems rather than isolated components — covering systems thinking, software architecture and design patterns, engineering practices, and continuous learning.

The site is built with [Hugo](https://gohugo.io/), a fast and flexible static site generator, using the [Blowfish](https://github.com/nunocoracao/blowfish) theme (installed as a Hugo module). It is a **privacy-first** site: analytics, tracking, social links, comments, share buttons, and external CDNs are disabled, and all assets are self-hosted.

### Key Features

- **Privacy-first by design** — no analytics, tracking, or third-party requests
- **Client-side search** — Fuse.js-based search with a local JSON index (modal, reachable from the header/hamburger menu)
- **RSS feeds** for the home page, sections, and taxonomies
- **Legal pages** for Germany/EU compliance (Impressum, Datenschutzerklärung, Imprint, Privacy Policy)
- **Math support (KaTeX)** — opt-in per post
- **Dark/light mode** with automatic theme switching

### Site Structure

| Path | Purpose |
| --- | --- |
| `content/posts/` | Blog posts |
| `content/about.md` | About page and colophon |
| `content/impressum.md`, `content/imprint.md` | Legal notice (German / English) |
| `content/privacy.md`, `content/privacy-policy.md` | Privacy policy (German / English) |
| `config/_default/` | Theme configuration (params, menus, languages, markup, module) |
| `assets/images/` | Featured images and avatar (resolved via `resources.Get`) |
| `static/` | Self-hosted assets (logo, CSS, JS, images) |

## Prerequisites

- **Hugo Extended ≥ 0.165.0** - Project standard (see `.hugo-version`); Blowfish v2 requires Hugo ≥ 0.87
  - Verify your version: `hugo version`
  - Current environment: Hugo v0.165.0 Extended

## Getting Started

```bash
# Install Hugo (with Extended support)
brew install hugo

# Verify Hugo version
hugo version

# Download theme dependencies
hugo mod get -u

# Build the site for production
hugo --minify

# Serve locally with drafts included
hugo server -D
```

## Development Workflow

- Use the scripts in `package.json` for linting and testing.
- Follow the style guidelines defined in the repository (see `AGENTS.md`).
- Contributions should include tests where applicable and pass `hugo test`.

## Contributing

Please read the [CONTRIBUTING.md](./docs/CONTRIBUTING.md) file for guidelines.
