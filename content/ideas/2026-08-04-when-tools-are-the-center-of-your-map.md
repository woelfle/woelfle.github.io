---
title: When Tools Are the Center of Your Map
slug: when-tools-are-the-center-of-your-map
description: 'What happens when teams are organized around technologies like SAP, CRM, or PLM instead of
  business domains? The rise of vendor kings, the trade-offs, and the Domain Sidecars alternative.'
date: 2026-08-04 09:00:00+00:00
lastmod: 2026-08-04 09:00:00+00:00
draft: true
tags:
- systems-thinking
- architecture
- team-topologies
categories:
- architecture
author: Thomas Wölfle
featureimage: /images/featured-systems-thinking.svg
---

Every organization draws a map of its teams, and that map has a center. When the center is a business domain, the structure follows value. When the center is a tool — an SAP, CRM, or PLM team — the structure follows technology, and a whole set of predictable patterns emerge.

<!--more-->

## What a Tool-Centered Organization Looks Like

Imagine a company where the teams are *the SAP team*, *the CRM team*, and *the PLM team*. Each owns a system, not a business outcome. Several characteristics emerge from this arrangement:

- **The vendor king arises.** The person who knows the tool's darkest corners becomes indispensable. Decisions travel through them because they are the only ones who can bend the tool.
- **Ownership ends where the tool ends.** No team owns an end-to-end business process, because every process cuts across three tools.
- **Integration becomes the real product.** The bulk of the work happens in glue layers nobody wants, between systems nobody chose.
- **Capability, not value, drives the roadmap.** The SAP team optimizes SAP, the CRM team optimizes the CRM, and the customer's journey is nobody's concern.

The center of the map is not an abstract detail. It decides who talks to whom, what gets optimized, and what is invisible.

## The Vendor King Problem

A tool-centered organization concentrates leverage in a few individuals: the vendor kings. They hold the knowledge of how the tool actually behaves, which the vendor documentation never fully tells you. This is not inherently bad — until it becomes the architecture.

Vendor kings create a second, informal system on top of the official one. Work flows through relationships, not process. Bus factor collapses into a single person. And the tool's constraints — which are *its* constraints, not the business's — silently become the organization's constraints.

## What the Models Tell Us

Two ideas explain why this hurts. **Team Topologies** distinguishes *stream-aligned teams* (aligned to a flow of work from a domain) from *platform teams* (provide internal capabilities). Tool teams sit in an uncomfortable middle: they are platform-like, but they own business-facing systems and block the stream.

**Domain-Driven Design** points the same direction. If you group people around *bounded contexts* — the language and model of a business subdomain — the structure matches the problem space. Organize around a tool and you import the tool's model as if it were the business's model. It is not.

## The Domain Sidecars Alternative

The **Domain Sidecars** model flips the picture. Teams align around business domains, and every domain team carries a small, dedicated "sidecar" — a specialist who owns the tool integration *within that domain*. The SAP expert, the CRM expert, and the PLM expert are distributed into the domain teams instead of centralized in tool silos.

| Aspect | Tool-centered teams | Domain sidecars |
| --- | --- | --- |
| Center of the map | The tool | The domain |
| Primary optimizer | Vendor king | Domain value |
| Integration effort | Between teams | Inside teams |
| Specialist leverage | Hoarded | Shared per domain |

The sidecar model keeps the specialist knowledge the vendor king represents, but re-anchors it to the business problem. The tool stops being the organization's purpose and becomes what it always should have been: a means to an end.

---

**Reflections:** Is the center of your map a tool or a domain? What did your vendor kings cost you before you noticed? Share your story in the comments.
