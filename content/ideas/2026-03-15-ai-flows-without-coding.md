---
title: AI Flows Without Coding
slug: ai-flows-without-coding
description: 'Stitching together an AI flow visually with Flowise or another low-code tool is coding. It
  has exactly the same properties — and the same limitations.'
date: 2026-03-15 09:00:00+00:00
lastmod: 2026-03-15 09:00:00+00:00
draft: true
tags:
- ai
- no-code
- engineering
categories:
- engineering-practices
author: Thomas Wölfle
featureimage: /images/featured-engineering.svg
---

There is a moment in every "no code" adoption where someone proudly says *"we built this without writing any code."* Look at the screen: nodes, connections, conditionals, branches, loops, error paths. It is a program. It just has a different syntax.

<!--more-->

## A Program Is a Program

Coding is the activity of specifying, precisely and unambiguously, what a machine should do. The medium is irrelevant. A visual flow with nodes for *if this, then that, call this model, retry on failure* is a control-flow graph — which is what a program is, drawn instead of typed.

The properties of code do not disappear because you did not type a keyword:

- **It has bugs.** A miswired edge between two nodes is a bug. It behaves exactly like a misdirected `if`.
- **It has complexity.** A flow with forty nodes is a forty-node program, with all the cognitive load and coupling that entails.
- **It has maintenance.** Every flow is living software: the models change, the inputs change, the business rules change, and someone has to edit the graph.
- **It has to be tested and versioned.** Who changed this flow and when? What does it do in the failure case? Same questions, same answers as code.

## The Same Limitations

The reason this matters is the second half of the claim: *it has the same limitations*. Low-code tools do not escape the fundamental constraints — they concentrate them:

- **Expressiveness is bounded by the palette.** A tool can only express what its nodes express. The harder the logic, the more you fight the tool to express it — or the more you break it into the tool's idioms, whether they fit or not.
- **The abstraction leaks.** The moment you need something the tool does not offer, you write an extension, a webhook, an embedded script. The "no code" wall has a door, and every serious project eventually uses it.
- **Portability is low.** Your visual graph lives in the tool. Recreating it elsewhere means rebuilding it — the lock-in is built into the format.

## The Real Divide

The actual divide is not *coding vs. not coding*. It is *low-level control vs. high-level abstraction*. A visual flow is a high-level abstraction, and that is genuinely valuable: it hides details, it makes a shape visible, it lets non-specialists contribute.

The discipline is to admit what it is. If it is a program, then programs deserve design, review, testing, versioning, and ownership — regardless of whether the syntax is curly braces or colored boxes.

{{< alert >}}
**The test.**

If your flow needs an error handler, a retry policy, and a changelog, it is software. Treat it like software, or it will fail like software with none of the protections.
{{< /alert >}}

---

**Reflections:** Where has a "no code" tool turned out to be code with extra steps in your experience? Share in the comments.
