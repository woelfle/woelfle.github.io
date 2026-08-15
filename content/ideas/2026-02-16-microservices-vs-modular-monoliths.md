---
title: Microservices vs. Modular Monoliths
slug: microservices-vs-modular-monoliths
description: Microservices promise independence but ship with complexity. Compare them against modular
  monoliths and learn when each architecture actually wins.
date: 2026-02-16 09:00:00+00:00
lastmod: 2026-02-16 09:00:00+00:00
draft: true
tags:
- architecture
- microservices
- monolith
categories:
- architecture
author: Thomas Wölfle
featureimage: /images/featured-architecture.svg
---

Few architecture debates generate as much heat as microservices versus monoliths. The uncomfortable truth is that most teams do not have a microservices problem or a monolith problem — they have a *modularity* problem. The shape of the deployment does not fix boundaries that were never drawn.

<!--more-->

## What Each Style Actually Optimizes

| Concern | Microservices | Modular monolith |
| --- | --- | --- |
| Independent deployment | Strong | Weak |
| Team autonomy | Strong | Medium |
| Failure isolation | Good (with work) | Poor |
| Operational complexity | High | Low |
| Debugging & tracing | Hard | Easy |
| Refactoring cost | High | Low |
| Time to first deployment | High | Low |

The table reads like a zero-sum game, but that is the point: microservices trade *operational simplicity* for *organizational independence*. If you do not need that independence, you are paying for an option you never exercise.

## The Hidden Cost of Distribution

Distributed systems are not just slower monoliths. They introduce failure modes that simply do not exist in a single process:

- Partial failure and timeouts
- Network partitions and split-brain situations
- Distributed transactions and eventual consistency
- Observability gaps between services
- Version skew across deploys

{{< alert >}}
**Caveat.**

If two services cannot be deployed, scaled, or owned independently in practice, they are one service wearing a costume. You get all of the distributed-systems taxes and none of the benefits.
{{< /alert >}}

## Why Modularity Comes First

The modular monolith is the same good architecture minus the network: one deployable, many strongly-encapsulated modules communicating through well-defined interfaces.

```go
// Each module exposes only its public API to the rest of the monolith.
package inventory

type Inventory struct {
    repo Repo
}

func (i *Inventory) Reserve(productID string, qty int) error {
    // Business rules live here, not in the HTTP handler.
    return i.repo.Reserve(context.Background(), productID, qty)
}
```

Because module boundaries exist at the type level rather than the network level, they are cheap to refactor, easy to test, and trivially debuggable. And if one module ever needs to become a service, the seam already exists.

## A Pragmatic Migration Path

Teams usually do not get to choose from a clean slate. The pattern that works is the **strangler fig**:

1. Start with a modular monolith and ruthless boundaries.
2. Extract services only when a concrete driver appears: a team is blocked, a scaling hotspot emerges, or a compliance boundary requires it.
3. Extract the *module* first, keeping it inside the monolith for a release or two, then split the deployment.

This keeps every step reversible and lets the architecture evolve with evidence rather than ideology.

## When Microservices Are the Right Call

- Teams are large enough to own services end to end.
- Different parts of the system have genuinely different scaling or reliability requirements.
- Regulatory or organizational boundaries require separation.
- You have the operational maturity to run observability, tracing, and incident response at scale.

Otherwise, a well-modularized monolith will serve you longer, with less pain, than a premature decomposition ever will.

---

**Reflections:** What architecture style is your team running, and how did you get there? Share your migration story.
