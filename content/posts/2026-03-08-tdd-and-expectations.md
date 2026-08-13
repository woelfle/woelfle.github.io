---
title: TDD and Expectations
slug: tdd-and-expectations
description: 'Kent Beck gave us Test-Driven Development. The name, unfortunately, points at tests — when
  the real subject is expectations.'
date: 2026-03-08 09:00:00+00:00
lastmod: 2026-03-08 09:00:00+00:00
draft: true
tags:
- tdd
- testing
- expectations
categories:
- engineering-practices
author: Thomas Wölfle
featureimage: /images/featured-engineering.svg
---

Kent Beck gave us Test-Driven Development, and it was a great step forward. But the name, I have come to believe, steers our attention toward the wrong thing. Test-Driven Development is not about tests. It is about the **expectations** we formulate as tests. Getting the naming right matters, because the name determines what we practice.

<!--more-->

## What the Name Does to Us

Call it *test*-driven and the ritual becomes: write a test, watch it fail, write code, watch it pass. The artifacts — red, green, refactor — become the point. Teams do TDD as a correctness ritual, and it can be that and nothing more: a mechanical cycle that produces a well-covered but unexamined system.

But that cycle is only the shadow of the real activity. The real activity is *deciding, in advance and in public, what the system should do*. A test is a recorded expectation: a sentence about behavior, made executable.

## Expectations Are the Subject

Shift the lens from "tests" to "expectations" and the practice reorganizes itself:

- **TDD is specification, not verification.** The test says what should happen before the code exists. Verification is the by-product; specification is the act.
- **Writing a test first forces the decision.** The discipline is not "code then test" — it is *think first*. What should this function do? What should this behavior be? The test is the thinking, written down.
- **The failing test is a disagreement, not a problem.** Red is the moment the system and the expectation disagree. Making it green means resolving the disagreement — by changing the code, or, occasionally and deliberately, the expectation.

{{< alert >}}
**The naming test.**

Ask a developer why their TDD practice has value and listen for the word "expectation." If it never appears, they are running a ritual — faithfully, safely, and missing the point.
{{< /alert >}}

## The Same Pattern Elsewhere

Notice that the expectation-first pattern is everywhere in this blog: sprint goals, OKRs, ADRs, service-level agreements. All of them are the same discipline — state what you expect *before* you act, in a form that can be checked. TDD is simply the software-shaped instance of that discipline.

Once you see it that way, the practice changes. You stop asking "have I written enough tests?" and start asking "have I said what I expect, clearly and before the code?" The tests become what they always were: expectations made executable.

---

**Reflections:** When did you last write a test that forced you to change the design instead of just the code? Share in the comments.
