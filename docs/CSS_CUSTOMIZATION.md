# CSS Customization Guide (Blowfish)

This guide explains how to style the **Thinking in Systems** blog, built with Hugo and the [Blowfish](https://blowfish.page/) theme.

Blowfish is **Tailwind-based**: layout and components are styled with utility classes, and article prose is handled by Tailwind's `prose` plugin. Custom styling hooks into the theme through two mechanisms described below.

## Theme Palette

Blowfish ships pre-built color schemes selected via `colorScheme` in `config/_default/params.toml`:

```toml
colorScheme = "blowfish"
```

Available schemes: `autumn`, `avocado`, `bloody`, `blowfish`, `congo`, `fire`, `forest`, `github`, `marvel`, `neon`, `noir`, `ocean`, `one-light`, `princess`, `slate`, `terminal`.

Light/dark appearance is controlled by:

```toml
defaultAppearance = "light"   # valid options: light or dark
autoSwitchAppearance = true   # follow the OS preference by default
```

### Dark Mode Selector

Blowfish toggles light/dark by adding/removing the `dark` class on `<html>`. In custom CSS, scope dark-mode overrides like this:

```css
html.dark .my-component {
  /* dark-mode styling */
}
```

## Custom Styles (`assets/css/custom.css`)

Create `assets/css/custom.css` and it is **automatically included by the theme** (via `layouts/partials/head.html` in the theme module) — no layout override needed.

Example:

```css
/* Self-hosted display font (privacy-first: no Google Fonts CDN) */
@font-face {
  font-family: "JetBrains Mono";
  src: url("/fonts/JetBrainsMono-Regular.woff2") format("woff2");
  font-display: swap;
}

/* Accent override */
.site-title {
  color: #2563eb;
}

/* Light/dark aware overrides */
blockquote {
  border-color: #cbd5e1;
}
html.dark blockquote {
  border-color: #475569;
}
```

Rules of thumb:

- **Never inline styles in Markdown**; keep everything in `assets/css/custom.css`.
- Prefer **CSS custom properties / Tailwind tokens** when the theme exposes them.
- Test every override in **both light and dark mode**.
- Keep privacy-first: no remote fonts, no external stylesheets.

## Configuration Shortcuts

Many visual tweaks need no CSS at all — they are `params.toml` settings:

| Setting | Effect |
| --- | --- |
| `homepage.layout` | Home page layout: `page`, `profile`, `hero`, `card`, `background`, `custom` |
| `article.heroStyle` | Post hero: `basic`, `big`, `background`, `thumbAndBackground` |
| `article.layoutBackgroundBlur` | Blur the full-bleed hero backdrop (`background` style) |
| `list.cardView` / `list.showCards` | Card grid vs. plain list on section/taxonomy pages |
| `footer.showThemeAttribution` | Show/hide the "powered by Blowfish" attribution |

## Further Reading

- Blowfish configuration: <https://blowfish.page/theme-documentation/>
- Blowfish customization docs: <https://blowfish.page/docs/configuration/#custom-css>

---

**Framework**: Hugo + Blowfish Theme (v2.105.0, Hugo module)
