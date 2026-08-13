---
title: "Architecture Documentation and ADRs"
date: 2026-05-28T09:00:00Z
lastmod: 2026-05-28T09:00:00Z
draft: false
author: "Thomas Wölfle"
description: "How to document architecture without drowning in diagrams: lightweight ADRs, decision capture, and docs that stay truthful as the code changes."
featuredImage: "/images/featured-architecture.svg"
featuredImagePreview: "/images/featured-architecture.svg"
tags: ["documentation", "architecture", "adr"]
categories: ["architecture"]
hiddenFromHomePage: false
hiddenFromSearch: false

toc:
  enable: true
  auto: true

code:
  copy: true
  maxShownLines: 50

math:
  enable: false
  copyTex: true
---

Most architecture documentation dies the day it is written: it describes a system that used to exist, sits next to a codebase that moved on, and is quietly ignored. The cure is not more documents. It is fewer, smaller documents that answer real questions — and a habit of capturing decisions when they are made.

<!--more-->

## Why Architecture Docs Fail

- They document *what* the code does, which the code already says better.
- They are written once and never maintained.
- They live somewhere far from the code, so nobody updates them.
- They describe the ideal, not the actual, system.

A documentation system only works if updating it is cheaper than not updating it. That rules out big documents reviewed on a schedule. It points to small documents updated at the moment of change.

## The Decision Is the Document

An **Architecture Decision Record** (ADR) is a short note written when a decision is made, capturing the context, the choice, and the trade-offs. It is written *forward* — for the future engineer asking *"why is it like this?"* — not as a retrospective for the past.

```markdown
# ADR-007: Use Postgres for the analytics store

## Status
Accepted

## Context
The analytics queries join large event tables. The initial
prototype used a document store, but reporting queries required
joins and aggregation that became slow and awkward.

## Decision
Use PostgreSQL as the analytics datastore, replacing the
prototype store.

## Consequences
+ Mature SQL tooling, strong consistency, good aggregation.
- More operational surface; scaling requires partitioning
  and careful index design as data grows.
```

{{< admonition tip "Keep ADRs tiny" >}}
A good ADR fits on one screen. If it needs diagrams and appendices, the decision is probably too big — split it into smaller decisions, each with its own record.
{{< /admonition >}}

## Structuring the Rest Sparingly

For the parts that are not decisions, use the smallest structure that answers the questions people actually ask:

| Question | Artifact |
| --- | --- |
| How does this system fit together? | One system context diagram |
| Why was X chosen? | ADRs |
| How do I run this locally? | The README, next to the code |
| What is the current state of the world? | Auto-generated from code, not prose |

Systems that *change* constantly deserve generated or short-lived documentation. Systems that *decide* rarely deserve durable ADRs. Match the artifact to the rate of change.

## Docs as Code

Treat documentation like code: it lives in the repository, it is reviewed in pull requests, and broken references fail the build.

- Keep docs next to the thing they describe.
- Use short-lived branches for changes; merge documentation with the code change it accompanies.
- Render diagrams from text (Mermaid, PlantUML) so they can be diffed.
- Add a CI check that flags dead links in the docs.

The moment a doc is versioned, reviewed, and linked from the code, it stops being an artifact and starts being part of the system.

## A Documentation Budget

Documentation is a cost with a return. Spend it where the questions are expensive to answer: onboarding, operational runbooks, and design decisions. Where the code speaks clearly, save the budget. A slim, truthful set of documents beats a thick, aspirational one every time.

---

**Reflections:** What documentation practice has actually worked in your team, and what has been pure waste? Let me know in the comments.
