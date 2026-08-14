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

## Design System

Evaluate the current CSS styles and think about a design system with design tokens to streamline it

---

## Legal notices

Update the legal notices (imprint, privacy, licenses)

---

## 🎨 Visual Design & Branding

**Current State:** The site runs the stock Blowfish theme with default styling. The core concept ("system nodes, order, precision") is not yet expressed visually.

### 13. **Refine Post Cards & List Pages**

**Current State:** Posts use the default background hero (`heroStyle = "background"`, blurred full-bleed) with stock meta styling and no custom card treatment.  
**Recommendation:**

- Consistent image aspect ratio (e.g. 16:9), rounded corners, hover zoom/tint.
- Cleaner meta (author/date/category), tags as pills.
- Apply the same card treatment to archive, tags, and categories pages.

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
