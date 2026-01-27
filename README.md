# Hugo Static Site Project

This repository hosts a static site built with [Hugo](https://gohugo.io/). It follows the conventions and tooling outlined in `AGENTS.md` and adheres to the project’s coding standards.

## Getting Started

```bash
# Install Hugo
brew install hugo

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
