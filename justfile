default:
  @just --list

# Build the static site into ./public
build:
  hugo --minify

# Start the development server with live reload (includes drafts)
serve:
  hugo server -D

# Lint markdown files
lint-md:
  npm run lint:md

# Lint the controlled tag vocabulary (fails on undocumented/non-whitelisted tags)
lint-tags:
  npm run lint:tags

# Auto-fix fixable markdown lint issues
fix-md:
  npx markdownlint-cli2 '**/*.md' --fix

# Lint YAML files
lint-yml:
  npm run lint:yml

# Auto-fix YAML formatting with prettier
fix-yml:
  npx prettier --write '**/*.yml'

# Auto-fix all fixable lint and formatting issues
fix: fix-md fix-yml

# Lint hugo templates (reports unused variables and template performance)
lint-templates:
  hugo --templateMetrics

# Run all linters
lint: lint-md lint-tags lint-yml lint-templates

# Build and run all checks (mirrors the CI pipeline)
check:
  npm run lint:md
  npm run lint:yml
  npm run lint:tags
  hugo --minify

# Run the Hugo test suite
test:
  hugo test

# Run the full CI pipeline: lint + build
ci:
  @just lint
  @just build

# Generate a new post with `just new posts/<slug>.md`
new path:
  hugo new {{path}}
