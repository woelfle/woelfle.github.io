# Hugo Static Site Project

This repository hosts a static site built with [Hugo](https://gohugo.io/). It follows the conventions and tooling outlined in `AGENTS.md` and adheres to the project’s coding standards.

## Prerequisites

- **Hugo Extended ≥ 0.128.0** - Required for SCSS processing and LoveIt theme compatibility
  - Verify your version: `hugo version`
  - Current environment: Hugo v0.154.5 Extended

## Getting Started

```bash
# Install Hugo (with Extended support)
brew install hugo

# Verify Hugo version
hugo version

# Download theme dependencies
hugo mod get -u

# Build the site for production
hugo --minify

# Serve locally with drafts included. Disable fast render when using LoveIT Theme (https://hugoloveit.com/theme-documentation-basics/)
hugo server --disableFastRender -D
```

## Development Workflow
- Use the scripts in `package.json` for linting and testing.
- Follow the style guidelines defined in the repository.
- Contributions should include tests where applicable and pass `hugo test`.

## Contributing
Please read the [CONTRIBUTING.md](./CONTRIBUTING.md) file for guidelines.
