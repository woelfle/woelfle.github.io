---
description: Evaluate an article from the perspective of selected personas using the evaluating-persona-perception-of-articles skill, saving one perception report per persona.
agent: build
---

# Persona Perception Review

Evaluate a markdown article through the eyes of one or more personas. Each persona
gets its own full perception report, saved to `docs/evaluations/` before you move
on to the next persona.

## Step 1 — Ask for the article

Ask the user which article (markdown file) to review. Use the `question` tool.
Offer the markdown posts found under `content/posts/` as choices (enable the
custom-answer field so any other file can be given), and ask for confirmation of
the exact path before proceeding.

## Step 2 — Find personas

Find all persona documents in the repository: markdown files whose frontmatter
contains the tag `rdf:type: pm:Persona`. Search `docs/personas/` (and anywhere
else in the repo) using glob and grep for `rdf:type: pm:Persona`.

For each persona found, extract the name and role from its frontmatter
(`persona:name`, `persona:role`) and the file path.

## Step 3 — Let the user choose personas

Use the `question` tool with `multiple: true`. List every persona found in
Step 2 as an option (label: `<name> — <role>`), so the user can select which
personas the evaluation should be run for.

## Step 4 — Evaluate per persona

For each selected persona, in the order the user selected them:

1. Load the skill `evaluating-persona-perception-of-articles` with the `skill`
   tool.
2. Apply the skill to the article (from Step 1) and this persona's document
   (from Step 2/3), following all its phases and its report template.
3. When the evaluation finishes, write the full markdown report to
   `docs/evaluations/<article-slug>-perception-<persona-slug>.md`
   (e.g. `ai-accelerates-perception-engineering-leader.md`), following the
   existing naming and format used by the reports already in `docs/evaluations/`.
   Tell the user the saved path.
4. Then proceed to the next selected persona.

Store each report immediately after that persona's evaluation completes. Do not
batch or postpone: one report is saved before the next persona is evaluated.

## Completion

When all selected personas have been evaluated and saved, summarize the saved
report paths, the filename pattern used, and one line per persona on its final
verdict.
