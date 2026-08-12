# Project Setup Plan – Private Hugo‑powered Software‑Engineering Blog

## 1. Project Bootstrap - Done

- Create a clean Hugo repo and initialise Git.
- Use the latest stable Hugo version.
- Add a standard `.gitignore` that excludes generated files (`/public`, `/resources/_gen`).

## 2. Theme Installation - Done

- Install the **LoveIT** Theme as a Hugo module
- Configture the **LoveIT** Theme

## 3. Site Configuration - Done

- Create `config.yaml` (or `config.toml`) with:
  - `baseURL`: internal network or custom domain.
  - `title`, `theme`, `languageCode`.
  - `privacy` section to disable analytics and hide social icons.
  - `outputs: [HTML, RSS]` for feeds.

## 4. Content Architecture - Done

- Organise content under:
  - `content/posts/`
  - `content/tags/`
  - `content/categories/`
- Define front‑matter fields: `title`, `date`, `draft`, `tags`, `categories`.
- Enable taxonomies in config.

## 5. Layout & UX - Done

- Design navigation: top‑bar with logo + “About”, “Archive”.
- Optional sidebar or tag cloud for discovery.
- Ensure mobile‑first CSS (use theme’s built‑in SASS or Tailwind if available).

## 6. SEO Setup - Done

- Create `static/robots.txt` with:

  ```txt
  User-agent: *
  Disallow: /
  ```

- Add meta tags in `layouts/partials/head.html`: description, OpenGraph.
- Use Hugo’s `title` and `canonicalURL` helpers.

## 7. Authentication / Access Control

- Deploy behind a private server or VPN.
- Use HTTP Basic Auth (NGINX `auth_basic`) or reverse‑proxy with OAuth.
- For static hosting, consider S3 + CloudFront signed URLs or Netlify Identity.

## 8. CI/CD Pipeline

- Use GitHub Actions (or GitLab CI).
- Workflow steps:
  1. Checkout
  2. `hugo --minify`
  3. Run lint (`markdownlint`, `yamllint`).
  4. Deploy (S3 sync, Netlify deploy hook).
- Store workflow in `.github/workflows/ci.yml`.

## 9. Testing & Quality - Done

- Run `markdownlint` with a `.mdlrc` config (implemented via `markdownlint-cli2` + `.markdownlint-cli2.jsonc`).
- Add husky with lint-staged to run markdown/yaml linting before commits.
- Use `hugo server --buildDrafts` for preview (`npm run serve`).

## 10. Documentation & Onboarding

- Add `docs/CONTRIBUTING.md` (how to write posts, lint rules).
- Provide a `README.md` with repo overview.

## 11. Monitoring & Analytics (Optional)

- Self‑hosted analytics like Matomo if needed, ensuring no personal data tracking.

## 12. Release & Rollout

- Tag release (`v0.1`).
- Publish first post and announce internally via Slack/Email.

---

### Suggested File Structure

```text
./
├── config.yaml
├── content/
│   ├── posts/
│   │   └── 2026-01-26-first-post.md
│   ├── tags/
│   └── categories/
├── layouts/
│   ├── _default/
│   │   ├── list.html
│   │   └── single.html
│   └── partials/
│       ├── head.html
│       └── header.html
├── static/
│   ├── css/
│   ├── js/
│   └── robots.txt
├── themes/
│   └── paperMod/          # or chosen theme
├── assets/
├── data/
└── .github/workflows/ci.yml
```

---

### Suggested Enhancements

1. **Pre‑commit Hooks** – Add husky with lint-staged to run markdown/yaml linting before commits. ✔ Done
2. **Accessibility Checks** – Run axe-core or pa11y in CI to catch common issues.
3. **Module Version Pinning** – Use go.mod for Hugo modules to avoid breaking changes.
4. **TLS & HSTS** – Ensure the hosting environment enforces HTTPS and adds HSTS headers.
5. **Content Validation** – Use hugo check in CI to verify markdown front‑matter and link integrity.
6. **Release Notes** – Automate generation of a changelog using git log --pretty=format:"- %s" > CHANGELOG.md.

### Action Checklist

1. **Bootstrap repo** – `hugo new site .`.
2. **Add theme module** – `hugo mod get github.com/theNewDynamic/PaperMod`.
3. **Configure `config.yaml`** – set site params, privacy, taxonomies.
4. **Create sample post** – `hugo new posts/first-post.md`.
5. **Set up CI** – create `.github/workflows/ci.yml` with build & deploy steps.
6. **Add auth layer** – draft NGINX or Netlify config for access control.
7. **Test locally** – `hugo server`.
8. **Commit & push** – trigger CI, review build artifacts.

Feel free to adjust the theme or deployment target per your infrastructure. This plan covers template choice, layout rationale, SEO, CI/CD publishing pipeline, and privacy controls for a private software‑engineering blog.
