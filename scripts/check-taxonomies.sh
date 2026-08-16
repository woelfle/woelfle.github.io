#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# Enforces the controlled taxonomy vocabulary for tags and categories.
#
# Every term referenced in a `tags:` or `categories:` front-matter field on any
# non-draft content file must have a documented term page:
#
#   content/tags/<slug>/_index.md          for tags
#   content/categories/<slug>/_index.md    for categories
#
# A term without such a page is "undocumented" and fails the build — so
# introducing a term always requires documenting it first. The set of accepted
# terms for each taxonomy is therefore the set of term pages that exist under
# the matching directory.
#
# Draft content (front-matter `draft: true`) is excluded: the controlled
# vocabulary governs published content, and draft posts may still experiment
# with provisional terms until they are consolidated.
#
# Called by `npm run lint:taxonomies`; wired into CI (.github/workflows/ci.yml).
# -----------------------------------------------------------------------------
set -euo pipefail

content_root="content"

# Each entry: "field|plural_dir"
#   field     - the front-matter key (e.g. tags, categories)
#   plural_dir - directory holding term pages, relative to content_root
taxonomies=(
  "tags|tags"
  "categories|categories"
)

# Hugo slugifies taxonomy terms to lowercase kebab-case. Match that exactly so
# the whitelist lookup ("does content/<plural_dir>/<slug>/_index.md exist") lines
# up with the URL Hugo actually renders.
slugify() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[ _]+/-/g; s/[^a-z0-9-]+/-/g; s/-+/-/g; s/^-//; s/-$//'
}

# Extract the terms declared in a front-matter field (tags or categories).
# Supports both block-list form (`- term`) and inline-array form (`["a","b"]`).
# Prints one raw term per line (surrounding quotes stripped).
extract_terms() {
  local file="$1" field="$2"
  awk -v field="$field" '
    BEGIN { intax=0 }
    # inline array on the same line, e.g. tags: ["a", "b"]
    $0 ~ ("^" field ":[[:space:]]*\\[") {
      line=$0
      sub(("^" field ":[[:space:]]*\\["), "", line)
      sub(/\][[:space:]]*$/, "", line)
      gsub(/"/, "", line)
      n=split(line, parts, /[[:space:]]*,[[:space:]]*/)
      for (i=1; i<=n; i++) {
        t=parts[i]
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", t)
        if (t != "") print t
      }
      intax=0
      next
    }
    $0 ~ ("^" field ":[[:space:]]*$") { intax=1; next }
    # any other top-level front-matter key ends the block
    intax && /^[A-Za-z_][A-Za-z0-9_-]*:/ { intax=0; next }
    intax && /^[[:space:]]*-/ {
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

for entry in "${taxonomies[@]}"; do
  field="${entry%%|*}"
  dir="${entry#*|}"
  term_dir="${content_root}/${dir}"

  # Reinitialize the associative arrays each iteration. Using `=()` (rather
  # than `unset` + `declare`) keeps them "set" so `set -u` does not trip on
  # empty arrays.
  declare -A seen=()
  declare -A offenders=()

  while IFS= read -r f; do
    # skip this and every taxonomy's own term documentation pages — they define
    # the vocabulary, they do not use it
    if [[ "$f" == "${content_root}/tags/"* || "$f" == "${content_root}/categories/"* ]]; then
      continue
    fi

    # skip drafts: the controlled vocabulary applies to published content
    if [[ "$(is_draft "$f")" == "1" ]]; then
      continue
    fi

    while IFS= read -r raw; do
      [[ -z "$raw" ]] && continue
      slug="$(slugify "$raw")"
      [[ -z "$slug" ]] && continue
      # record first file that introduces each undocumented term
      if [[ -z "${seen[$slug]:-}" ]]; then
        if [[ ! -f "${term_dir}/${slug}/_index.md" ]]; then
          seen[$slug]=1
          offenders[$slug]="$f"
        fi
      fi
    done < <(extract_terms "$f" "$field")
  done < <(find "${content_root}" -type f -name "*.md")

  if (( ${#offenders[@]} > 0 )); then
    printf 'ERROR: %d %s term(s) are not documented under %s/:\n' \
      "${#offenders[@]}" "$field" "$term_dir" >&2
    while IFS= read -r slug; do
      printf '  - %s (e.g. %s)\n  add: %s/_index.md\n' \
        "$slug" "${offenders[$slug]}" "${term_dir}/${slug}" >&2
    done < <(printf '%s\n' "${!offenders[@]}" | sort)
    echo >&2
    echo "To accept a term, document it: create the matching" >&2
    echo "term page with a title, slug, description, and a short prose" >&2
    echo "explanation." >&2
    echo "To drop a term, remove it from the affected post(s) above." >&2
    errors=$((errors + ${#offenders[@]}))
  fi
done

if (( errors > 0 )); then
  echo "FAILED: ${errors} taxonomy term(s) are undocumented." >&2
  exit 1
fi

echo "OK: all taxonomy terms (tags and categories) are documented."
