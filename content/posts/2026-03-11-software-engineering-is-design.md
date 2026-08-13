---
title: Software Engineering Is Design
slug: software-engineering-is-design
description: 'Software engineering is much more a design process than a production process. Confusing
  the two is the root of most process and staffing mistakes.'
date: 2026-03-11 09:00:00+00:00
lastmod: 2026-03-11 09:00:00+00:00
draft: true
tags:
- software-design
- engineering
- architecture
categories:
- software-design
author: Thomas Wölfle
featureimage: /images/featured-architecture.svg
---

If software were production, the plan would be perfect and the factory would repeat it forever. It is not, and it never will be. Software engineering is a design process — the production version of the same work would be a machine that generates the software automatically from the design. We are nowhere near that, which means the entire profession is one long design conversation.

<!--more-->

## Design, Not Production

Production is the repeated execution of a known process, where every copy is identical and the cost of the first unit dominates. Design is the opposite: the first unit *is* the product, and its cost is the thinking, not the copying.

Software behaves like design in every observable way:

- The cost is in the thinking, the decisions, and the consequences — not in the printing of the bits.
- Every instance is unique; there is no assembly line for code.
- The most expensive error is a *wrong decision made early*, which is the signature failure of design, not of production.

The word "engineering" in our title invites the wrong comparison: we think of bridges and machines, designed once and built many times. Software is designed continuously — the design and the "production" are the same activity, repeated.

## What Goes Wrong When We Treat It as Production

- **Staffing by body count.** Production scales by adding workers to the line. Design scales by adding *effective thinkers* — and an extra person can as easily reduce the design's coherence as increase it.
- **Planning as if the plan survives.** Production can be scheduled linearly because the process is known. Design cannot, because the unknown is the material.
- **Measuring by output.** Production measures units produced. Design measures decisions made well — and an excellent design can be shorter than a bad one.
- **Freezing the design too early.** Production rewards a frozen spec. Design rewards the willingness to revise when learning arrives.

## What Changes If We Accept It

Accepting that this is design changes the practices that actually matter:

1. **Design needs iteration.** The design is not wrong because it changed; it would have been wrong if it had not.
2. **Design needs feedback from the real world.** A designer who never sees the thing used is guessing. (This is the argument that connects to *Evolution and Innovation*.)
3. **Design needs judgment, not just process.** The tools are easy to learn; the decisions are not.

The mistake is not that software is hard. It is that we keep applying production thinking to a design activity, and then wondering why the estimates, the metrics, and the org charts do not fit.

---

**Reflections:** Where does your organization treat software like production — and what would change if it treated it as design? Share in the comments.
