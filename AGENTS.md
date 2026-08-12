# AGENTS.md

## 1. Build / Lint / Test Commands

| Action | Command | Notes |
| --- | --- | --- |
| **Build** | `hugo --minify` | Generates the static site in `public/`. The `--minify` flag removes whitespace and minifies CSS/JS for production. |
| **Serve (dev)** | `hugo server -D` | Starts a live‑reloading local server on `http://localhost:1313`. The `-D` flag includes draft content. Disable fast render when using LoveIT Theme (<https://hugoloveit.com/theme-documentation-basics/>) |
| **Lint Markdown** | `markdownlint '**/*.md'` | Uses the [markdownlint-cli2](https://github.com/igorshubovych/markdownlint-cli2) package. Add a `.mdlrc.json` to customise rules. |
| **Lint YAML** | `yamllint '**/*.yml'` | Validates all YAML files (e.g., front‑matter, config). |
| **Lint Hugo Templates** | `hugo --templateMetrics` | Reports unused variables and template performance. |
| **Run a Single Test** | `hugo test --path 'content/posts/2026-01-26-first-post.md'` | Hugo’s experimental test mode can validate a single page. If not available, use `hugo server --buildDrafts -p 1314` and inspect the rendered output. |
| **Full Test Suite** | `hugo test` | Runs all tests in the project. Currently no tests are defined; this is a placeholder for future unit or integration tests. |
| **Deploy to S3** | `aws s3 sync public/ s3://myblog-website --delete` | Requires AWS CLI configured with appropriate permissions. |
| **Deploy to Netlify** | `netlify deploy --prod` | Requires the Netlify CLI and a site configured in the local directory. |

> **Tip:** Add these scripts to `package.json` (or a Makefile) for one‑click execution:
>
> ```json
> {
>   "scripts": {
>     "build": "hugo --minify",
>     "serve": "hugo server --disableFastRender -D",
>     "lint:md": "markdownlint '**/*.md'",
>     "lint:yml": "yamllint '**/*.yml'",
>     "test": "hugo test"
>   }
> }
> ```

## 2. Code Style Guidelines

### General Project Structure

- **Root**: `config.yaml`, `.github/` (GitHub Actions), `.devcontainer/`, `README.md`, `AGENTS.md`
- **Content**: `content/posts/`, `content/tags/`, `content/categories/`
- **Layouts**: `layouts/_default/` for `single.html`, `list.html`; `layouts/partials/` for reusable snippets.
- **Static**: CSS, JS, images. Use `static/` for assets that Hugo copies verbatim.
- **Themes**: Stored in `themes/`. Use Hugo modules (`hugo mod get …`) to manage themes.

### Imports & Dependencies

- **Hugo modules**: Prefer `hugo mod get` over Git submodules.
- **Go modules**: If custom Go code is added, place it in `resources/_gen/` and import via the module path.
- **No global variables**: Keep state local to templates or short‑lived context.

### Formatting

- Use `gofmt` for Go files, `prettier --write .` for Markdown/CSS/JS.
- Enforce 2‑space indentation in all config files (`yaml`, `toml`).
- YAML front‑matter keys are lowercase, snake_case.

### Types & Interfaces

- **Strong typing**: Prefer Hugo’s native types (`date`, `string`, `bool`) over raw strings.
- **Custom data**: Store in `data/` as YAML/JSON; load with `site.Data.<name>`.
- **Template functions**: Use built‑in Hugo functions; avoid custom shortcodes unless necessary.

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

- **Markdown lint**: Enforce paragraph spacing, heading hierarchy.
- **YAML lint**: Ensure no tabs; correct indentation.
- **Hugo test**: Run `hugo test` to catch rendering errors.
- **CI**: GitHub Actions should run `hugo test`, lint commands, and a build.

## 3. Cursor Rules & Copilot Instructions

### Cursor Rules (`.cursor/rules/`)

- **Rule**: `{{ .Params.* }}` must be followed by a safe access check (`if .Params.foo`).
- **Rule**: No inline CSS in Markdown; use `static/css/` and link via `<link>`.
- **Rule**: All external links must have `rel="noopener noreferrer"` and open in a new tab (`target="_blank").`

### Copilot Instructions (`.github/copilot-instructions.md`)

```text
# Copilot Guidelines for this Project
- Prefer Hugo’s built‑in functions over custom shortcodes.
- When adding a new shortcode, keep the template minimal and document its parameters in comments.
- Do not use `{{ $var := "" }}` without an immediate assignment; always initialize with a value.
- Avoid using `.` inside loops unless you re‑define the variable (e.g., `{{ range $i, $item := .Params.tags }}`).
- Use `prettier` to format Markdown and YAML files.
```

---

**Total lines:** ~150. Feel free to adjust paths or commands as the repository evolves.
