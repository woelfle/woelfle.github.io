---
title: "Observability for Beginners: Logs, Metrics, Traces"
date: 2026-04-22T09:00:00Z
lastmod: 2026-04-22T09:00:00Z
draft: false
author: "Thomas Wölfle"
description: "A beginner-friendly introduction to the three pillars of observability and the questions each one answers when a system misbehaves."
featuredImage: "/images/featured-engineering.svg"
featuredImagePreview: "/images/featured-engineering.svg"
tags: ["observability", "monitoring", "devops"]
categories: ["engineering-practices"]
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

Monitoring tells you something is wrong. Observability tells you *why*. The difference is the difference between an alert at 3 a.m. and an answer at 3 a.m. Observability rests on three pillars, and each answers a different question.

<!--more-->

## The Three Pillars

| Pillar | Answers | Example |
| --- | --- | --- |
| Logs | What happened? | "Request failed: connection refused" |
| Metrics | How much / how fast? | 42 requests/sec, 87 ms p95 latency |
| Traces | Where did it happen? | A request spent 800 ms inside the auth service |

None of the three is sufficient alone. Logs are noisy, metrics hide the shape of individual requests, and traces are useless without a hypothesis to start from. Together they let you reconstruct a failure after the fact.

## Logs: The Narrative

Structured logging is the single highest-leverage observability improvement you can make. It turns grep-able text into queryable events.

```go
// Unstructured: painful to search and filter.
log.Printf("user %d failed to login", userID)

// Structured: every field becomes queryable.
slog.Info("login failed",
    "user_id", userID,
    "attempts", attempts,
    "reason", "invalid_password",
)
```

Keep three rules: log at the right level, log structured data, and never log secrets. A log line without a correlation ID is a story you cannot join to its context.

## Metrics: The Vital Signs

Metrics are cheap, aggregated, and perfect for alerting. The golden signals give you a complete enough picture of most services:

- **Latency**: the time to serve a request
- **Traffic**: the rate of requests
- **Errors**: the rate of failed requests
- **Saturation**: how full the service's resources are

Watch for the classic mistake: tracking the average. Latency is a distribution, and averages hide the tail. The p99 is where the pain lives, and it is what your customers feel.

```text
latency histogram:
  p50    =  42 ms
  p95    = 180 ms
  p99    = 540 ms   <- the one to alert on
```

## Traces: The Journey

A trace follows one request across every service, database call, and queue it touches. Traces answer the most important debugging question in a distributed system: *where did the time go?*

Start small: instrument the critical path — the endpoints and dependencies that matter most — before instrumenting everything. A trace with gaps is better than no trace at all.

{{< admonition info "Correlation" >}}
Use a single **correlation ID** per request everywhere: in logs, in trace headers, and in error responses. The three pillars become one system the moment everything shares the same identifier.
{{< /admonition >}}

## From Signals to Action

Signals only earn their keep when they change what you do:

1. **Dashboards** for the questions you ask every week.
2. **Alerts** for the problems you want to know about at 3 a.m. — nothing else.
3. **Runbooks** so the alert tells the on-call engineer what to check first.

An alert that does not tell you what to do is just noise with a pager. Observed systems are only as good as the actions their signals drive.

## Where to Start

If you are new to this, do not build a platform. Do this first:

1. Add structured logging with correlation IDs.
2. Instrument request latency and error rates with a histogram.
3. Trace your top three critical paths.
4. Write one alert and one runbook for each failure mode you have actually seen.

That small loop — observe, understand, act — is observability. The tools are secondary.

---

**Reflections:** What was the observability gap that hurt you most in a past incident? Tell me about it in the comments.
