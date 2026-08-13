---
title: The Pragmatic Guide to CI/CD Pipelines
slug: the-pragmatic-guide-to-ci-cd-pipelines
description: A practical look at designing continuous integration and delivery pipelines that are fast,
  reliable, and actually get deployed.
date: 2026-03-01 09:00:00+00:00
lastmod: 2026-03-01 09:00:00+00:00
draft: true
tags:
- ci-cd
- devops
- automation
categories:
- engineering-practices
author: Thomas Wölfle
featureimage: /images/featured-engineering.svg
---

A CI/CD pipeline is a system like any other, and like any other system it rewards good feedback design. The goal is not a wall of green checkmarks. It is a pipeline so trustworthy that a merge is never blocked by *the pipeline itself* being flaky or slow.

<!--more-->

## The Minimum Viable Pipeline

Before adding cleverness, make sure the basics are in place:

1. **Build** a reproducible artifact from the exact commit being tested.
2. **Test** fast: unit tests in minutes, integration tests in a staging-like environment.
3. **Deploy** the artifact, not a fresh build from `main`.
4. **Verify** the deployment with a smoke check before it is considered done.

The artifact is the contract. If every stage rebuilds from source, you have already lost reproducibility.

## Pipeline Stages in Practice

```yaml
name: ci
on:
  push:
    branches: [main]
  pull_request:

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-go@v5
        with:
          go-version: "1.22"
      - run: go vet ./...
      - run: gofmt -l .

  test:
    runs-on: ubuntu-latest
    needs: lint
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-go@v5
        with:
          go-version: "1.22"
      - run: go test -race -cover ./...

  build-and-push:
    runs-on: ubuntu-latest
    needs: test
    if: github.ref == 'refs/heads/main'
    steps:
      - uses: actions/checkout@v4
      - run: docker build -t app:${GITHUB_SHA::8} .
      - run: docker push registry.example.com/app:${GITHUB_SHA::8}
```

Notice that linting, testing, and building are **parallelizable jobs** with a clear dependency graph. Nothing waits on a slow step unless it truly depends on it.

## Fast Feedback Is a Feature

The longer a pipeline takes, the more work in flight piles up behind it. Treat feedback time as a product requirement:

- Run the *fast* tests on every push, and the *expensive* suite only on merge.
- Cache dependencies between runs, not just inside a single run.
- Fail fast: fail the pipeline at the first meaningful stage.
- Let developers run the same checks locally, so feedback starts before the push.

{{< alert >}}
**Rule of thumb.**

If your pipeline cannot give useful feedback in under ten minutes for a typical change, spend your next sprint on speed, not features. Slow CI is expensive, deferred feedback.
{{< /alert >}}

## Deployment Strategies That Fit Your Risk

Continuous *delivery* means every merge is deployable. Continuous *deployment* means every merge is deployed. Pick your risk appetite:

- **Rolling updates**: new pods slowly replace old ones.
- **Blue/green**: keep the old version live until the new one is verified.
- **Canary**: route a few percent of traffic to the new version and watch the metrics.
- **Feature flags**: ship code dark, turn it on with a switch.

For most teams, canary releases behind a feature flag give the best balance of velocity and safety.

## The Anti-Patterns to Avoid

- **Testing on the build server only**: if `make test` does not work locally, developers will just never run it.
- **Deploying from a developer's laptop**: credentials and environment drift make it unrepeatable.
- **Green builds that mean nothing**: a pipeline that never fails is not stable, it is blind.
- **Touching production in the pipeline script**: every deploy should go through the same auditable path.

---

**Reflections:** What is the slowest stage in your current pipeline, and what would it take to cut it in half? Let me know in the comments.
