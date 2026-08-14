# AGENTS.md

## 1. Build / Lint / Test Commands

| Action | Command | Notes |
| --- | --- | --- |
| **Build** | `hugo --minify` | Generates the static site in `public/`. Uses Hugo Extended ≥ 0.165.0 (see `.hugo-version`). |
| **Serve (dev)** | `hugo server -D` | Starts a live‑reloading local server on `http://localhost:1313`. The `-D` flag includes draft content. |
| **Serve (npm)** | `npm run serve` | Equivalent to `hugo server -D`. Installs hook: `npm install` (husky/lint-staged). |
| **Lint Markdown** | `npm run lint:md` | Runs markdownlint-cli2 against all `*.md` files. Config in `.markdownlint-cli2.jsonc`. |
| **Lint YAML** | `npm run lint:yml` | Runs yamllint against all `*.yml`/`*.yaml` files. Config in `.yamllint`. |
| **Lint Hugo Templates** | `hugo --templateMetrics` | Reports unused variables and template performance. |
| **Full Lint + Build** | `npm run lint:md && npm run lint:yml && hugo --minify` | Run both linters and a production build. |
| **Run Hugo Test (experimental)** | `hugo test` | Hugo’s experimental test mode. Currently no tests defined; placeholder for future unit/integration tests. |

### CI Pipeline

- **GitHub Actions** (`.github/workflows/ci.yml`): runs on push to `main` and pull requests.
- Pipeline stages: `npm run lint:md` → `yamllint .` → `hugo --minify`.
- CI validates only; deployment is handled by IONOS Deploy Now via `./build.sh` on every `main` push.

## 2. Code Style Guidelines

### General Project Structure

- **Root**: `.github/`, `.devcontainer/`, `README.md`, `AGENTS.md`
- **Content**: `content/posts/`, `content/tags/`, `content/categories/`, `content/about.md`, `content/impressum.md`, `content/imprint.md`, `content/privacy.md`, `content/privacy-policy.md`
- **Layouts**: `layouts/_default/` for `single.html`, `list.html`; `layouts/partials/` for reusable snippets; `layouts/shortcodes/` for shortcodes.
- **Static**: CSS, JS, images. Use `static/` for assets Hugo copies verbatim.
- **Themes**: Managed via Hugo modules (`hugo mod get …`); the active theme is Blowfish (`github.com/nunucoracao/blowfish/v2`). No vendored `themes/` directory.

### Imports & Dependencies

- **Hugo modules**: Prefer `hugo mod get` over Git submodules. Run `hugo mod get -u` to fetch/update.
- **Go modules**: If custom Go code is added, place it in `resources/_gen/` and import via the module path.
- **No global variables**: Keep state local to templates or short‑lived context.
- **npm dependencies**: `package.json` scripts: `build`, `serve`, `lint:md`, `lint:yml`, `test`. Installs: `markdownlint-cli2`, `husky`, `lint-staged`.

### Formatting

- Use `gofmt` for Go files, `prettier --write .` for Markdown/CSS/JS.
- Enforce 2‑space indentation in all config files (`yaml`, `toml`).
- YAML front‑matter keys are lowercase, snake_case.

### Types & Interfaces

- **Strong typing**: Prefer Hugo’s native types (`date`, `string`, `bool`) over raw strings.
- **Custom data**: Store in `data/` as YAML/JSON; load with `site.Data.<name>`.
- **Template functions**: Use built‑in Hugo functions; avoid custom shortcodes unless necessary.
- **Blowfish shortcodes**: Prefer theme-provided shortcodes (alert, katex, figure, gallery, mermaid, chart, badge, lead, icon) over custom ones. See: <https://blowfish.page/docs/shortcodes/>.

### Naming Conventions

- **Files**: snake_case, lowercase. E.g., `first-post.md`, `about-me.html`.
- **Front‑matter keys**: snake_case, lowercase. E.g., `title`, `date`, `draft`.
- **Variables**: camelCase in templates, e.g., `$post := .Page`.
- **Shortcodes**: `my_shortcode.html` in `layouts/shortcodes/`.

### Error Handling

- Hugo templates return a 404 if the page is missing. Use `{{ if .Params.foo }}` checks.
- For Markdown, use proper front‑matter; missing required fields should be flagged by a CI lint step.
- In custom Go code, return errors and propagate them; never ignore with `_ =`.

### Testing & Validation

- **Markdown lint**: Enforce paragraph spacing, heading hierarchy. Relaxed rules in `.markdownlint-cli2.jsonc` (MD013 off, MD026 allows `?.!,`, MD041 off, MD001 enforces h2→h3 hierarchy).
- **YAML lint**: Ensure no tabs; correct indentation. Relaxed rules in `.yamllint` (line-length max 120, truthy check-keys off).
- **Hugo test**: Run `hugo test` to catch rendering errors.
- **CI**: GitHub Actions runs `npm run lint:md` → `yamllint .` → `hugo --minify`. No tests defined yet; placeholder for future unit/integration tests.

## 3. Cursor Rules & Copilot Instructions

### Cursor Rules (`.cursor/rules/`)

- **Rule**: `{{ .Params.* }}` must be followed by a safe access check (`if .Params.foo`).
- **Rule**: No inline CSS in Markdown; use `static/css/` and link via `<link>`.
- **Rule**: All external links must have `rel="noopener noreferrer"` and open in a new tab (`target="_blank").`

### Copilot Guidelines (`.github/copilot-instructions.md`)

- Prefer Hugo’s built‑in functions over custom shortcodes.
- When adding a new shortcode, keep the template minimal and document its parameters in comments.
- Do not use `{{ $var := "" }}` without an immediate assignment; always initialize with a value.
- Avoid using `.` inside loops unless you re‑define the variable (e.g., `{{ range $i, $item := .Params.tags }}`).
- Use `prettier` to format Markdown and YAML files.

## 4. Working with This Project

- **Add new post**: Run `hugo new posts/<slug>.md` (or use archetype `archetypes/default.md`).
- **Front-matter**: All posts require `title`, `slug`, `description`, `date`, `draft`, `author`. Optional: `tags`, `categories`, `featureimage`, `showTableOfContents`, `showWordCount`, `showReadingTime`.
- **Content hierarchy**: Posts start with `##` (the site title is `h1` from front-matter). Do not use `#` (h1) in post content.
- **Summary divider**: Use `<!--more-->` to control what appears on list pages and feeds.
- **Image handling**: Featured images reference paths under `assets/images/` via `resources.Get` or the `featureimage` front-matter field.
- **Deploy workflow**: Write → lint (`npm run lint:md`) → commit → PR to `main`. CI runs lint + build. After merge, IONOS Deploy Now runs `./build.sh` and deploys.

---

**Total lines:** ~180. Feel free to adjust paths or commands as the repository evolves.
