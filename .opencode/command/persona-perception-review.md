---
description: Evaluate an article through the persona perception review (one report per selected persona) plus the colleague-safety gate, saving all reports to docs/evaluations/.
agent: build
---

# Persona Perception Review

Evaluate a markdown article through the eyes of one or more personas, and run
the colleague-safety gate against the same article. Each evaluation gets its
own report, saved to `docs/evaluations/` before you move on to the next one.

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

## Step 4 — Run the colleague-safety gate

Run this for every article, before the persona evaluations. It gates whether the
post can be published at all, so it comes first.

1. Read `docs/publishing/colleague-guardrails.md` fully.
2. Apply the gate to the article, following the document's five dimensions and
   procedure. For the context-dependent dimensions (Practice vs. adoption,
   Most-affected reader), use the `question` tool to ask the author about
   employer context the gate cannot see — which practices the employer uses,
   and who the most-affected reader would be — before finalizing those scores.
3. Write the report to
   `docs/evaluations/<article-slug>-colleague-guardrails.md`
   (e.g. `ai-accelerates-colleague-guardrails.md`), using the report template
   and verdict rule from the guardrails document.
4. Tell the user the saved path and the verdict. If the verdict is anything
   below "Safe to publish", note it — do not silently continue to the persona
   evaluations.

## Step 5 — Evaluate per persona

For each selected persona, in the order the user selected them:

1. Load the skill `evaluating-persona-perception-of-articles` with the `skill`
   tool.
2. Apply the skill to the article (from Step 1) and this persona's document
   (from Step 2/3), following all its phases and its report template.
3. When the evaluation finishes, write the full markdown report to
   `docs/evaluations/<article-slug>-perception-<persona-slug>.md`
   (e.g. `ai-accelerates-perception-engineering-leader.md`).
   Tell the user the saved path.
4. Then proceed to the next selected persona.

Store each report immediately after that evaluation completes. Do not batch or
postpone: one report is saved before the next evaluation starts.

## Completion

When the colleague-safety gate and all selected personas have been evaluated and
saved, summarize the saved report paths, the filename pattern used, and one line
per report on its final verdict — starting with the colleague-safety gate.
