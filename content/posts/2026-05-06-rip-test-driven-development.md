---
title: RIP Test-Driven Development
slug: rip-test-driven-development
description: 'The obituary of TDD is written every year. What keeps dying is not the discipline — it is
  the label, and the expectations behind the label go on living.'
date: 2026-05-06 09:00:00+00:00
lastmod: 2026-05-06 09:00:00+00:00
draft: true
tags:
- tdd
- testing
- engineering
categories:
- engineering-practices
author: Thomas Wölfle
featureimage: /images/featured-engineering.svg
---

The obituaries come out regularly: TDD is dead. Test-Driven Development, they say, has been tried and failed, the discipline is impractical, the hype is over. I keep reading these obituaries, and I keep watching the thing they bury get up and walk away — because what is actually being buried is a caricature, and the discipline it caricatures is still the best thinking tool software has.

<!--more-->

## What the Obituary Actually Describes

The TDD that gets buried is a ritual: *write the test, watch it fail, write the code, watch it pass, repeat*. Performed mechanically, this produces nothing but green builds — a correctness theater that adds overhead and guarantees nothing. That version of TDD deserves its funeral.

But that version was never the discipline. It was the choreography, learned by rote, with the meaning removed. Every practice has a ritual surface and a thinking core, and the rituals get exported while the core stays home. What died is the export.

## The Core That Survives

The living part of TDD is not the red-green-refactor cycle. It is the decision to **state the expectation before the implementation**:

- Write the test, and you have *specified* the behavior — in executable form, before the code biased you.
- Let it fail, and you have *checked* that the expectation and the reality actually disagree — the failure is the evidence that the test can distinguish.
- Make it pass, and you have *built* only what the expectation required — nothing more.

That sequence is not a ritual. It is the discipline of thinking-before-doing, applied to code. It survives every obituary because it is the same discipline as specifications, contracts, and acceptance criteria — it is how any expectation gets made concrete.

{{< alert >}}
**The reason it keeps being "dead."**

TDD is declared dead when it is performed as a choreography. It is alive wherever a developer writes a failing test that forces them to *decide what the code should do*. The label was never the value; the decision was.
{{< /alert >}}

## What Replaces the Label

The newer tooling — property-based testing, snapshot testing, AI-generated test suites, coverage-driven workflows — does not replace the discipline. It renames it. Every one of them is still the act of stating what the system should do and checking it against reality. The technology changes; the expectation does not.

So let the label be buried. What continues is the pattern that TDD, at its best, encoded:

1. **Decide the behavior before building it.**
2. **Make the expectation executable.**
3. **Let the system's disagreement teach you.**

Whatever we call it next — specification-driven development, expectation-driven design — it will be the same living thing wearing a new name. And in a decade, its obituary will be written again, correctly, about the ritual that was never the point.

---

**Reflections:** Was the TDD you learned a ritual or a discipline — and what made the difference? Share in the comments.
