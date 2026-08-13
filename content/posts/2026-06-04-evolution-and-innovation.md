---
title: Evolution and Innovation in Software Engineering
slug: evolution-and-innovation
description: 'Innovation does not happen in isolation. A system that stays in contact with its
  environment — the customer — is the one that can produce novelty. The science agrees.'
date: 2026-06-04 09:00:00+00:00
lastmod: 2026-06-04 09:00:00+00:00
draft: true
tags:
- innovation
- evolution
- feedback-loops
categories:
- systems-thinking
author: Thomas Wölfle
featureimage: /images/featured-systems-thinking.svg
---

Why does one software team produce genuinely novel solutions while another, just as talented, produces only variations on what it already knows? The usual answers — intelligence, budget, tooling — miss the mechanism. The answer lies in a 2017 paper that has nothing to do with software: *Formal Definitions of Unbounded Evolution and Innovation*, by Adams, Zenil, Davies, and Walker.

<!--more-->

## What the Paper Shows

The researchers asked when a system can keep producing genuinely new forms — what they call *open-ended evolution*. Their result, in essence: innovation requires two coupled subsystems, the **organism** and the **environment**, where changes in one propagate into the other.

In their model, the environment is not scenery. It is an active participant. The organism adapts to the environment; the environment's state changes in response; the two together create a cycle of selection and novelty that neither could produce alone. A system that is isolated from its environment does not just innovate less. It stops being able to innovate *at all* — its possible states are fixed by its own internal variation.

## The Software Translation

The organism is the software team. The environment is its contact with the world: customers, users, operations, the market. The paper's result, translated, is stark:

- **Contact with the customer is not a nice-to-have. It is the mechanism of innovation.** The team's ideas evolve in response to the environment's signals — and the environment responds to what the team ships. The feedback loop *is* the innovation engine.
- **Isolation is not protection, it is stagnation.** A team insulated from the environment — requirements passed through layers, no user contact, no observation of usage — cannot innovate, because the loop that generates novelty is broken. It can still produce. It just produces what it already knew.

## Feedback Loops Amplify Innovation

The second result is equally transferable: **feedback loops between the system and its environment amplify the potential for innovation.** The tighter and more direct the loop — the closer the team is to seeing what the environment does with its output — the faster novelty compounds. Every additional layer of indirection between a team and its users is an innovation tax.

This is a scientific reason behind the practices that already feel right:

- Talk to users directly, not only through proxies.
- Ship, observe, and iterate — the deployed system is the organism meeting the environment.
- Keep the operations feedback loop short: the team should see production behavior, because that is the environment's response.

## Exaptation: Innovation Is Also Reuse

The paper's companion mechanism is *exaptation*: a trait evolved for one purpose being recruited for a new one. Medicines found useful beyond their original treatment. Feathers — most likely evolved for insulation and display — becoming the instrument of flight.

Software does this constantly, and the practice is underappreciated: the internal tool that becomes a product, the library built for one domain reused in another, the capability created for one customer serving the next. An environment-rich team has more exaptation material — more solutions in stock that the environment's new demands can recruit. Isolation shrinks the stock. Contact grows it.

## The Conclusion

Innovation is not a property of smart individuals. It is a property of a *coupled system*: the team and its environment, in a feedback loop, with room to adapt and exapt. If you want a team to innovate, the first thing to build is not a lab. It is a short, direct, unmediated line between the team and the world it serves.

---

**Reflections:** What has your team's closest contact with the environment (customers, production, the market) taught you that no requirement document ever did? Share in the comments.
