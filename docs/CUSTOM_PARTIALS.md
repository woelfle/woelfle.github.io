# Custom Partials Guide

## Overview

Custom partials in the `/layouts/partials/` directory allow you to extend and customize the LoveIt theme without modifying theme files directly. These partials are injection points where you can add custom HTML, styling, or functionality.

## Available Custom Partials

### 1. **custom-head.html** (`/layouts/partials/head/custom.html`)

**Purpose:** Inject custom content into the HTML `<head>` section.

**Use Cases:**

- Add custom meta tags (SEO, social, verification)
- Include custom stylesheets
- Add analytics scripts (privacy-respecting options)
- Webmention/IndieWeb support
- Custom fonts or Google Fonts

**Current Includes:**

- Author and generator meta tags
- SEO keywords meta tag
- Robots meta tag (set to prevent indexing for privacy)
- Canonical URL declaration
- OpenGraph meta tags for social sharing
- Security headers (XSS, MIME type, referrer policy)
- Hooks for Webmention, Mastodon, and custom extensions

**How to Extend:**
Uncomment the example sections in the file and customize:

```html
{{- /* Example: Webmention support */ -}}
<link rel="webmention" href="https://webmention.io/example.com/webmention">

{{- /* Example: Mastodon profile link */ -}}
<link rel="me" href="https://mastodon.social/@username">
```

---

### 2. **custom-header.html** (`/layouts/partials/custom-header.html`)

**Purpose:** Inject custom content after the main header but before page content.

**Use Cases:**

- Custom announcement banners
- Breadcrumb navigation
- Additional navigation menus
- Page alerts or notices
- Custom welcome messages

**How to Use:**
Uncomment and customize the example:

```html
<div class="custom-announcement" role="banner">
  <p>This is a custom header announcement</p>
</div>
```

**Styling Notes:**

- Use CSS classes to style custom header content
- Place styles in `/assets/css/_custom.scss`
- Consider responsive design for mobile views

---

### 3. **custom-footer.html** (`/layouts/partials/custom-footer.html`)

**Purpose:** Inject custom content inside the footer section.

**Use Cases:**

- Additional footer links (legal, privacy policy)
- Custom copyright notices
- Supplementary site information
- Social media attribution
- Custom footer sections

**How to Use:**
Uncomment and customize:

```html
<div class="custom-footer-section">
  <p>© 2026 - All rights reserved</p>
  <p><a href="/legal">Legal Notice</a> | <a href="/privacy">Privacy Policy</a></p>
</div>
```

**Integration:**
The custom footer appears alongside the standard LoveIt footer configured in `hugo.toml`:

```toml
[params.footer]
  enable = true
  copyright = true
  author = true
```

---

### 4. **custom-social.html** (`/layouts/partials/custom-social.html`)

**Purpose:** Customize how social links are rendered.

**Use Cases:**

- Custom styling for social icons
- Adding new social platforms not in LoveIt's defaults
- Conditional social link display
- Custom link structures

**How to Use:**

```html
<div class="custom-social-links">
  {{- with .Site.Params.social.GitHub }}
    <a href="https://github.com/{{ . }}" title="GitHub" target="_blank" rel="noopener noreferrer">
      <i class="fab fa-github"></i>
    </a>
  {{- end }}
</div>
```

**Supported Social Platforms (from LoveIt defaults):**
See `hugo.toml` `[params.social]` section for all available platforms including:

- GitHub, LinkedIn, X (formerly Twitter), Mastodon
- YouTube, TikTok, Discord
- Email, RSS
- And 60+ more social networks

---

## Best Practices

### 1. **Keep It Simple**

- Avoid complex logic in partials
- Use Hugo's built-in functions and theme variables
- Reference `{{ .Site.Params }}` for configuration values

### 2. **Maintain Consistency**

- Match the existing LoveIt theme styling
- Use the same color scheme and typography
- Respect dark mode preferences with `[theme=dark]` CSS selectors

### 3. **Performance Considerations**

- Minimize external requests from custom partials
- Use local resources instead of CDNs when possible
- Lazy load third-party scripts where applicable

### 4. **Accessibility**

- Include proper `role` attributes (e.g., `role="banner"`)
- Use semantic HTML (`<nav>`, `<footer>`, etc.)
- Ensure links include `title` and `aria-label` attributes
- Test keyboard navigation

### 5. **Privacy First**

- Avoid tracking scripts or analytics that violate user privacy
- If using external services, ensure GDPR compliance
- The site currently has privacy-first configuration:
  - Analytics disabled
  - Comments disabled
  - Cookies disabled

### 6. **Testing**

Build and preview before deploying:

```bash
# Development mode
hugo server --disableFastRender -D

# Production build
hugo --minify
```

---

## Common Customization Examples

### Example 1: Add a Custom Announcement Banner (custom-header.html)

```html
{{- if .Site.Params.announcement.enable }}
<div class="custom-announcement" role="banner" aria-label="Site announcement">
  <div class="announcement-content">
    {{ .Site.Params.announcement.message | markdownify }}
  </div>
</div>
{{- end }}
```

Add to `hugo.toml`:

```toml
[params.announcement]
  enable = true
  message = "This is a test announcement!"
```

### Example 2: Add Webmention Support (custom-head.html)

```html
<link rel="webmention" href="https://webmention.io/yoursite.com/webmention">
<link rel="pingback" href="https://webmention.io/yoursite.com/xmlrpc">
```

### Example 3: Add Custom Footer Links (custom-footer.html)

```html
<div class="custom-footer-links">
  <ul>
    <li><a href="/sitemap.xml">Sitemap</a></li>
    <li><a href="/privacy">Privacy Policy</a></li>
    <li><a href="/contact">Contact</a></li>
  </ul>
</div>
```

Add CSS in `/assets/css/_custom.scss`:

```scss
.custom-footer-links ul {
  display: flex;
  gap: 1rem;
  list-style: none;
  padding: 0;
  
  a {
    color: var(--link-color);
    text-decoration: none;
    
    &:hover {
      text-decoration: underline;
    }
  }
}
```

---

## Reference

- [LoveIt Theme Documentation](https://hugoloveit.com/)
- [Hugo Template Syntax](https://gohugo.io/templates/introduction/)
- [LoveIt Theme Configuration](https://hugoloveit.com/theme-documentation-basics/#site-configuration)
- [Hugo Functions & Methods](https://gohugo.io/functions/)

---

## File Structure

```text
layouts/
├── partials/
│   ├── custom-header.html      # Header injection
│   ├── custom-footer.html      # Footer injection
│   ├── custom-social.html      # Social links customization
│   └── head/
│       └── custom.html         # Head section injection
```

---

**Last Updated:** 2026-01-27  
**Theme:** Hugo + LoveIt  
**Hugo Extended:** Required for SCSS processing
