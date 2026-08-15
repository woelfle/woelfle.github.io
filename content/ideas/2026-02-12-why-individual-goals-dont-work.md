---
title: Why Individual Goals Don't Work in Software Engineering Teams
slug: why-individual-goals-dont-work
description: 'Software is built by teams, but many goal systems reward individuals. The mismatch quietly
  destroys the collaboration that produces software.'
date: 2026-02-12 09:00:00+00:00
lastmod: 2026-02-12 09:00:00+00:00
draft: true
tags:
- metrics
- okr
- teamwork
categories:
- engineering-practices
author: Thomas Wölfle
featureimage: /images/featured-performance.svg
---

Software is a team sport with an unusual property: individual output is nearly impossible to measure, because the output is the team's. And yet, year after year, organizations bolt individual goals onto teams that can only deliver together. The result is not neutral. It is corrosive.

<!--more-->

## The Problem with Individual Output

When a feature ships, who produced it? The engineer who wrote the code, the reviewer who caught the bug, the designer who shaped the interaction, the product person who decided what to build, the person who unblocked the deploy. The feature is a *system output*. Assigning it to individuals is like asking which ant built the hill.

Individual goals force a fiction: each person's contribution can be isolated and measured. Since it cannot, the goals get gamed into proxies — lines of code, tickets closed, PRs merged — and the proxies immediately become the real objective.

## What Happens When Goals Are Individual

Watch a team under individual incentives and the pattern is predictable:

- **Hoarding over helping.** Helping a colleague's goal is neutral for your own goal. Helping your own proxy is better. So help quietly dries up — the exact behavior software development runs on.
- **Gaming the proxy.** The moment the measure is announced, effort flows to the measure, not the outcome. Story points inflate. Tickets get sliced into smallest shippable units. The metric improves; the system does not.
- **Collusion with the grain.** People avoid the ambiguous, high-risk work — the refactor, the incident follow-up, the hard integration — because it is unmeasurable and takes time from measurable proxies.
- **Attribution fights.** When it goes well, credit is contested; when it fails, blame is assigned. Both are time spent not building.

## The Team Is the Right Unit

The fix is structural: make the *team's* outcome the goal, not the individual's.

- **Team OKRs, team accountability.** The unit that delivers is the unit that is evaluated.
- **Individual focus lives elsewhere.** Autonomy, mastery, and growth are personal — but they are inputs, not outputs. Measure development on the trajectory, not the throughput.
- **Peer recognition instead of personal targets.** The strongest incentives in software are reputational: being the person others want on their team. That reward emerges naturally — if you do not override it with a bonus formula.

{{< alert >}}
**The test.**

If you can state your team's goal without naming a single person, you have the unit right. If the first thing that comes out is a name, the structure is already misaligned.
{{< /alert >}}

## Why This Feels Unfair to Managers

Individual goals are comforting to managers because they promise individual accountability — someone to praise, someone to blame. The discomfort of team goals is that accountability becomes blurry. That blurriness is not a flaw. It is the accurate representation of how software is actually made.

---

**Reflections:** Have you worked under individual goals that quietly hurt your team? What did it look like? Share in the comments.
