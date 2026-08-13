---
title: Measuring System Performance with Math
slug: measuring-system-performance-with-math
description: 'The few formulas that matter for performance engineers: Little''s law, availability, percentile
  latency, and why averages mislead.'
date: 2026-05-10 09:00:00+00:00
lastmod: 2026-05-10 09:00:00+00:00
draft: true
tags:
- performance
- reliability
- engineering
categories:
- engineering-practices
author: Thomas Wölfle
featureimage: /images/featured-performance.svg
---

Performance engineering is where systems thinking gets quantitative. A handful of formulas from queueing theory and probability explain most of what you will observe in a production system — if you know what to look for. This post builds up the math that matters, one concept at a time.

<!--more-->

## Little's Law: The Golden Rule of Queues

The single most useful result in performance work is **Little's law**:

$$L = \lambda \cdot W$$

where $L$ is the average number of requests in the system, $\lambda$ is the arrival rate (requests per second), and $W$ is the average time each request spends in the system.

It works regardless of the arrival distribution or the service discipline, which makes it remarkably robust. If a system serves 200 requests per second and each takes 250 ms end to end, the average concurrency is:

$$L = 200 \cdot 0.25 = 50$$

The system holds about 50 requests in flight. That number tells you instantly whether your service is close to its threading or connection limits.

## Availability: MTBF and MTTR

Availability is simply the fraction of time a system is up:

$$A = \frac{\text{MTBF}}{\text{MTBF} + \text{MTTR}}$$

where MTBF is the mean time *between* failures and MTTR is the mean time *to recover*. The formula shows the two levers: fail less often, or recover faster. For "five nines":

$$A \ge 0.99999 \quad \Rightarrow \quad \text{annual downtime} \le 5.26 \text{ minutes}$$

A single nine (90%) allows 36.5 days down per year; four nines allow 52.6 minutes. Notice how the hard part of high availability is usually **MTTR** — recovery speed — not eliminating failures.

## Latency: Think in Distributions

Latency is never a single number. It is a distribution, and the summary statistic you choose decides what you optimize for. The **p**-th percentile is the value below which $p\%$ of requests fall:

$$P(X \le \ell_p) = \frac{p}{100}$$

The tail is governed by the response-time distribution's shape. Under heavy load, queueing delays add a term that grows as utilization $\rho$ approaches 1:

$$W = W_0 \cdot \frac{1}{1 - \rho}$$

As utilization rises from 50% to 90%, the wait factor grows from 2 to 10 — latency inflates long before throughput drops. This is the math behind the "suddenly slow" systems: nothing changed in the code, only $\rho$ crept up.

{{< alert >}}
**Average latency lies.**

With $N$ requests and response times $r_i$, the average is $\frac{1}{N}\sum_i r_i$. Because outliers are rare but extreme, a single straggler can dominate the mean while leaving the median and p99 untouched. Optimize the percentiles your users actually feel.
{{< /alert >}}

## The Utilization Wall

A system with utilization $\rho$ under an M/M/1 model has an average response time of:

$$W = \frac{1}{\mu - \lambda}$$

where $\mu$ is the service rate. As $\lambda \to \mu$, response time grows without bound. Every capacity plan should be built around this wall: budget headroom, do not try to run at 95% utilization and then wonder why latency spikes.

## Simple Math, Better Decisions

You do not need a PhD in queueing theory to be a better performance engineer. You need Little's law to reason about concurrency, the availability formula to argue about budgets, and percentiles to report honestly. The rest is measurement and iteration.

---

**Reflections:** Which of these formulas changed how you think about your systems? Share your favorite performance insight below.

{{< katex >}}
