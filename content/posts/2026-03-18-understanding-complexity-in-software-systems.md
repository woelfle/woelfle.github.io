---
title: "Understanding Complexity in Software Systems"
date: 2026-03-18T09:00:00Z
lastmod: 2026-03-18T09:00:00Z
draft: false
author: "Thomas Wölfle"
description: "Essential versus accidental complexity: learn to separate the complexity inherent to a problem from the complexity we add ourselves."
featuredImage: "/images/featured-systems-thinking.svg"
featuredImagePreview: "/images/featured-systems-thinking.svg"
tags: ["systems-thinking", "complexity", "software-design"]
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

Fred Brooks observed in *The Mythical Man-Month* that software has two kinds of complexity: **essential** complexity, which is intrinsic to the problem itself, and **accidental** complexity, which we introduce through our tools and choices. Most maintenance pain in a codebase comes not from hard problems but from complexity we created ourselves.

<!--more-->

## Essential Complexity Cannot Be Avoided

Some problems are genuinely hard. Distributed consensus, cryptographic correctness, and real-time scheduling are difficult no matter how clean your code is. Essential complexity is the part of the work that cannot be designed away — it can only be *managed*.

The trap is pretending it does not exist:

```go
// A deceptively simple-looking API...
func Transfer(from, to int64, amount float64) error {
    return accounts.TopUp(from, to, amount)
}

// ...hides distributed money movement that is anything but simple.
```

Money movement between systems is essentially complex: it needs idempotency, reconciliation, and atomicity across boundaries. Stripping the API down to three parameters does not remove that complexity. It just hides it where the next engineer will trip over it.

## Accidental Complexity Is Ours

Accidental complexity comes from the layers we add that are not required by the problem:

- Frameworks chosen for fashion rather than fit
- Generics and abstraction hierarchies nobody can navigate
- Seven services where one module would do
- Configuration formats nested beyond comprehension

A useful heuristic: if you removed a layer and the system still satisfied its requirements, that layer was accidental.

## The Cost of Complexity

Complexity is not just a feeling. It has measurable consequences:

- **Onboarding time** grows with the number of concepts a new engineer must absorb.
- **Change risk** grows with the number of components a change touches.
- **Bug density** grows faster than code size in tangled systems.
- **Team throughput** drops as cognitive load exceeds capacity.

None of these costs appear on a sprint board, which is precisely why complexity accumulates silently.

## Simplification Is a Design Activity

Fighting accidental complexity takes deliberate effort, not just good intentions:

1. **Name things honestly** — names that describe behavior, not implementation.
2. **Reduce coupling** — fewer, clearer interfaces beat more flexible ones.
3. **Delete what you can** — the most maintainable code is code that does not exist.
4. **Prefer explicit over clever** — every idiom saves typing today and costs reading every day after.

{{< admonition info "Note" >}}
Simplify where the complexity is accidental, and *invest* where it is essential. Simplifying essential complexity is where teams go wrong — they compress it, hide it, and pay for it in production incidents.
{{< /admonition >}}

## A Complexity Budget

Treat complexity like a budget with a cap. Before adding any new abstraction, ask: *does this reduce the total complexity of the system, or does it just move it somewhere else?* Moving it elsewhere is usually how the budget gets blown.

---

**Reflections:** Which recent change added accidental complexity to your codebase, and how would you simplify it? Share your experience.
