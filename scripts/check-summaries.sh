#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Enforces the summary convention for post bundles.
#
# Every post must be a leaf bundle (content/posts/<name>/index.md) and every
# bundle must contain a non-empty summary.md (the curated hero/card summary).
# Flat post .md files directly under content/posts/ are rejected.
#
# Called by `npm run lint:summary`; wired into CI (.github/workflows/ci.yml).
# -----------------------------------------------------------------------------
set -euo pipefail

errors=0

# Reject flat (non-bundle) posts.
for f in content/posts/*.md; do
  if [[ -f "$f" ]]; then
    echo "ERROR: post is not a bundle: $f (move it to <name>/index.md)" >&2
    errors=$((errors + 1))
  fi
done

# Require a non-empty summary.md in every bundle.
for dir in content/posts/*/; do
  if [[ ! -f "${dir}index.md" ]]; then
    continue
  fi
  if [[ ! -f "${dir}summary.md" ]]; then
    echo "ERROR: missing summary.md in ${dir}" >&2
    errors=$((errors + 1))
  elif [[ ! -s "${dir}summary.md" ]]; then
    echo "ERROR: summary.md is empty in ${dir}" >&2
    errors=$((errors + 1))
  fi
done

if [[ $errors -gt 0 ]]; then
  echo "FAILED: $errors post bundle(s) violate the summary convention." >&2
  exit 1
fi

echo "OK: all post bundles contain a non-empty summary.md."
