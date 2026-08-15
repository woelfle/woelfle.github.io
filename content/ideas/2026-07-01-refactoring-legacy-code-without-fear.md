---
title: Refactoring Legacy Code Without Fear
slug: refactoring-legacy-code-without-fear
description: Legacy code is code without tests. Learn to add seams, write characterization tests, and
  refactor in small safe steps.
date: 2026-07-01 09:00:00+00:00
lastmod: 2026-07-01 09:00:00+00:00
draft: true
tags:
- refactoring
- legacy
- engineering
categories:
- engineering-practices
author: Thomas Wölfle
featureimage: /images/featured-engineering.svg
---

Michael Feathers defined legacy code simply: *code without tests.* The fear of changing it is rational — without tests, a change is a bet against the whole system. The cure is not courage. It is a sequence of small, reversible steps that put tests around the code before you touch its behavior.

<!--more-->

## Start with Seams

A **seam** is a place where you can change behavior without editing that place. The most useful seam in most codebases is the dependency hidden inside a function or constructor. Extract it, and the code becomes testable.

```go
// Before: the dependency is baked in, impossible to fake.
func SendWelcomeEmail(user User) error {
    client, _ := smtp.Dial("mail.example.com:25")
    return client.Send(...)
}

// After: the seam is explicit, and tests can pass a fake sender.
type Mailer interface {
    Send(to, subject, body string) error
}

func SendWelcomeEmail(user User, mailer Mailer) error {
    return mailer.Send(user.Email, "Welcome", bodyFor(user))
}
```

The change does not alter behavior. It just opens a door for tests.

## Characterization Tests: Locking in Behavior

Before refactoring the logic, write **characterization tests** that document the current behavior — bugs included. The test does not assert what the code *should* do; it asserts what it *does*.

```go
func TestLegacyDiscountBehavior(t *testing.T) {
    // Records current behavior, not intended behavior.
    // Safe to revisit once the behavior is understood.
    got := CalculateDiscount(100, "GOLD")
    if got != 15 {
        t.Fatalf("got %v, want %v (documented current behavior)", got, 15)
    }
}
```

Once the current behavior is pinned down, refactoring becomes safe: if the tests still pass, the behavior is preserved. When you later *decide* a behavior was a bug, you change the test first — deliberately.

## Small Steps, Constant Green

Refactoring is a sequence of tiny transformations, each followed by a test run:

1. Extract a seam.
2. Add a characterization test.
3. Run the tests — green.
4. Make the next tiny change.
5. Run the tests again.

Never mix refactoring and feature work. A refactor that changes behavior is not a refactor; it is a bug waiting to happen. Keep the two in separate commits so `git bisect` can still find the truth.

{{< alert >}}
**Stop-the-world refactors fail.**

Big-bang rewrites are how legacy systems die. The **strangler fig** pattern — routing traffic to a new implementation piece by piece while the old one shrinks — keeps the system running and shippable at every step.
{{< /alert >}}

## The Ladder of Confidence

Work from the bottom of the stack up. Test the pure functions first — they have no side effects and are trivially testable. Then the rules that depend on them. Then the I/O boundaries, using seams and fakes. Confidence compounds with every green run.

## When to Walk Away

Some code is not worth the fight. If the code is dead, delete it. If the behavior is unverifiable and the business has no one to explain it, flag it, cap it, and move on. Refactoring is an investment, and like every investment it needs a return. Spend it where the change requests land.

---

**Reflections:** What is the worst legacy code you have had to tame, and what technique saved you? Share your story in the comments.
