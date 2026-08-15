---
title: Your Complexity Glass Has a Size
slug: your-complexity-glass-has-a-size
description: 'Every individual, team, and organization can handle only a limited amount of complexity —
  technical, domain, organizational, and process. Every new tool takes a share of it.'
date: 2026-07-13 09:00:00+00:00
lastmod: 2026-07-13 09:00:00+00:00
draft: true
tags:
- complexity
- systems-thinking
- cognitive-load
categories:
- systems-thinking
author: Thomas Wölfle
featureimage: /images/featured-systems-thinking.svg
---

Every person, team, and organization has a finite glass of complexity they can hold. Nothing about it overflows gracefully — the overflow comes out as errors, burnout, and unshipped work. The problem is that almost nobody knows how full their glass is.

<!--more-->

## Four Kinds of Complexity

The total complexity you can handle is not one number. It is split into four glasses, and you carry all of them at once:

- **Technical complexity** — the frameworks, services, and infrastructure you must master to build anything.
- **Domain complexity** — how hard the business problem itself is to understand.
- **Organizational complexity** — how many people, teams, and dependencies you must coordinate with.
- **Process complexity** — the weight of the ceremonies, workflows, and approvals around the work.

Your capacity is not the sum of the glasses. It is the *weakest* one, because they interact: a team drowning in process has no attention left for the domain. A solo developer deep in technical complexity has nothing for the organization.

## Every Tool Costs a Share

As software engineers we love new technologies, and we forget that every tool we introduce comes with a price. It is not the license fee. It is the permanent share of the team's complexity glass that the tool consumes — the concepts to learn, the runtime to operate, the failure modes to understand.

The first law of cybernetics (Ashby) says a control system must have at least as much variety as the system it controls. A tool that adds more variety than it removes does not simplify your system. It steals from your capacity while promising to serve it.

## How Full Is the Glass?

The tragedy is that the glass is measured nowhere. Sprints measure output, dashboards measure latency, and nobody measures the cognitive load that the team is actually carrying. Some signals, though, are reliable:

- **Recovery time**: how long a new teammate takes to become productive.
- **Bus factor**: how much breaks when one person is out.
- **Change cost**: how many people a "small" change touches.
- **Meeting count**: how much of the complexity is coordination, not work.

If any of these feel high, the glass is fuller than the roadmap admits.

## How to Empty It

- **Remove before you add.** Every new tool or process should be budgeted against one that is removed.
- **Put complexity behind boundaries.** Contain it inside a service, a team, or a bounded context so it does not leak into everyone's glass.
- **Make the glass visible.** Name the four kinds of complexity on your team and ask, openly, which one is full this quarter.

The glass is real whether you measure it or not. The only choice is whether you control what fills it.

---

**Reflections:** Which of the four glasses is full on your team right now, and what would you remove to empty it? Share in the comments.
