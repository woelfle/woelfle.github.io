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

The file contains custom typography, color palettes, layout enhancements, and micro-interactions. It is organized into labeled sections with explanatory comments (see the [custom.css source](assets/css/custom.css) for full details).

### Purpose of rules, mobile breakpoints, and dark mode support

- **Purpose**: Each CSS rule is documented at the top of its section with a comment describing its role (e.g., typography adjustments, color applications, hover effects).
- **Mobile breakpoints**: Media queries use `max-width: 768px`, `max-width: 640px`, and other standard breakpoints to adjust layout, font sizes, and decorative element sizes for mobile devices. The `100dvh` fallback prevents address-bar jump on mobile.
- **Dark mode support**: Dark-mode overrides are scoped with `html.dark` or `.dark` so colors, borders, and shadows adapt correctly. Test overrides in both light and dark mode.

Example custom style with documentation:

```css
/* Mobile-friendly full height.
   The Blowfish base template pins <body> to h-screen (100vh). On mobile the
   vh unit includes the collapsing address bar, so content jumps and the footer
   rides up / is clipped when the bar hides. Switching to auto height with a
   dynamic-viewport minimum keeps the sticky-footer layout (flex column) while
   eliminating the address-bar jump. 100dvh is supported in all modern mobile
   browsers and falls back gracefully on older ones via the 100vh value. */
body {
  height: auto;
  min-height: 100vh;
  min-height: 100dvh;
}
```

### How to modify colors and fonts

All visual properties are exposed as **CSS custom properties (variables)** in `:root` (light) and `:root.dark` (dark) at the top of `assets/css/custom.css`. To modify them:

1. Edit the variable values in `assets/css/custom.css` — no build step required beyond `hugo --minify`.
2. Common variables include:

| Category | Variable | Example | Location |
| --- | --- | --- | --- |
| **Fonts** | `--font-heading` | `"Space Grotesk", system-ui, sans-serif` | `:root` |
| | `--font-body` | `"Inter", system-ui, sans-serif` | `:root` |
| | `--font-code` | `"JetBrains Mono", ui-monospace, monospace` | `:root` |
| | Font sizes | `--font-size-xs` through `--font-size-6xl` | `:root` |
| **Colors (light)** | `--color-primary` | `#2563eb` | `:root` |
| | `--color-bg` | `#f8fafc` | `:root` |
| | `--color-fg` | `#1e293b` | `:root` |
| **Colors (dark)** | `--color-bg` | `#0f172a` | `:root.dark` |
| | `--color-fg` | `#f1f5f9` | `:root.dark` |
| | `--color-primary` | `#60a5fa` | `:root.dark` |

- To add a new color or font, define a new variable following the existing naming convention (e.g., `--color-mycolor: #ff0000;`), then use it via `var(--color-mycolor)`.
