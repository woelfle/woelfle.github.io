#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Enforces the controlled tag vocabulary.
#
# Every tag referenced in content/ must have a documented term page at
# content/tags/<slug>/_index.md. A tag without such a page is a "new",
# non-whitelisted tag and fails the build — so introducing a tag always
# requires documenting it first.
#
# The set of accepted tags is therefore the set of term pages that exist
# under content/tags/.
#
# Draft content (front-matter `draft: true`) is excluded: the controlled
# vocabulary governs published content, and draft posts may still experiment
# with provisional tags until they are consolidated.
#
# Called by `npm run lint:tags`; wired into CI (.github/workflows/ci.yml).
# -----------------------------------------------------------------------------
set -euo pipefail

content_root="content"
tags_dir="${content_root}/tags"

# Hugo slugifies taxonomy terms to lowercase kebab-case. Match that exactly so
# the whitelist lookup ("does content/tags/<slug>/_index.md exist") lines up with
# the URL Hugo actually renders.
slugify() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[ _]+/-/g; s/[^a-z0-9-]+/-/g; s/-+/-/g; s/^-//; s/-$//'
}

# Extract the tags declared in a markdown file's front-matter `tags:` field.
# Supports both block-list form (`- tag`) and inline-array form (`["a","b"]`).
# Prints one raw tag per line (quotes stripped).
extract_tags() {
  local file="$1"
  awk '
    BEGIN { intags=0 }
    # inline array on the same line, e.g. tags: ["a", "b"]
    /^tags:[[:space:]]*\[/ {
      line=$0
      sub(/^tags:[[:space:]]*\[/, "", line)
      sub(/\][[:space:]]*$/, "", line)
      gsub(/"/, "", line)
      n=split(line, parts, /[[:space:]]*,[[:space:]]*/)
      for (i=1; i<=n; i++) {
        t=parts[i]
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", t)
        if (t != "") print t
      }
      intags=0
      next
    }
    /^tags:[[:space:]]*$/ { intags=1; next }
    # any other top-level front-matter key ends the block
    intags && /^[A-Za-z_][A-Za-z0-9_-]*:/ { intags=0; next }
    intags && /^[[:space:]]*-/ {
      line=$0
      sub(/^[[:space:]]*-[[:space:]]*/, "", line)
      sub(/^["]/, "", line); sub(/["]$/, "", line)
      gsub(/^[[:space:]]+|[[:space:]]+$/, "", line)
      if (line != "") print line
    }
  ' "$file"
}

# Returns "1" when the given markdown file is a draft (front-matter
# `draft: true`), "0" otherwise (including files with no draft key, which
# Hugo treats as published). Hugo front-matter here is YAML delimited by `---`.
is_draft() {
  awk '
    BEGIN { fm=0; d=0 }
    /^---[[:space:]]*$/ {
      if (!fm) { fm=1; next }
      print (d ? 1 : 0)
      exit
    }
    fm && /^draft[[:space:]]*:/ {
      v=$0
      sub(/^draft[[:space:]]*:[[:space:]]*/, "", v)
      sub(/[[:space:]]*#.*$/, "", v)          # strip trailing inline comment
      sub(/[[:space:]]+$/, "", v)
      gsub(/^["'"'"']|["'"'"']$/, "", v)       # strip surrounding quotes
      if (tolower(v) == "true") d=1
    }
  ' "$1"
}

errors=0

# Collect (tag -> file) pairs for every tag used in content/, excluding the
# term documentation pages themselves.
declare -A seen
declare -A offenders_file

while IFS= read -r f; do
  # skip term documentation pages — they define the vocabulary, they do not use tags
  case "$f" in
    "${tags_dir}/"*) continue ;;
  esac

  # skip drafts: the controlled vocabulary applies to published content
  if [[ "$(is_draft "$f")" == "1" ]]; then
    continue
  fi

  while IFS= read -r raw; do
    [[ -z "$raw" ]] && continue
    slug="$(slugify "$raw")"
    [[ -z "$slug" ]] && continue
    # record first file that introduces each undocumented tag
    if [[ -z "${seen[$slug]:-}" ]]; then
      if [[ ! -f "${tags_dir}/${slug}/_index.md" ]]; then
        seen[$slug]=1
        offenders_file[$slug]="$f"
      fi
    fi
  done < <(extract_tags "$f")
done < <(find "${content_root}" -type f -name "*.md")

if (( ${#offenders_file[@]} > 0 )); then
  echo "ERROR: ${#offenders_file[@]} tag(s) are not whitelisted (documented under content/tags/):" >&2
  while IFS= read -r slug; do
    printf '  - %s (e.g. %s)\n  add: %s\n' "$slug" "${offenders_file[$slug]}" "${tags_dir}/${slug}/_index.md" >&2
  done < <(printf '%s\n' "${!offenders_file[@]}" | sort)
  echo >&2
  echo "To accept a tag, document it: create ${tags_dir}/<slug>/_index.md with a" >&2
  echo "title, slug, description, and a short prose explanation." >&2
  echo "To drop a tag, remove it from the affected post(s) above." >&2
  errors=1
fi

if (( errors > 0 )); then
  echo "FAILED: tag vocabulary is not fully documented." >&2
  exit 1
fi

echo "OK: all tags are whitelisted (documented under ${tags_dir}/)."
