# CSS Customization Guide

This guide explains the custom CSS strategy for the Thinking in Systems blog, built with Hugo and the LoveIt theme.

## File Structure

### `assets/css/_override.scss`

Contains **only theme variable overrides**. This file should never contain custom styles.

```scss
// Good: Variable override
$global-font-size: 16px;
$header-height: 3.5rem;

// Bad: Don't add custom styles here!
// .my-custom-class { ... }
```

### `assets/css/_custom.scss`

Contains **only new custom styles**, not overrides of existing theme styles.

## CSS Variables Reference

The LoveIt theme exposes CSS custom properties for theming. Always use these variables for consistent light/dark mode support:

### Color Variables

- `--color-primary`: Main brand color (blue #2563eb in light mode)
- `--color-contrast-high`: High contrast text (dark gray in light, white in dark)
- `--color-contrast-low`: Subtle borders and text (light gray in light, dim in dark)
- `--color-contrast-lower`: Light backgrounds (very light gray in light, dark overlay in dark)
- `--color-background`: Page background

### Usage Example

```scss
// ✅ GOOD: Uses CSS variables for automatic dark mode support
blockquote {
  background: var(--color-contrast-lower);
  color: var(--color-contrast-high);
  border-left-color: var(--color-primary);
}

// ❌ BAD: Hard-coded colors won't adapt to dark mode
blockquote {
  background: #f0f0f0;
  color: #333;
}
```

## Responsive Design

The custom styles follow a mobile-first approach with breakpoints at **680px**:

```scss
.element {
  // Mobile: default styles
  padding: 1rem;
  
  // Tablet & Desktop
  @media screen and (min-width: 680px) {
    padding: 2rem;
  }
  
  // Large Desktop
  @media screen and (min-width: 1024px) {
    max-width: 1200px;
  }
}
```

## Accessibility Standards (WCAG 2.1 AA)

### Focus States

All interactive elements have explicit focus styles:

```scss
button:focus,
a:focus {
  outline: 2px solid var(--color-primary);
  outline-offset: 2px;
}
```

### Touch Target Size

Interactive elements maintain minimum 44x44px click areas:

```scss
button, a[role="button"] {
  min-height: 44px;
  min-width: 44px;
}
```

### Color Contrast

Always use CSS variables to ensure adequate contrast in both themes. The LoveIt theme is designed to meet WCAG AA standards.

### Reduced Motion

Respects user preferences with `prefers-reduced-motion`:

```scss
@media (prefers-reduced-motion: reduce) {
  * {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

## Dark Mode Implementation

The theme automatically switches between light and dark modes. Use the `[theme="dark"]` selector for dark-specific styles:

```scss
.card {
  background: var(--color-contrast-lower);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  
  transition: box-shadow 0.3s ease;
}

[theme="dark"] .card {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}
```

**Or** use CSS variables (preferred):

```scss
.card {
  background: var(--color-contrast-lower);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s ease;
  
  // No additional code needed - CSS variables adapt automatically!
}
```

## Code Block Styling

### Syntax Highlighting

The `.highlight` class wraps code blocks:

```scss
.highlight {
  border-radius: 0.5rem;
  overflow: hidden;
  
  pre {
    padding: 1rem;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch; // Smooth mobile scrolling
  }
}
```

### Inline Code

Inline code (not in blocks) uses `code:not(.highlight code)`:

```scss
code:not(.highlight code) {
  padding: 0.15rem 0.4rem;
  border-radius: 0.25rem;
  background: var(--color-contrast-lower);
  color: var(--color-contrast-high);
}
```

## Image Optimization

### Lazy Loading

Images are marked for lazy loading:

```scss
img {
  loading: lazy;
  max-width: 100%;
  height: auto;
}
```

### Responsive Images

Use Hugo's image shortcode for responsive variants:

```markdown
{{< image src="/images/photo.jpg" 
    alt="Descriptive alt text"
    caption="Optional caption" 
    height="400"
    width="600" >}}
```

## Print Styles

The CSS includes `@media print` rules to optimize output:

- Hides navigation, footer, and interactive elements
- Prevents page breaks inside figures, code blocks, headings
- Removes backgrounds from code blocks
- Preserves readability with black text

## Mobile Responsiveness Checklist

- [ ] Images scale appropriately on small screens
- [ ] Code blocks have horizontal scroll on mobile (no content overflow)
- [ ] Touch targets are at least 44x44 pixels
- [ ] Navigation menu is accessible on mobile
- [ ] Tables wrap or scroll on screens < 680px
- [ ] Headings and body text remain readable
- [ ] Line lengths don't exceed ~65 characters on mobile

## Common Customization Patterns

### Custom Color Scheme

Override in `_override.scss`:

```scss
$global-link-color: #your-color;
$global-link-hover-color: #your-hover-color;
```

### Custom Fonts

Override in `_override.scss`:

```scss
$global-font-family: 'Your Font', sans-serif;
$code-font-family: 'Your Mono Font', monospace;
```

### Custom Spacing

Override in `_override.scss`:

```scss
$page-width: 56rem;
$content-padding: 2rem;
```

### Add New Component Style

Add to `_custom.scss`:

```scss
// ✅ DO: New component styles go in _custom.scss
.my-component {
  padding: 1.5rem;
  border-radius: 0.5rem;
  background: var(--color-contrast-lower);
  
  // Accessibility: focus state
  &:focus-within {
    outline: 2px solid var(--color-primary);
    outline-offset: 2px;
  }
  
  // Dark mode: CSS variables adapt automatically
}
```

## Testing Your Changes

### Build and Serve

```bash
hugo server --disableFastRender -D
```

Visit `http://localhost:1313` and test:

- All pages render correctly
- Light and dark modes switch smoothly
- Mobile view (Chrome DevTools)
- Print view (Ctrl+P / Cmd+P)

### Lint Your CSS

```bash
# If you add CSS validation (future):
# stylelint 'assets/css/*.scss'
```

### Accessibility Audit

- Use WAVE or Axe DevTools browser extension
- Check focus states with Tab key navigation
- Test with screen readers (NVDA, JAWS, VoiceOver)
- Verify color contrast with WebAIM Contrast Checker

## Performance Best Practices

1. **Minimize HTTP Requests**: All CSS is compiled into a single file
2. **Use CSS Variables**: Better than custom properties for theming
3. **Avoid Inline Styles**: Use classes instead
4. **Lazy Load Images**: Use `loading="lazy"` attribute
5. **Minify Output**: Hugo automatically minifies on `hugo --minify`

## Resources

- [LoveIt Theme Documentation](https://hugoloveit.com/theme-documentation-basics/#style-customization)
- [WCAG 2.1 Accessibility Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [CSS Variables (Custom Properties)](https://developer.mozilla.org/en-US/docs/Web/CSS/--*)
- [Responsive Design Best Practices](https://web.dev/responsive-web-design-basics/)
- [Dark Mode Best Practices](https://web.dev/prefers-color-scheme/)

## Need Help?

When modifying CSS:

1. Always check if a CSS variable exists before using hard-coded colors
2. Test changes in both light and dark modes
3. Verify mobile responsiveness at 680px breakpoint
4. Ensure keyboard navigation works (Tab key)
5. Run `hugo --minify` to check for build errors

---

**Last Updated**: January 27, 2026  
**Framework**: Hugo + LoveIt Theme
