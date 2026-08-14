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

---

## Design System

Evaluate the current CSS styles and think about a design system with design tokens to streamline it

---

## Legal notices

Update the legal notices (imprint, privacy, licenses)

---

## Agent configuration

Update AGENTS.md with the current setup and documentation structure

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
