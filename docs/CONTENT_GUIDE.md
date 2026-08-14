# Content Guide

This guide documents the conventions for writing and formatting content on the **Thinking in Systems** blog, built with Hugo and the [Blowfish](https://blowfish.page/) theme. It covers post structure, heading hierarchy, Markdown style, SEO practices, and shortcode usage.

---

## Table of Contents

- [Post Structure](#post-structure)
- [Heading Hierarchy](#heading-hierarchy)
- [Markdown Style Guide](#markdown-style-guide)
- [Images](#images)
- [Shortcodes](#shortcodes)
- [SEO Best Practices](#seo-best-practices)

---

## Post Structure

Every post follows the same front-matter template (see `docs/CONTRIBUTING.md` for the full field guide). The body of each post has three logical sections:

1. **Lead** — the opening paragraph or two that sets up the topic. Optionally preceded by a `<!--more-->` summary divider to control what appears in list/feeds.
2. **Body** — the main content, subdivided with headings.
3. **Footer** — optional closing remarks, a horizontal rule (`---`), and references or further reading.

```markdown
---
title: "Your Post Title"
slug: your-post-slug
description: "One-sentence summary used for SEO and lists."
date: 2026-01-26T10:24:36Z
lastmod: 2026-01-26T10:24:36Z
draft: true
author: "Thomas Wölfle"
tags: ["systems-thinking", "engineering"]
categories: ["software-design"]
featureimage: "/images/featured-software-design.svg"
featureimageAlt: "A diagram showing ..."
---

The opening paragraph that introduces the topic. This text may appear in
list previews and RSS feeds.

<!--more-->

## First Section
...
```

---

## Heading Hierarchy

Hugo renders the front-matter `title` as the page's `<h1>`. Post **content** must **not** reuse `<h1>`; the first content heading should always be `##` (h2).

| Level | Markdown | When to use |
| --- | --- | --- |
| H1 | _(reserved)_ | Automatically rendered from front-matter `title`; do **not** use `#` in post content. |
| H2 | `##` | A major section of the post. Start every post's body with h2. |
| H3 | `###` | A sub-section under an h2. |
| H4 | `####` | A sub-sub-section under an h3. Use sparingly. |

### Rules enforced by markdownlint (CI)

- **MD001** (heading-increment): Headings must not skip levels. `##` → `####` is an error; use `##` → `###` → `####` instead.
- **MD041** (first-line-heading): **Disabled** — Hugo's front-matter block precedes the content, so the first line of the file is `---`, not a heading.
- **MD025** (single-h1): Enforced — a post body must not contain `#` (h1). The title from front-matter is the sole h1.

### Common mistakes to avoid

```markdown
<!-- ❌ Wrong: h1 in content conflicts with the title -->
# Sooner, Not Faster: The Speed Trap

## The evidence is quietly on the side of "it depends"
```

```markdown
<!-- ✅ Correct: start with h2 -->
## Sooner, Not Faster: The Speed Trap

### The evidence is quietly on the side of "it depends"
```

---

## Markdown Style Guide

- **Blank lines**: Exactly one blank line between block elements (paragraphs, headings, lists, code blocks). No double blank lines.
- **Emphasis**: Use `*single asterisks*` for italics (emphasis) and `**double asterisks**` for bold (strong).
- **Code**: Backtick for inline code (`` `code` ``). Fenced blocks with language annotation for blocks:

  ````markdown
  ```go
  func main() {
      // ...
  }
  ```
  ````

- **Lists**: Start ordered lists at 1 and increment by 1. Use `-` for unordered lists.

  ```markdown
  1. First step
  2. Second step
  3. Third step
  ```

- **Horizontal rules**: Use `---` to separate content sections (especially before references).
- **External links** open in a new tab with `rel="noopener noreferrer"` (enforced by repo rules). Example: `[Blowfish](https://blowfish.page/){:target="_blank" rel="noopener noreferrer"}`.
- **No inline CSS or hard-coded colors** in Markdown; use `assets/css/custom.css` (see `docs/CSS_CUSTOMIZATION.md`).

---

## Images

### Featured Images (`featureimage`)

Set in front-matter:

```yaml
featureimage: /images/featured-architecture.svg
featureimageAlt: Diagram of a modular monolith with bounded contexts
```

- `featureimageAlt` is **optional** but recommended. If omitted, the post title is used as the `alt` attribute (reasonable but not ideal for screen readers).
- Use a descriptive `featureimageAlt` when the title alone doesn't convey what the image shows.

### Inline Images

Use the theme's `figure` shortcode or the built-in `image` shortcode instead of raw Markdown:

```markdown
{{< figure
  src="/images/my-diagram.svg"
  alt="Flow of data through the system"
  caption="Figure 1: Data flow through the bounded contexts."
  width="800"
  height="450"
>}}
```

- Always provide an `alt` attribute. If the image is purely decorative, use `alt=""`.

---

## Shortcodes

The theme provides several shortcodes. Prefer built-in shortcodes over custom ones.

| Shortcode | Purpose | Example |
| --- | --- | --- |
| `alert` | Admonition / callout box | `{{< alert "tip" >}}Text{{< /alert >}}` |
| `figure` | Image with caption | `{{< figure src="/img.png" alt="..." >}}` |
| `gallery` | Image gallery | `{{< gallery ... >}}` |
| `katex` | LaTeX math | `{{< katex >}}...{{< /katex >}}` |
| `mermaid` | Diagram rendering | `{{< mermaid >}}...{{< /mermaid >}}` |
| `badge` | Inline badge | `{{< badge "New" >}}` |
| `lead` | Styled lead paragraph | `{{< lead >}}...{{< /lead >}}` |

### Alert shortcode

The `alert` shortcode renders an accessible admonition box with `role="note"` by default. Content inside should be self-contained and not rely on surrounding prose.

```markdown
{{< alert >}}
**Keep ADRs tiny.** A good ADR fits on one screen.
{{< /alert >}}
```

Named parameters are supported for customization:

```markdown
{{< alert role="alert" ariaLive="polite" icon="circle-exclamation" >}}
This is an important warning.
{{< /alert >}}
```

---

## SEO Best Practices

1. **Front-matter `description`**: Write one sentence that summarizes the post for meta descriptions and feed previews. Keep it under ~160 characters.
2. **Slug**: Use a short, hyphenated slug that includes the main keyword.
3. **Title**: Clear, descriptive, may end with `?` (allowed by lint config).
4. **Keywords**: Use `tags` and `categories` thoughtfully — they drive the taxonomy pages.
5. **Images**: Always set `featureimageAlt` for featured images and `alt` on inline figures.
6. **External links**: Use `target="_blank" rel="noopener noreferrer"` for outbound links.
7. **Canonical URLs**: Handled by Hugo/Blowfish automatically; no action needed.

---

## Example Post

The following is a complete example post demonstrating all the conventions documented in this guide:

```markdown
---
title: "An Example Post About Systems Thinking"
slug: example-post-systems-thinking
description: "A brief summary of an example post about systems thinking for SEO and feed previews."
date: 2026-02-10T10:00:00Z
lastmod: 2026-02-10T10:00:00Z
draft: false
author: "Thomas Wölfle"
tags: ["systems-thinking", "engineering"]
categories: ["software-design"]
featureimage: "/images/featured-software-design.svg"
featureimageAlt: "Diagram showing system components and connections"
---

The opening paragraph that introduces the topic. This text may appear in
list previews and RSS feeds.

<!--more-->

## First Major Section

Content for the first section. Here you can discuss key points, use formatting, and include elements documented in this guide.

### Sub-section

Content for a sub-section using `###`. Remember to maintain proper heading hierarchy.

## Second Major Section

More content discussing another aspect of the topic. You can use:

- **Bold** and *italic* text for emphasis
- Inline `` `code` `` and fenced code blocks:

  ```go
  func main() {
      // example code
  }
  ```

- Lists:

  1. First item
  2. Second item
  3. Third item

- Horizontal rule `---` to separate content sections.

## Footer

Optional closing remarks, references, or further reading.

---

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
| `featureimageAlt` | No | Descriptive alt text for the featured image. |

---
**Last Updated:** August 14, 2026  
**Framework:** Hugo + Blowfish Theme (v2.105.0, Hugo module)
