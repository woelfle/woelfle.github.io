---
title: "Feedback Loops in System Design"
date: 2026-02-02T09:00:00Z
lastmod: 2026-02-02T09:00:00Z
draft: false
author: "Thomas Wölfle"
description: "Understand balancing and reinforcing feedback loops, the invisible forces that shape how software systems behave under load, and how to design for them."
featuredImage: "/images/featured-systems-thinking.svg"
featuredImagePreview: "/images/featured-systems-thinking.svg"
tags: ["systems-thinking", "architecture", "feedback-loops"]
categories: ["systems-thinking"]
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

Every software system is governed by feedback loops, whether we acknowledge them or not. When an outage cascades through a fleet of services, when a cache thundering herd takes down a database, or when a team's velocity slowly decays over months — these are not random events. They are the emergent behavior of loops we never drew on the whiteboard.

<!--more-->

## The Two Flavors of Feedback

Systems thinkers distinguish two fundamental kinds of feedback loops.

### Reinforcing Loops

A reinforcing loop amplifies whatever it touches. Small changes compound in the same direction, which makes these loops the engine of both runaway growth and catastrophic collapse.

| Property | Reinforcing loop | Balancing loop |
| --- | --- | --- |
| Direction | Amplifies change | Counteracts change |
| Steady state | Explosive or collapse | Self-correcting |
| Example in software | Retry storms, technical debt | Autoscaling, rate limiting |
| Slang | "Vicious / virtuous cycle" | "Equilibrium" |

```text
Retry storm (reinforcing):

failure -> request retried -> more load
    ^                           |
    |                           v
    +----- latency rises -------+
```

### Balancing Loops

A balancing loop pushes a system back toward a goal. Rate limiters, circuit breakers, autoscalers, and backpressure mechanisms are all balancing loops we build deliberately to keep reinforcing loops in check.

## Where Systems Go Wrong

### The Retry Storm

The classic failure cascade starts innocently: one database replica lags, a few requests time out, and the client library dutifully retries. That doubles the load. Latency rises, more requests time out, and the client retries again. Within minutes you have a reinforcing loop of self-inflicted load.

{{< admonition tip "Defense in depth" >}}
Combine a **bounded retry budget** (max retries, exponential backoff) with a **circuit breaker** at the caller and **connection pooling limits** at the server. Every layer that absorbs a spike prevents the loop from closing.
{{< /admonition >}}

### The Caching Thundering Herd

When a popular cache key expires and thousands of concurrent requests all miss at once, they fall through to the database simultaneously. The balancing loop that should have reduced load (cache hits) briefly becomes a reinforcing loop of cache misses.

A simple countermeasure is single-flight request coalescing, so only one request populates the cache while the rest wait on the same future.

## Designing With Loops in Mind

Good system design is largely about deciding *which* loops you want to exist.

- **Put balancing loops at every boundary**: rate limits, quotas, load shedding, backpressure.
- **Make reinforcing loops visible**: if nothing measures retry rates, cache hit ratios, or queue depth, the loop has already been running unseen.
- **Design feedback delays in**: long feedback delays make balancing loops overshoot. An autoscaler that reacts to ten-minute-old metrics will oscillate.

## A Simple Mental Model

When you are debugging a production incident, ask two questions:

1. What is being amplified here, and why is nothing stopping it?
2. What is the time delay between an event and the corrective action?

More often than not, the answer to both questions reveals the loop that owns the outage.

---

**Reflections:** What feedback loops have you seen improve or degrade your systems? Drop a comment with your own war stories.
