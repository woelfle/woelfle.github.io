---
title: Thinking Is Hard, So Is Making Decisions
slug: thinking-is-hard
description: 'TDD, ADRs, sprint goals, and OKRs are the same discipline: thinking things through before
  acting. Nothing is more useless than doing efficiently what should not be done at all.'
date: 2026-03-29 09:00:00+00:00
lastmod: 2026-03-29 09:00:00+00:00
draft: true
tags:
- decision-making
- tdd
- adr
categories:
- engineering-practices
author: Thomas Wölfle
featureimage: /images/featured-architecture.svg
---

Peter Drucker said: *"Nothing is more useless than doing efficiently that which should not be done at all."* If that is true, then the scarcest resource in software is not time, talent, or tooling. It is the willingness to *think before doing* — because thinking is hard, and doing is easy.

<!--more-->

## Why We Skip the Thinking

Doing feels like progress. Writing the test, opening the PR, merging the branch, launching the initiative — each action produces a visible result, a tick on the board, a feeling of motion. Thinking produces nothing visible. It produces an opinion, a decision, a direction — which looks, from the outside, like doing nothing.

So teams optimize for the visible. They write code instead of specifying, merge instead of reviewing, start initiatives instead of deciding whether the initiative should exist. The result is the efficient execution of things that should not be done at all — Drucker's warning, realized at industrial scale.

## The Tools Are All the Same Discipline

The interesting observation is that every serious practice in this blog is a mechanism for *forcing the thinking before the doing*:

- **Test-Driven Development** forces you to state what the code should do — an expectation — before the code exists.
- **Architecture Decision Records** force you to write down why you chose something, at the moment of choosing, while the thinking is still available.
- **Sprint Goals** force the team to say what matters this week — a decision about what not to do.
- **OKRs** force the organization to say what matters this quarter — and by implication, everything else.

These tools look unrelated. They are the same device with different handles: *declare the thinking before the action, in a form that can be checked later.*

## The Work Required to Have an Opinion

There is a useful idea from Charlie Munger about "the work required to have an opinion" — an opinion you have not done the work to earn is not an opinion, it is a guess wearing confidence. The same applies to decisions:

- A test written without thinking about the behavior is a ritual.
- An ADR written after the fact, to justify rather than decide, is a memoir.
- A sprint goal that names everything is no goal.

The discipline is the same in all four: do the thinking deeply enough to *own* the decision, then record it, then act. That sequence — think, decide, do — is what connects TDD to ADRs to goals. They are all attempts to make the hardest part of the work happen on purpose, instead of letting it get skipped.

## The Uncomfortable Conclusion

If thinking and deciding are the actual work, then the meetings, the tickets, the commits — the visible motion — are secondary. And the team that looks busy while avoiding the decisions will be reliably outbuilt by a calmer team that makes a few hard calls and then executes.

---

**Reflections:** Where are you currently executing efficiently something that should not be done at all? Share in the comments.
