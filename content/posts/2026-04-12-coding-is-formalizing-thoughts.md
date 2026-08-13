---
title: Coding Is Formalizing Thoughts
slug: coding-is-formalizing-thoughts
description: 'When you write code, you are not translating thoughts into a machine language. You are
  discovering what you actually think — the formalization is the thinking.'
date: 2026-04-12 09:00:00+00:00
lastmod: 2026-04-12 09:00:00+00:00
draft: true
tags:
- coding
- thinking
- software-design
categories:
- software-design
author: Thomas Wölfle
featureimage: /images/featured-architecture.svg
---

There is a moment, early in every design, where the idea feels complete: the architecture is clear, the data flows make sense, the edge cases are "handled." Then you start writing code and discover it was not complete at all. Coding is the act of formalizing thoughts — and the formalization has a way of exposing what the thinking was actually missing.

<!--more-->

## Vague Thoughts Cannot Be Compiled

A natural-language thought is remarkably forgiving. *"The system should handle this gracefully"* — what does that mean? What is "this"? What is "gracefully"? Every listener fills the gaps with their own assumptions, and the sentence survives because the gaps are invisible.

Code has no gaps. Every branch must be decided, every nullable value resolved, every error path taken or ignored. The compiler (or the runtime) does not accept a hand-wave. This is not an obstacle to the work — it is the work. Writing code is the process of discovering what you actually think, by being forced to say it completely.

## The Three Layers of Formalization

**Specifying.** The code states what the system does, precisely enough that another machine — and later, another human — can check it.

**Constraining.** The types and interfaces narrow what is possible. A well-formed signature is a thought made safer: it makes illegal states unrepresentable.

**Executing.** The code is the thought *running*. You cannot claim a design works until you have watched it work — which is why the gap between "I thought about it" and "it runs" is where so much learning happens.

## What the Formalization Reveals

The classic discoveries, in order:

- The edge case you never mentioned in the conversation.
- The dependency you assumed would be simple.
- The naming problem — which is usually a conceptual problem. If you cannot name it honestly, you do not understand it yet.
- The "small" decision that turns out to be a fork in the whole design.

None of these are visible in the vague thought. All of them appear the moment the thought is formalized. This is why writing code by hand — even when an AI drafts it — remains a thinking activity: someone has to do the formalization, or the formalization is never checked against reality.

## The Discipline That Follows

If coding is formalizing thoughts, then:

1. **Write it down before it is "ready."** The point of coding is to *find* the gaps, so start before the thought is complete.
2. **Formalize the expectation first.** Tests are the clearest formalization there is — a precise statement of what should happen.
3. **Review the formalization, not the author.** Code review is a second reader checking whether the formalized thought is the thought you meant.

The reward is not "working code." It is thinking that has been forced to become complete — which is the closest thing to a real design we have.

---

**Reflections:** When did coding reveal that your design was not as complete as you thought — and what did you learn in the gap? Share in the comments.
