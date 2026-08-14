# Persona Map — Thinking in Systems

Five personas representing the intended readers of **Thinking in Systems**, derived from the author's known readers and the blog's content.

| Persona | Document | Real-world readers | Primary angle |
| --- | --- | --- | --- |
| The Architect | [persona-architect.md](persona-architect.md) | Senior architects & principal engineers (strongest group) | Architecture & design decisions |
| The Engineering Leader | [persona-engineering-leader.md](persona-engineering-leader.md) | VP Eng, CTO, Director Eng, Engineering Managers | Org, goals, and leadership |
| The Deepening Engineer | [persona-deepening-engineer.md](persona-deepening-engineer.md) | Mid-level to senior engineers | Career growth and craft |
| The Systems Thinker | [persona-systems-thinker.md](persona-systems-thinker.md) | Product managers & adjacent roles | Systems lens and mental models |
| The Agile Coach | [persona-agile-coach.md](persona-agile-coach.md) | Agile coaches & scrum masters | Process, influence, and change |

## How They Relate

The personas form a two-dimensional landscape:

- **Technical depth axis** — from hands-on (Deepening Engineer, Architect) to people/org (Agile Coach, Engineering Leader).
- **Scope axis** — from single-system (Architect, Deepening Engineer) to org-wide (Engineering Leader, Agile Coach).

**Core technical readers:** The Architect and The Deepening Engineer. Both read for engineering depth, though at opposite ends of experience — the Architect pressure-tests, the Deepening Engineer absorbs.

**Core org readers:** The Engineering Leader and The Agile Coach. Both wrestle with goals, incentives, and power — the Leader with authority, the Coach without it.

**The bridge:** The Systems Thinker sits between the two clusters. Not a hands-on engineer and not a manager, she reads the same conceptual layer as everyone else — systems, boundaries, feedback loops — and is the best test of whether a post's *core idea* survives without the code.

## Where Persona Needs Conflict (Design Tension)

### 1. Code vs. no-code

The Architect and Deepening Engineer value concrete examples (the Go snippets, the trade-off tables). The Systems Thinker, Agile Coach, and Engineering Leader are locked out by code-heavy passages. The blog's style — leading with the framework or metaphor, keeping code minimal and illustrative — is exactly the compromise that holds this tension.

### 2. Hand-holding level

- The Architect rejects any "what is DDD" preamble.
- The Deepening Engineer wants *reachable* depth — one level above him, never a primer.
- The Systems Thinker needs accessible depth — respect her intelligence without assuming her background.

The shared sweet spot: **assume systems-thinking vocabulary, explain nothing fundamental, show the reasoning.** A post that opens with the idea and the stakes, and trusts the reader to keep up, serves all three.

### 3. Frameworks for the org cluster vs. novelty for the technical cluster

The Leader and Coach read to extract usable frameworks; the Architect reads to be *surprised* by a fresh angle. Posts that feel like "another take on a known topic" satisfy the org readers but bore the Architect. The release valve: the Architect's "novel angle" is often the same metaphor-driven framing the Systems Thinker forwards — the systems lens itself is the differentiator.

## Content Guidance Summary

| Persona | Lead with | Respect | Avoid |
| --- | --- | --- | --- |
| Architect | Trade-offs, tests, honest costs | Evidence over ideology | Camp-joining, hand-holding |
| Engineering Leader | Named traps, org outcomes | Her time and constraints | Generic management advice |
| Deepening Engineer | Shown reasoning, takeaway models | His trajectory and AI worry | Tutorials, gatekeeping |
| Systems Thinker | Metaphor + mechanism, naming power | Her systems intelligence | Code gates, abstraction without reality |
| Agile Coach | Questions, anti-dogma, incentives | Her lack of authority | Agile evangelism, process prescriptions |

## Primary vs. Secondary

- **Primary audience:** The Architect and The Engineering Leader — the strongest real reader groups, and the ones most likely to share posts with the teams they influence.
- **Secondary:** The Deepening Engineer (highest *loyalty* — takes notes, returns to posts), The Agile Coach (highest *reuse* — turns posts into workshop material), The Systems Thinker (highest *reach* — forwards the conceptual posts across disciplines).

A post that serves the Architect and the Engineering Leader simultaneously — a systems framing of an org or architecture problem, with an honest trade-off and an actionable test — is the blog's strongest pattern.
