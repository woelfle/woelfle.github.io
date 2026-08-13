---
title: Hiring Is Architecture Work
slug: hiring-is-architecture-work
description: 'Conway''s Law says communication structures shape systems. The hiring strategy shapes them
  too: hire data engineers and you get one architecture, hire product owners and you get another.'
date: 2026-07-27 09:00:00+00:00
lastmod: 2026-07-27 09:00:00+00:00
draft: true
tags:
- hiring
- architecture
- conways-law
categories:
- architecture
author: Thomas Wölfle
featureimage: /images/featured-architecture.svg
---

> "Tell me who you hire and I tell you what architecture you will get."

Conway's Law famously says that organizations design systems that mirror their communication structures. That is half the story. The other half is the *people* who make up the structure — their training, their tools, and their instincts are the raw material out of which any architecture is built.

<!--more-->

## The Hiring Strategy Is the Architecture Strategy

When you staff a project, you are not just filling seats. You are choosing which set of solution shapes the organization is capable of producing.

- Hire **data engineers** and you will get an architecture of pipelines, warehouses, and batch processes — because that is the shape their whole training produces.
- Hire **software engineers** and you will get services, contracts, and application logic — the shape of a product, not a dataset.
- Hire **project managers** and you will get phases, milestones, and plans — the shape of a delivery calendar.
- Hire **product owners** and you will get discovery, experiments, and outcome-based roadmaps — the shape of learning.

None of these are right or wrong in the abstract. They are *different spaces of possible solutions*, and your hiring decides which space you live in.

## The Skills Multiply the Space

The space of architectures a team can consider is bounded by the intersection of what its members know. A team of pure back-end engineers will not "discover" observability, or SRE practice, or product discovery as options — not because they are impossible, but because nobody in the room has the category. The hiring list is effectively the *grammar* of the solutions your organization can express.

This cuts in a positive direction too. Every deliberately hired role widens the space:

- A **platform engineer** makes self-service infrastructure a *thinkable* option.
- A **designer** makes the user's experience a first-class constraint instead of an afterthought.
- An **SRE** makes reliability a design input rather than an incident-time prayer.

## The Gap Between Intent and Instinct

Architecture does not come from the written strategy. It comes from the decisions people make at 4 p.m. on a Friday, with their instincts and the tools they know. A strategy document can say "event-driven microservices" all day, but the codebase will come out looking like whatever the people in the room most deeply know how to build.

That is the real reason hiring is architecture work: it is the one decision that sets the defaults for every subsequent decision. You cannot retrofit an organization's capacity by writing more architecture. You change the capacity by changing who is in it — and you change who is in it, deliberately, when you understand what the current composition is already building.

---

**Reflections:** What architecture did your hiring decisions quietly produce, and did it match the strategy? Share your experience in the comments.
