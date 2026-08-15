# Colleague Safety Gate

Every post published on **Thinking in Systems** will be read by the author's
colleagues at their current employer. This gate is the second evaluation that
every article passes through before publishing — alongside the persona
perception review.

The two evaluations answer different questions and must not be conflated:

- **Persona perception review** (`.opencode/command/persona-perception-review.md`):
  *does the post serve the intended reader?* Role, goals, reading behavior.
- **Colleague safety gate** (this document):
  *would the post harm a working relationship?* Shared context, power, and
  the social risk of writing about a system you are inside.

The personas describe who your colleagues *are* professionally. The gate
describes how they read you *as an author they share an org with*. That is why
the gate is not another persona: an "employee persona" would fragment the five
roles instead of answering the relationship question.

---

## When to Run

Run the gate for **every** article that is a candidate for publishing, whether
or not it was written with the current employer in mind. The risk exists
regardless of intent — a post about a generic antipattern can still read as a
comment on a specific team.

The gate runs as Step 4 of the persona perception review command, before the
per-persona evaluations. Its verdict gates publishing; the persona reports
shape the post.

---

## The Five Dimensions

Each dimension is scored 1-5. A score of 5 means the post is safe on that
dimension; a score of 1 means severe risk.

### 1. Identifiability

**5 =** Nothing in the post can be matched to a specific person, team, project,
meeting, incident, or conversation at the current employer — even by a reader
with insider knowledge.

**3 =** Generic details exist that *could* map onto the employer (e.g. "our
quarterly OKR cycle") but no specific team or person is implied.

**1 =** The post names people, teams, projects, or incidents — or uses a
combination of details that unmistakably points at them.

Check for: names; unique domains or project details; dates that align with a
known incident; first-person org references ("in our org", "my team", "the
retro we ran"); distinctive facts a colleague would recognize. Remember that
insiders can triangulate — several individually generic details can still
identify a team.

### 2. Systems Attribution

**5 =** Every observed behavior, failure, or outcome in the post is attributed
to system structure — incentives, feedback loops, constraints, org design —
never to the character or effort of identifiable people.

**3 =** Most outcomes are attributed to the system, but one or two passages
quietly blame a group ("the slow developers", "leadership refuses to…").

**1 =** The post explains outcomes through named or clearly identifiable
individuals and their failings.

This is the blog's own thesis — "system problems wearing component disguises".
A post that follows its own thesis on this dimension is inherently safe. Use
the thesis as the test: does the post diagnose the loop, or the person?

### 3. Practice vs. Adoption

**5 =** The post critiques a practice or concept (Scrum, OKRs, performance
review, hiring) in a way that is clearly about the practice in general, and
could not be read as a comment on how the current employer runs it.

**3 =** The critique of the practice could plausibly be read as a comment on
the employer's adoption — the employer uses the practice, and the post's
examples resemble how they run it.

**1 =** The post reads as an attack on the employer's adoption of the practice,
or cites the employer's own implementation as the case study.

This dimension depends on employer context the evaluator may not see. Before
scoring, confirm with the author which practices (Scrum, OKRs, role
descriptions, etc.) the current employer actually uses.

### 4. Most-Affected Reader

**5 =** The colleague most likely to feel implicated — and their manager —
would read the post as fair, arguable, and about the system, not about them.

**3 =** The most-affected reader would recognize the situation but is likely to
read it as a reasonable general argument, possibly with an uncomfortable moment.

**1 =** The most-affected reader would read the post as a public verdict on
their work or a personal attack, and their manager would agree with that
reading.

To score: name who at the employer feels most implicated, then read the post
from their chair. Ask the author to confirm this choice and the fairness
reading — the evaluator does not know the people involved.

### 5. Invitation vs. Verdict

**5 =** The post frames its claims as invitations — sentences the reader can
push back on, openly revisable, in line with the blog's "read with a pencil"
contract.

**3 =** The post argues its claims strongly but leaves room for disagreement;
no personal verdict is implied.

**1 =** The post delivers a verdict on the reader's work or their team's work,
with no opening for debate.

---

## Procedure

1. Read the article fully, plus the relevant persona docs if a dimension
   references the reader map.
2. Score all five dimensions. Every score needs at least one exact quote from
   the article as evidence, except where the risk is a *combination* of details
   — then name the combination.
3. For dimensions 3 and 4, ask the author for employer context you cannot see
   (which practices the employer uses; who the most-affected reader would be)
   before finalizing the score.
4. Save the report as `docs/evaluations/<article-slug>-colleague-guardrails.md`
   using the template below.
5. Report the verdict.

---

## Report Template

```markdown
# Colleague Guardrail Report: <Article Title>

## Inputs
- **Article:** <path> — <one-line summary>
- **Gate:** Colleague safety — docs/publishing/colleague-guardrails.md

## Context
- **Employer practices named in the post:** <practices, and whether the employer uses them>
- **Most-affected reader identified:** <who, and the fairness reading>

## TL;DR Verdict
<2-3 sentences: overall safety, strongest and weakest dimension, recommendation>

## Dimension Scores

| Dimension | Score (1-5) | Meaning |
|---|---|---|
| Identifiability | x | 5 = nothing traceable to a person/team/project |
| Systems attribution | x | 5 = outcomes attributed to the system, not people |
| Practice vs. adoption | x | 5 = critique targets the practice, not the org's adoption |
| Most-affected reader | x | 5 = most-affected colleague reads it as fair |
| Invitation vs. verdict | x | 5 = claims to argue with, not a verdict on their work |

## Detailed Analysis

### <Dimension>
**Score: x/5 — <one-line read>**
<Reaction narrative from the most-affected colleague's perspective: what they
would feel, think, and say while reading.>
**Evidence:** "<exact quote>" (<section>)
**Gate reference:** <Colleague Safety Gate section 1-5>

... (repeat per dimension)

## Recommendations
Prioritized P0 / P1 / P2 edits, each tied to a scored dimension.

## Final Verdict
- [ ] Safe to publish
- [ ] Publish after minor edits
- [ ] Revise before publishing
- [ ] Rethink: do not publish with current employer context
```

**Verdict rule:** any dimension scored 1-2 means "Rethink: do not publish with
current employer context". Any dimension scored 3 means "Revise before
publishing". All dimensions 4-5 mean "Safe to publish".

---

## Writing Rules That Make the Gate Cheap

Two writing rules prevent most offense risk before the gate runs:

1. **Write at the pattern level.** Genericize every example. If a colleague
   cannot tell whether the post describes them, it cannot offend them.
2. **Never use the first-person org as a case study.** Do not write "in my
   current org, X happens". Write about the pattern, set in a fictional or
   anonymous team.

---

## Relationship to the Persona Perception Review

| | Persona perception review | Colleague safety gate |
| --- | --- | --- |
| Question | Does the post serve the reader? | Does the post harm a relationship? |
| Unit of analysis | The persona (role, goals, fears) | The author's shared context with colleagues |
| Primary dimensions | Offense risk, inspiration, boredom risk, value, credibility | Identifiability, systems attribution, practice vs. adoption, most-affected reader, invitation vs. verdict |
| Verdict on | Publish quality | Publish safety |

A post can pass the persona review and fail the gate, and vice versa. Run both.
