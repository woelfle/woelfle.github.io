# Hugo Site Improvements - Blowfish Theme

## Overview

This document outlines recommended improvements to align the Hugo site with Blowfish theme best practices and enhance user experience, SEO, performance, and maintainability.

---

## 🚀 Performance Optimization

### 1. **Optimize Images**

**Current State:** No image optimization strategy documented  
**Recommendation:**

- Use image shortcode instead of raw markdown:

  ```markdown
  {{< image src="/images/photo.jpg" 
      caption="Caption with **markdown**" 
      alt="Alternative text"
      height="400"
      width="600"
      src_s="/images/photo-small.jpg"
      src_l="/images/photo-large.jpg" >}}
  ```

- Create responsive image variants:
  - Small: 600px width
  - Medium: 1000px width
  - Large: 1400px width
- Use WebP format with fallbacks
- Lazy loading enabled by default in Blowfish

---

## 📊 Analytics & Monitoring

### 2. **Plan for Future Analytics (Without Tracking)**

**Current State:** Analytics disabled (✅ privacy-first approach)  
**Recommendation:**

- If analytics needed later, use privacy-respecting options:
  - Plausible Analytics (privacy-focused)
  - Fathom Analytics
  - Simple Analytics
- Blowfish supports these with config:

  ```toml
  [params.analytics]
    enable = false
    # [params.analytics.plausible]
    #   dataDomain = "example.com"
  ```

---

## 📱 Mobile & Accessibility

### 3. **Verify Mobile Responsiveness**

**Current State:** Custom CSS includes media queries  
**Recommendation:**

- Test on actual devices/browsers:
  - Chrome DevTools mobile view
  - Safari on iOS
  - Android browser
- Focus on:
  - Header layout (`params.header.layout` = `"fixed"` / `"basic"`)
  - Code block scrolling
  - Image sizing
  - Navigation menu

### 4. **Enhance Accessibility**

**Current State:** Blowfish provides base accessibility  
**Recommendation:**

- Audit using WAVE or Axe DevTools
- Ensure:
  - All images have alt text
  - Color contrast meets WCAG AA standards
  - Keyboard navigation works
  - Headings follow proper hierarchy
  - Links are distinguishable from text
  - Form elements have labels (if applicable)

---

## 🔐 Security & Privacy

### 5. **Verify Privacy Settings**

**Current State:** Privacy-first configuration (✅ excellent)  

- Analytics disabled
- Cookies disabled
- Comments disabled
- Sharing disabled

**Recommendation:**

- Keep current privacy-first approach
- No tracking code or external services
- Host content privately or self-host

### 32. **Configure CSP Headers (if self-hosted)**

**Recommendation:**

- If deploying to own server, add Content Security Policy headers
- Example nginx config:

  ```nginx
  add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline'" always;
  ```

---

## 🎨 Visual Design & Branding

**Current State:** The site runs the stock Blowfish theme with default styling. The core concept ("system nodes, order, precision") is not yet expressed visually.

### 9. **Typography: Add Self-Hosted Fonts**

**Current State:** All text renders in a self-hosted system stack; code falls back to a generic monospace. No visual character.  
**Recommendation:**

- Self-host two typefaces via `@font-face` in `assets/css/custom.css` (privacy-first: no Google Fonts CDN):
  - Display/headings: e.g. **Space Grotesk** (or "Sora")
  - Body: e.g. **Inter**
  - Code: e.g. **JetBrains Mono** (replaces the dangling "Fira Code" reference)
- Define a type scale (sizes, weights, line-heights, letter-spacing) for headings, body, captions, and code.

### 10. **Establish a Cohesive Color Palette**

**Current State:** Blowfish default palette — neutral grays (Tailwind) with a blue accent. No brand accent, no semantic colors, flat surfaces.  
**Recommendation:**

- Define a primary/accent + semantic color set for **light and dark** modes, applied via `assets/css/custom.css`.
- Use the accent deliberately (links, headings accents, hover states, highlights) rather than as a lone link color.
- Refine the dark palette beyond Tailwind neutrals to match the new brand.

### 11. **Redesign Brand Assets (Logo, Avatar, Featured Images)**

**Current State:** Logo is a blue mandala SVG; avatar is a generic flat "person on a gradient" icon; featured images are `1200×630` SVGs that read as "gradient + centered text" placeholders.  
**Recommendation:**

- Redesign logo and avatar around one consistent "system" motif (nodes + edges) using the new palette.
- Redesign the 5 category featured SVGs (`featured-{systems-thinking,architecture,engineering,performance,learning}.svg`) so they look designed and cohesive instead of like default OG placeholders.

### 12. **Add a Home Page Hero**

**Current State:** The home page uses the stock Blowfish profile layout (avatar, name, short description) followed by a recent-posts list. No value proposition, no visual anchor, no hierarchy beyond the defaults.  
**Recommendation:**

- Replace the plain profile block with a proper hero: larger typography, subtle system-node background motif, value proposition, and a category/topic pill row.
- Feature the latest post as a highlighted hero card; present the rest in a refined grid.

### 13. **Refine Post Cards & List Pages**

**Current State:** Posts use the default background hero (`heroStyle = "background"`, blurred full-bleed) with stock meta styling and no custom card treatment.  
**Recommendation:**

- Consistent image aspect ratio (e.g. 16:9), rounded corners, hover zoom/tint.
- Cleaner meta (author/date/category), tags as pills.
- Apply the same card treatment to archive, tags, and categories pages.

### 14. **Refine Header & Navigation**

**Current State:** Fixed header with default Blowfish nav styling; stock active/hover states.  
**Recommendation:**

- Subtle border + blur (glass effect) on the fixed header.
- Refined active link state (e.g. animated underline), better spacing, polished theme-toggle/search buttons.

### 15. **Polish Post Pages**

**Current State:** Blowfish default output: title, meta, hero image, smart TOC. Code, tables, alerts, and blockquotes are styled by Tailwind prose.  
**Recommendation:**

- Styled featured-image treatment (rounded, shadow, subtle border).
- Reading-progress indicator; refined TOC, meta, and related-posts sections.
- Consistent styling for code blocks, tables, alerts, and blockquotes in light and dark modes.

### 16. **Footer & Micro-Interactions**

**Current State:** Minimal footer; default focus states and transitions.  
**Recommendation:**

- Structured footer (about, quick links, legal, RSS).
- Custom scrollbar/selection colors, refined `:focus-visible` states, smooth transitions and hover states site-wide.

---

## 📚 Documentation

### 6. **Enhance Project Documentation**

**Current State:** README.md and AGENTS.md exist  
**Recommendation:**

- Add `CONTRIBUTING.md` with:
  - How to write new posts
  - Front matter template
  - Local development setup
  - Publishing workflow
- Add `DEPLOYMENT.md`:
  - Build and deployment steps
  - Environment-specific configs
  - Rollback procedures

### 7. **Document Custom Features**

**Current State:** Custom SCSS exists but lacks documentation  
**Recommendation:**

- Add comments to custom styles explaining:
  - Purpose of each rule
  - Mobile breakpoints used
  - Dark mode support
- Create `/docs/CUSTOMIZATION.md`:
  - How to modify colors/fonts
  - Available CSS variables
  - Custom partial usage

### 8. **Create Content Guidelines**

**Current State:** No content guidelines documented  
**Recommendation:**

- Create `/docs/CONTENT_GUIDE.md`:
  - Post structure and conventions
  - When to use admonitions, images, code blocks
  - SEO best practices
  - Markdown style guide
  - Example posts

---

**Last Updated:** 2026-08-13  
**Framework:** Hugo + Blowfish Theme (v2.105.0, Hugo module)
