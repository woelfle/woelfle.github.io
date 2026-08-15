---
title: Down the Road of Complexity
slug: down-the-road-of-complexity
description: 'Milk carton closures got more complex to solve a scaling problem — and the answer was not
  simplification. Software hits the same road.'
date: 2026-01-15 09:00:00+00:00
lastmod: 2026-01-15 09:00:00+00:00
draft: true
tags:
- complexity
- scaling
- systems-thinking
categories:
- systems-thinking
author: Thomas Wölfle
featureimage: /images/featured-systems-thinking.svg
---

Look at the top of a milk carton. That little plastic cap, with its two flaps and the foil underneath, is a monument to complexity — and it began as a simple idea. The story of how the milk carton got complicated is the story of every software system I have ever worked on.

<!--more-->

## The Original Problem

The carton originally had no cap at all — you pinched the top and poured. That worked until the problem scaled: cartons stacked in fridges, tipped over, spilled, needed resealing. The answer to the scaling problem was not to simplify the pour. It was to add a cap. Then a resealable cap. Then a cap with a tamper-evident ring. Then a wider mouth, and a screw thread, and a straw slot, and an ergonomic grip.

## More Complexity Was the Answer

Here is the part I found uncomfortable when I first wrote about this: **the answer was more complexity, not less.** Each addition solved a real problem that the previous, simpler design had created once the context changed. The simple carton was not wrong — it was right for a world that no longer existed.

Software does the same thing, constantly:

- The monolith was simple — until teams collided on deployment. The answer: microservices. More complexity, more moving parts.
- The batch job was simple — until users wanted real-time. The answer: event streams. More complexity.
- The manual release was simple — until releases got frequent. The answer: pipelines and orchestration. More complexity.

## The Discipline Is Deciding Which Complexity

The mistake is not that systems get more complex. It is adding complexity *instead of* thinking, rather than *because of* thinking. The milk carton's escalation happened one solve-at-a-time, each addition locally reasonable and globally uncoordinated.

The discipline, then, is not "keep it simple" as an absolute — that becomes dogma and blocks progress. It is:

1. **Understand the problem the complexity is buying.** Every new layer must answer to a concrete, current problem.
2. **Retire the layers that solved past problems.** The world moves on; the complexity usually stays. The second flap may no longer be needed.
3. **Ask what you would do today.** Most accumulated complexity would not be chosen if you were starting fresh — which is the strongest argument for periodic modernization.

The road of complexity is not wrong. It is the road. What matters is whether you walk it deliberately, or get carried down it one reasonable decision at a time.

---

**Reflections:** What complexity in your system is a milk carton cap — added for a real problem, now solving one that no longer exists? Share in the comments.
