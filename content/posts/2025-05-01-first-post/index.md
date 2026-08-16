---
title: 'A System of Thoughts'
slug: a-system-of-thoughts
description: 'Most blogs begin with a hello. This one begins with the title — because the title is the
  thesis. An introduction to what this blog is, why it is called Thinking in Systems, and what to
  expect.'
date: 2025-05-01 09:00:00+00:00
lastmod: 2025-05-01 09:00:00+00:00
draft: false
tags:
  - zettelkasten
categories:
- systems-thinking
author: Thomas Wölfle
featureimage: /images/featured-systems-thinking.svg
---

Most blogs begin with a hello. This one begins with the title — because the title is the thesis.

The site is called **Thinking in Systems**, and its subtitle is *A System of Thoughts*. That is not decoration. The first half says what this blog is *about*: the lens I look at software through. The second half says what the blog *is*: a web of thoughts, each written down as a sentence, connected to the others, growing over time.

<!--more-->

## The Lens: Thinking in Systems

Donella Meadows defined a system as "a set of things — people, cells, molecules, or whatever — interconnected in such a way that they produce their own pattern of behavior over time."[^1]

Software engineering is full of such systems. The codebase is one. The team that changes it is another. The organization around them, the processes that decide how fast anything moves, the incentives that quietly steer decisions — each is a set of things whose interactions produce a pattern no single part explains. You can be brilliant at every component and still lose to the whole.

Most of the engineering problems I have wrestled with were not component problems. They were system problems wearing component disguises: a "slow developer" who is really inside a slow system, a "bad architecture" that is really the frozen shape of old constraints, a "resistant team" that is really the victim of a feedback loop nobody drew on a whiteboard. The lens of systems thinking is what lets me see the disguise. This blog is my attempt to write down what I see.

Take the team that keeps missing its deadlines. The obvious reading blames the team; the systems reading follows the loop. Pressure goes up, the team cuts corners to compensate, the corners surface as defects, the defects push the deadline out again — and by the time the cost of those corners shows up, the corner-cutters have long since been labeled slow. The label is the disguise. The loop is the system.

Seeing a system is not the same as steering it. Whether a good diagnosis ever becomes a real change runs through the people who hold the power over the system — and no framework closes that gap on its own.

## The System: A Web of Thoughts

The subtitle is the part that means the most to me. A few years ago I started keeping a Zettelkasten,[^2] and the first thing it taught me was that thoughts are not words or concepts — they are sentences. *"Feedback loops with long delays cause systems to overshoot"* is a thought. *"Feedback loop"* is just a label. Fill a system of notes with labels and you have built an ontology — organized and useless. Knowledge does not live in labels; it lives in the relationships between ideas, and relationships only exist between sentences.

So this blog is not an ontology of concepts. It is a web of thoughts, and its value is in the links. Every post here is a claim — a sentence I am willing to defend or revise — and it points at other claims. Read the posts in any order; the threads are the point. Follow one and it will take you somewhere you did not plan to go, which is how thinking actually works. And read with a pencil: for every claim, find where you would push back. A claim you cannot argue with is a claim you have not really read.

## What This Blog Is Not

Let me also say what this is not, because it keeps both of us honest.

This is not a news blog and not a tutorial farm. There will be no listicles and no hot takes about the release of the week. It is a personal knowledge repository: a digital garden where I document insights, patterns, and lessons learned across a software engineering journey, and where I think out loud about the things I do not fully understand yet. Posts here start as notes and grow into essays. Some will be unfinished on purpose. That is the point — writing a thought down as a sentence forces you to actually have one, and the thinking is the deliverable.

## What to Expect

The posts wander across a few connected territories, all of them downstream of systems thinking:

- **Software architecture & design** — patterns, principles, and the trade-offs that come with them.
- **Engineering practices** — what makes software maintainable, reliable, and safe to change.
- **Leadership & teams** — how Scrum, OKRs, expectations, and organizational structure really shape what a group can do. Why a team that misses its OKRs is perhaps a sign the *unit* of measurement is wrong — not the team.
- **Continuous learning** — the discipline of getting better at all of the above.

The common thread is the title: how the pieces connect, how the system behaves, and how you steer it toward the behavior you want. Expect arguments from systems thinking — tipping points, feedback loops, constraints, complexity — applied to concrete situations. Expect stories from the field. And expect me to change my mind in writing, because a system that cannot update its own beliefs is a system that stops working.

## Where to Start

Start anywhere. But if I had to pick one place: look at the system you are part of — the codebase, the team, the company — and find the thing that keeps surprising you. That surprise is a symptom of a system you do not fully understand yet.

Ask the people around you the same question: *what in our system keeps surprising us?* It makes for a good retrospective prompt and a better meeting opener. And if the same surprise keeps recurring, you have found a feedback loop with a delay — name the delay and you have found the leverage point. That is where the interesting problems live, and it is exactly what this blog is about.

## References

[^1]: Donella H. Meadows, *Thinking in Systems: A Primer*, ed. Diana Wright (Chelsea Green Publishing, 2008; ISBN 978-1-60358-055-7), p. 2 — the source of the definition of a system quoted above.

[^2]: On the Zettelkasten method: [Niklas Luhmann-Archiv](https://niklas-luhmann-archiv.de/nachlass/zettelkasten) — the official archive of Luhmann's Zettelkasten, with the digitized slip box and facsimiles. See also [zettelkasten.de](https://zettelkasten.de/), a community site on the method and how to practice it.
