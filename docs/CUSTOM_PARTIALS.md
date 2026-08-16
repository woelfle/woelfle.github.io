# Theme Overrides Guide (Blowfish)

This guide explains how to customize the **Thinking in Systems** blog by overriding Blowfish theme partials without modifying the theme module itself.

## How Overrides Work

Blowfish is installed as a **Hugo module**. Hugo gives the project's own `layouts/` directory precedence over the module's layouts, so you can override any theme partial by creating a file at the same path inside `layouts/`.

For example, to override the theme's `<head>` partial:

```text
# theme (module)                      # project (takes precedence)
themes/blowfish/...                   layouts/partials/head.html
layouts/partials/head.html            layouts/partials/head.html
```

> **Note:** Hugo partials are not chainable — overriding `head.html` replaces the whole file. Copy the theme's version first, then modify it.

## Current State

This project ships a small set of custom partials. Blowfish is otherwise fully self-hosted out of the box (KaTeX, search/Fuse.js, mermaid, chart, etc. are bundled in the theme's `assets/`), so no privacy overrides were needed — unlike the previous LoveIt setup.

| Partial (in `layouts/`) | Purpose |
| --- | --- |
| `partials/author-compact.html` | Slim 40px avatar + name byline, rendered inline with the article-meta row (date · reading time) on single pages via `article-meta/basic.html`. Replaces Blowfish's full 96px author box; the full box was dropped since this is a single-author blog and the footer already carries the bio |

## Common Override Targets

| Target path (in `layouts/`) | Purpose |
| --- | --- |
| `partials/head.html` | Inject `<meta>` tags, extra styles/scripts |
| `partials/footer.html` | Custom footer content |
| `partials/header/basic.html` | Header layout (also `fixed.html`, `fixed-fill.html`, etc.) |
| `partials/article/components/` | Per-article components (hero, meta, related content) |
| `partials/translations.html` | Language switcher behavior |

## Example: Injecting a Meta Tag

To add a meta tag site-wide, override `head.html`:

```text
# 1. Copy the theme's partial:
#    cp <module-cache>/layouts/partials/head.html layouts/partials/head.html
```

Then append your meta tag inside the copied file:

```html
<meta name="theme-color" content="#2563eb" />
```

## Conventions

- Keep overrides **minimal and documented** — a comment in the partial stating its purpose and the theme version it was copied from.
- Prefer Blowfish's built-in parameters over overrides whenever possible (see `docs/CSS_CUSTOMIZATION.md` and `config/_default/params.toml`).
- After overriding a partial, run `hugo --minify` to confirm the template compiles.

## Further Reading

- Hugo template docs: <https://gohugo.io/templates/partials/>
- Blowfish documentation: <https://blowfish.page/docs/>

---

**Framework**: Hugo + Blowfish Theme (v2.105.0, Hugo module)
