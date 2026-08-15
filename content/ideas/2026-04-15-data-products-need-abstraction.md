---
title: Data Products Need an Adequate Abstraction
slug: data-products-need-abstraction
description: 'Throwing the raw garbage out and calling it a "data product" solves no problems. A data
  product is an abstraction — and abstractions are the actual work.'
date: 2026-04-15 09:00:00+00:00
lastmod: 2026-04-15 09:00:00+00:00
draft: true
tags:
- data-products
- data-mesh
- architecture
categories:
- architecture
author: Thomas Wölfle
featureimage: /images/featured-architecture.svg
---

The term "data product" is everywhere, and it is rapidly losing its meaning. Everywhere I look, teams are pointing at a bucket of raw exports, calling it a data product, and expecting the problems to dissolve. They do not. What they are looking at is not a product. It is a dump with a better name.

<!--more-->

## What Makes Something a Product

A product is an abstraction that serves a consumer. It has:

- A **contract** — a promised shape and semantics that the consumer can depend on.
- **Ownership** — someone accountable for its quality, evolution, and retirement.
- A **service relationship** — it is designed for consumers who are not the producer, with the care that implies.
- A **lifecycle** — versions, deprecation, and maintenance, like any other product.

The measure of a product is that consumers can build on it *without knowing the guts*. That is the entire point: the abstraction is what lets many consumers each depend on a single, stable interface.

## The Dump Is Not a Product

Now compare the raw bucket:

- It has no contract — the shape changes when the source changes, silently.
- It has no owner — produced by the source team, consumed by the unknown, maintained by no one.
- It has no service relationship — consumers are on their own when it breaks.
- It has no lifecycle — it just grows.

Calling that a data product is not a first step. It is a way to claim the credit for product thinking without doing any of the work. The garbage is still garbage; it is now garbage with a dashboard.

{{< alert >}}
**The consumer test.**

Can a consumer of your "data product" build on it without talking to your team? If the answer requires a call, a walk-by, or a support request — it is not a product, it is an endpoint.
{{< /alert >}}

## The Abstraction Is the Product

The work of building a data product is the work of designing the abstraction:

1. **Name the semantics.** What does a row mean? What is the unit? What is the valid range? The consumers should not have to reverse-engineer this.
2. **Stabilize the contract.** Versioned schemas, documented change processes, deprecation windows. The contract, not the data, is what consumers commit to.
3. **Make it self-serviceable.** Discoverability, quality metadata, clear examples — so the consumer can verify the product fits before building on it.
4. **Own it like a service.** An owner with a roadmap, quality bar, and a way for consumers to report problems.

## Why the Abstraction Is the Hard Part

The data itself is comparatively easy to move. The abstraction is hard because it requires judgment: what to guarantee, what to hide, what to standardize, what to leave alone. That is why "just dump the data" keeps winning — it is the path of least thinking.

But the path of least thinking is exactly where the cost shows up later, in consumers who cannot trust the data, integrations that break, and the return of the same coordination problems the term "data product" was meant to solve. The abstraction is not a layer you add after the dump. It is the product.

---

**Reflections:** What "data product" in your organization is actually a dump — and what would its abstraction need to look like? Share in the comments.
