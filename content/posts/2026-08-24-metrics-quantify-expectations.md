---
title: Metrics Quantify Expectations
slug: metrics-quantify-expectations
description: 'You cannot manage what you do not measure — but the measurement itself bends the system.
  Metrics are a mechanism for communicating expectations, and second-order effects are guaranteed.'
date: 2026-07-20 09:00:00+00:00
lastmod: 2026-07-20 09:00:00+00:00
draft: true
tags:
- metrics
- okr
- leadership
categories:
- engineering-practices
author: Thomas Wölfle
featureimage: /images/featured-performance.svg
---

You can manage only what you can measure. This is not a recommendation — it is a description of what is already happening. Whether you measure explicitly with dashboards or implicitly with gut feeling, you are always measuring. The only question is whether you do it deliberately.

<!--more-->

## Metrics Are Communication

Defining a metric is not bookkeeping. It is a mechanism to communicate your expectations and to make clear how you will know they are met. When a leader says *"we track deployment frequency,"* the team hears *"shipping matters, and here is how I will check."* When a metric is absent, the expectation is still there — it is just unreadable.

This is why vague expectations are dangerous. An unmeasured expectation is interpreted differently by everyone who hears it, and none of those interpretations can be reconciled later. A metric, honestly stated, replaces a fog with a contract.

## The Bending Effect

Here is the uncomfortable part: a metric does not just describe a system. It **bends** it. People optimize for what is measured, because that is where the expectation is visible and the feedback arrives. This is not a flaw to be engineered around; it is the point — and it is also the risk.

The classic second-order effect: measure response time, and the team games the p99 while the p99.9 collapses. Measure velocity, and estimates quietly inflate. Measure uptime, and maintenance windows multiply. Every metric rewards the behavior it measures *first* and the behavior it intends *second*.

{{< alert >}}
**Goodhart's law, stated plainly.**

When a measure becomes a target, it ceases to be a good measure. The discipline is not to trust the metric more than the system it describes.
{{< /alert >}}

## The Contracts That Scale This

The same mechanism that bends an individual bends an organization — which is why the pattern appears again and again as the formal contract between parties:

- **SLAs** turn expectations between a provider and a customer into measurable commitments — availability, latency, error budget. They make the expectation explicit and, at their best, they create the shared language for talking about failure.
- **OKRs** align a whole organization on what matters and how success will be recognized. The key result is the expectation, stated in numbers, so that different teams can check whether they are pulling in the same direction.

In each case the structure is identical: decide the expectation, make it measurable, and accept that the measurement will bend the system. The maturity lies in choosing what gets bent.

## Tell Me What You Measure

There is an old saying worth taking literally: *tell me what you measure and I will tell you what you value.* It works in reverse, too — as a design tool. If you want to know what your team actually believes matters, look at what is on their dashboard. If the dashboard does not match the strategy, the dashboard is winning. The strategy is the story you tell; the metrics are the expectation you enforce. Make them agree.

---

**Reflections:** What metric has bent your system in a direction you did not expect? Share the war story in the comments.
