---
title: 'Sooner, Not Faster: The Speed Trap in AI-Assisted Engineering'
slug: ai-accelerates
description: 'AI accelerates software output — code, reviews, migrations, configuration — faster than
  before, but not delivery outcome. The gap between faster and sooner is where teams using AI run
  aground, and the system decides whether speed becomes arrival or a crash.'
date: 2026-08-14 09:00:00+00:00
lastmod: 2026-08-14 09:00:00+00:00
draft: true
tags:
  - ai
  - engineering
categories:
- systems-thinking
author: Thomas Wölfle
featureimage: /images/featured-systems-thinking.svg
---

## Sooner, Not Faster: The Speed Trap in AI-Assisted Engineering

<!--more-->

Ask me what changes with AI in software engineering and my answer is one word: acceleration. Drop AI into how software gets built and everything speeds up — code, reviews, migrations, configuration, produced faster than before.

But faster is not the same as sooner. Speeding things up is the seductive part, and it's the wrong thing to fall in love with. What you actually want isn't to _build_ faster — it's to _deliver sooner_. Those are not the same thing, and everyone who has ever gunned a fast car straight into a red light knows it in their bones. You can raise the top speed of every stretch of road and still get to the destination later, if the journey is one queue after another. Faster is local. Sooner is the whole trip.

There's a precise, technical way to say it: AI reliably accelerates _output_ — the code, pull requests, migrations, config. It does almost nothing on its own for _outcome_ — validated value in the hands of a user. Output is how fast you're driving; outcome is when you actually arrive. AI has collapsed the cost of the first and left the second entirely to your system. The gap between the two is where teams struggling with AI get hurt: they watch output accelerate, assume they'll arrive sooner, and are blindsided when they don't.

This is not a warning piece. I think AI is one of the most useful things to happen to our craft in a long time. But usefulness is conditional, and the condition is the system you point it at. So this is a preparation guide — because speed is neutral, and the system decides whether it turns into arrival or into a crash.

## The evidence is quietly on the side of "it depends"

This framing didn't come from a study. It came from decades in software engineering and systems thinking, sharpened by the last two years as AI arrived — and by having the rare chance to evaluate, with real software, what actually works and what doesn't. I've taken this topic into talks for different audiences and different companies, and this article is the result of those evaluations, talks, and conversations. And two pieces of recent research back it up.

In a 2025 randomized controlled trial, METR had experienced open-source developers work on issues in codebases they knew well, with and without AI tools. The developers predicted AI would make them about 24% faster. Measured, they were about 19% _slower_ [8]. The driving felt faster; the arrival came later.

The DORA reports track the same question across the whole delivery system, and their year-over-year arc is itself the argument. In 2024, a 25% increase in AI adoption was associated with an estimated 1.5% drop in delivery throughput and a 7.2% drop in delivery stability [7]. A year later the throughput finding had flipped: the 2025 report found AI adoption now correlating _positively_ with throughput, as teams learned where and how to apply it — while the hit to stability persisted, concentrated in teams whose foundations weren't solid [10]. DORA's own name for the pattern is the one this piece keeps circling: AI is an _amplifier_. It lifted the delivery rate; whether that rate stayed stable depended on the system underneath.

Two methods, two altitudes, the same shape. AI moved what got produced — faster here, slower there — but whether that motion became value delivered depended on everything around it.

## AI accelerates what you have

AI is not good or bad for your engineering. It is a multiplier of sign. If you have a weak process and little control over quality, AI helps you reach trouble faster. If you already have quality built into how you work, AI helps you ship faster.

And "you're bad, so AI makes it worse" is both unkind and untrue: a team in a mess _can_ use AI extremely well — but only if they aim it at the system, not just at typing speed. The lever matters more than the horsepower. Hold that thought; it's where this ends.

## This isn't new — it's systems thinking meeting a faster input rate

None of what follows is a new problem invented by AI. It's decades-old systems thinking, and AI has simply raised the arrival rate until the mathematics is impossible to ignore.

Start with the **Theory of Constraints** [5]. Goldratt's insight is blunt: any improvement to a step that isn't your bottleneck is an illusion. If coding was never your constraint — and in most teams it isn't — then making coding faster doesn't make the system faster. It just grows the pile of work waiting in front of whatever the real constraint is, which is usually validation and release.

**Queuing theory** tells you how badly that pile behaves. Donald Reinertsen's _The Principles of Product Development Flow_ applies queuing theory to exactly our world, and its central finding is that invisible, unmanaged queues are the root cause of poor development performance [4]. Kingman's equation makes it quantitative: as any station approaches full utilization, waiting time doesn't rise gently — it heads toward infinity, and each additional percentage point of load hurts more than the last [6]. Push AI-accelerated output into a QA step or an Ops handoff that's already near capacity and the queue doesn't grow a little — it explodes. That is the mechanism behind DORA's stability drop — the one finding that held across both the 2024 and 2025 reports even as throughput reversed [10].

Finally, **cybernetics** supplies the frame. Ashby's Law of Requisite Variety — "only variety can destroy variety" [2] — says a controller must have at least as much variety as the thing it's trying to control. Accelerate output without a matching increase in your capacity to _control_ that output — tests, review, observability — and by definition you lose control. That reframes every guardrail for what it actually is: a feedback loop. And W. Edwards Deming got to the punchline first: he estimated that 94% of problems belong to the system, not the worker — a bad system, as he put it, will beat a good person every time [3].

AI didn't invent these constraints. It raised the arrival rate until we can no longer pretend they aren't there.

## What mattered most before matters even more now

There's a lazy version of this argument that says "everything old still matters." That's not quite right, and the imprecision weakens it. Some old practices should already be gone — nobody should have been doing exhaustive _manual_ review of boilerplate; that's what linters and static analysis were for.

The sharper claim is this: the practices that were genuinely load-bearing — organizing for flow, fast feedback, quality built in rather than inspected in — matter _more_ now, while the toil that should already have been automated matters even less (and AI makes automating it cheaper still). The logic is simple. If bad code now arrives far faster, the value of every automated check that catches it, and every impediment you removed from its path, goes up, not down.

There's a second-order effect. As the cost of _producing_ code falls toward zero, the _coordination_ cost around it becomes the dominant constraint. Reducing hand-offs and cognitive load — the core of what Team Topologies argues for — gets more urgent, not less. Accelerate the work without reducing the coordination around it and you don't get flow, you get a faster traffic jam.

But there's a level above all of this, and Peter Drucker named it decades ago: "There is nothing so useless as doing efficiently that which should not be done at all" [1]. Automating a task is only the second-best move. The best move is realizing the task shouldn't exist and removing it — because work you deleted needs no acceleration, no validation, no guardrail, and it never joins a queue. The best acceleration, in other words, is often not accelerating at all.

This matters _more_ under AI, not less, and here's the trap: AI is such a good efficiency engine that it strips away the friction that used to expose waste. When a pointless task was expensive, its pointlessness eventually surfaced as pain and someone cut it. When AI makes that same task nearly free, it can persist forever — efficiently, invisibly, uselessly. AI doesn't just accelerate good work and bad work alike; it _camouflages_ waste by making it cheap. The discipline it demands is a judgment call no tool can make for you: deleting a redundant report is elimination, deleting your tests is not. You can only call work useless relative to the outcome you're after — output-versus-outcome again, in its sharpest form: useless work is maximal output and zero outcome.

## The bottleneck has moved: from writing code to trusting it

For a growing class of routine work, producing the code has stopped being the bottleneck, and validating it has become one. For novel or architecturally hard problems, production is still the hard part — the METR result is strongest exactly where the codebase is known [8]. The bottleneck doesn't vanish. It moves, per task.

And validation is genuinely harder than it used to be, because reviewing code you didn't write — with no shared intent to lean on — is harder than reviewing a colleague's. The uncomfortable corollary: the tasks teams quietly deprioritize under delivery pressure — tests, observability, refactoring, clean CI/CD — are precisely the ones that make acceleration safe. Not because anyone is lazy, but because pressure tends to squeeze the invisible work first. The good news is that those are exactly the tasks AI is good at helping you build.

## The analogy: the engine is not the car

This is the place to make the whole thing physical, because AI is an _engine_ — a powerful one. The mistake is thinking the engine is the whole story. What you've actually been handed is a proper performance engine your car probably isn't built to use, and a real engine forces you to think about the rest of the car — because none of its parts exist to make it _fast_; they exist to make it _arrive_. Brakes are your ability to stop and roll back safely. Tires and grip are your test suite — the traction that lets you carry speed through a corner instead of into the wall. Telemetry is your observability, telling you where you are on the track before you find the wall.

And then there's the road itself — the codebase you've inherited. Every other part of the car is a capability you can add; the road is the terrain you were handed, and its surface is your accumulated tech debt, architectural decay, the brittle foundations that make every change riskier than it should be. A smooth road lets you carry speed safely. A road full of potholes beats the car apart no matter how good the engine — and it caps your safe speed _everywhere_, on every stretch, which is exactly why a pristine engine over a bad road still can't arrive sooner. Better boundaries help, because no road is ever perfect, but they only buy you so much: past a point the road itself has to be repaired. And AI-acceleration over a bad road is where a powerful engine does the most damage.

So the guardrails aren't the speed police. They're what convert raw speed into arrival — the only reason a fast car ever gets anywhere. A performance engine in a car with drum brakes and bald tires doesn't arrive sooner; it's a crash waiting for the first corner. And when that happens, don't blame the driver.

## Whose system is it, anyway?

The road has a second problem, and it's a different kind. Its surface is the tech debt you inherited — but painted onto it are red lights every hundred meters: a hand-off to QA, a throw-over-the-wall to a separate Ops team, a cross-team dependency for every change. The surface you might, over time, repair yourself. The lights you can't. From the driver's seat, they're externally imposed. The team can't remove them. They can't reorganize the engineering department.

And that's where accountability finally lands at the right altitude. What is external to the driver is internal to the system owner. The lights aren't laws of physics; someone chose them. And often the people telling teams to "go faster with AI" are the same people who control the constraints preventing it. That isn't a complaint — it hands the fix to the people who can actually make it.

## Two teams, one root cause

Two situations I've seen more than once, at different companies and in different years, make it concrete. Neither is about any one place I've worked — both are patterns that have repeated often enough to recognize on sight.

The first is a legacy codebase, waiting to be migrated, that has almost no self-testing code. AI will happily accelerate the _output_ — translate modules, restructure, generate. But with no test harness, every generated change has to be validated by hand. In cybernetic terms the control loop is missing: you can't sense whether the output is correct, so you can't steer. The team is drifting toward chaos — lots of motion, no feedback.

The second is a distributed monolith with hand-offs everywhere: engineer to QA, team to team, and engineering to a separate Ops function because the teams don't run what they build. AI speeds up the coding station, and the work simply arrives at each red light faster and queues. That's Kingman under load — near-saturated stations, waiting time climbing non-linearly. The team is frozen by structure.

One team blocked by a missing feedback loop, the other by unmanaged queues. Same root cause: the system wasn't prepared for acceleration. Two faces of it — and I've seen both more than once.

## If you recognize yourself: repair the system, with AI

If any of this describes your world, the answer is not to slow down, and it's certainly not to distrust the engine. It's to point the acceleration at the system first — to use AI to elevate the constraint rather than to sprint past it.

Start with a step zero that outranks all the rest, because it's the one place you can win without accelerating anything at all:

1. **Ask what should not be done at all.** Before you make anything faster, find the work that shouldn't exist — the report no one reads, the approval that never catches anything, the process step everyone routes around. Removing it beats accelerating it every time, and AI's real gift here is analytical, not generative: use it to surface where effort flows and where it dead-ends. This is a judgment call the tool can't make for you, and it's the highest-leverage move on the list.

Then, five things worth aiming AI at before you aim it at raw feature velocity:

1. **The code you're afraid to touch** — wrap the untested, high-risk parts in characterization tests [9] first, so a migration or refactor produces trustworthy outcome, not just faster output. Lay grip on the road before you open the throttle.
2. **The slowest, most manual quality gate** — generate the checks, fixtures, and pipeline config that turn a hand-inspected step into an automated one.
3. **Observability where you're flying blind** — logging, tracing, and alerts, so you can see where you are on the track before you hit the wall.
4. **The hand-offs you can actually remove** — documentation, interface contracts, and self-service tooling that let a team own more of its own path and wait on fewer red lights.
5. **The boring toil nobody defends** — dependency updates, migrations, dead-code removal — the invisible work that pressure always squeezes out and that quietly determines whether you can move fast safely.

The goal was never to rip the engine out. It's to become the car that arrives sooner — not just the one that drives faster.

## So is any of this new?

A fair reader will have noticed something by now: almost none of the answers here are new. Flow over local efficiency, unmanaged queues as the root cause, quality built in rather than inspected in, eliminate the work that shouldn't exist, reduce hand-offs — this is the lean and agile canon, decades old. If you were hoping for a new rule, I don't have one for you.

And that is the point. For years these practices were, for a lot of teams, things you could get away with neglecting and still ship. Lean and agile were easy to nod at and quietly ignore. What's changed is that AI removes the "get away with it." It's the first force powerful enough to make the old wisdom non-optional — the penalty for lacking it just went up sharply. The novelty isn't in the engineering; it's in the stakes.

If there is one genuinely new thing, it's this: every one of those old practices quietly assumed the human was the rate-limiter. The person who wrote the code was also the one who understood it, the first reviewer, the natural throttle on how much could move at once. AI breaks that assumption. It can now produce more than anyone has yet understood, faster than a human can check it, with no shared intent to lean on. Lean has a great deal to say about a fast producer; it has very little to say about a producer whose output no one has comprehended yet.

But even this isn't a fixed law — it's a fork in the road. If we keep a human reading every line the machine writes, the comprehension gap is permanent and validation stays the bottleneck forever. The more interesting path is to stop relying on after-the-fact review and instead get rigorous about the requirements the AI has to satisfy up front — functional and non-functional alike — so that "correct" is something we can specify and check against, not something a person has to reconstruct by reading. That is unquestionably an old idea too. It just matters more than it ever has.

AI didn't change the rules of good engineering. It raised the stakes on following them. It will make you faster the day you turn it on. Whether it gets you there sooner is still, as it has always been, up to your system.

---

## Notes & sources

Quotes and attributions:

1. **Peter F. Drucker** — "There is nothing so useless as doing efficiently that which should not be done at all." Widely attributed to Drucker; it distills the efficiency-versus-effectiveness theme that runs through his management writing.
2. **W. Ross Ashby** — "Only variety can destroy variety" (the Law of Requisite Variety), from _An Introduction to Cybernetics_ (Chapman & Hall, 1956), p. 207.
3. **W. Edwards Deming** — "94% belongs to the system (responsibility of management), 6% special," from _Out of the Crisis_ (MIT Press, 1986), p. 315. The line "a bad system will beat a good person every time" is from a February 1993 Deming seminar in Phoenix, Arizona (recorded by the W. Edwards Deming Institute).
4. **Donald G. Reinertsen** — that "invisible and unmanaged queues are the underlying root cause of poor product development performance" is the central argument of _The Principles of Product Development Flow_ (Celeritas, 2009).

Further reading and supporting data:

1. **Eliyahu M. Goldratt**, _The Goal_ (1984) — the Theory of Constraints.
2. **Kingman's formula** (the VUT equation) — the queuing result that mean wait time rises toward infinity as a station nears full utilization.
3. **DORA / Accelerate State of DevOps 2024** — the 2024 throughput and stability figures cited above.
4. **METR (July 2025)** — the randomized controlled trial on AI and experienced open-source developers.
5. **Michael C. Feathers**, _Working Effectively with Legacy Code_ (Prentice Hall, 2004) — the source of "characterization tests": tests that pin down what existing code currently does, so it can be changed safely.
6. **DORA / State of AI-assisted Software Development 2025** (Google Cloud, September 2025) — the reversal of the 2024 throughput finding (AI now positively correlated with throughput) alongside the persistent negative relationship with stability, and DORA's framing of AI as an "amplifier" of a team's existing foundation.
