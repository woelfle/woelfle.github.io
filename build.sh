#!/usr/bin/env bash
#
# IONOS Deploy Now build script.
# Installs Hugo Extended if needed and builds the static site into ./public.
#
# Keep HUGO_VERSION in sync with .hugo-version and .github/workflows/ci.yml.
#
set -euo pipefail

HUGO_VERSION="$(tr -d '[:space:]' < .hugo-version)"

if ! command -v hugo >/dev/null 2>&1 || ! hugo version | grep -q "${HUGO_VERSION}"; then
  echo "Installing Hugo Extended ${HUGO_VERSION}..."
  mkdir -p /tmp/hugo
  curl -fsSL \
    "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" \
    -o /tmp/hugo/hugo.tar.gz
  tar -xzf /tmp/hugo/hugo.tar.gz -C /tmp/hugo
  export PATH="/tmp/hugo:${PATH}"
fi

hugo version
hugo --minify
