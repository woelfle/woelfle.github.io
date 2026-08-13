---
title: "Design Patterns I Actually Use in Production"
date: 2026-04-05T09:00:00Z
lastmod: 2026-04-05T09:00:00Z
draft: false
author: "Thomas Wölfle"
description: "Beyond the Gang of Four catalog: the small set of design patterns that earn their keep in real production code, with honest examples."
featuredImage: "/images/featured-architecture.svg"
featuredImagePreview: "/images/featured-architecture.svg"
tags: ["design-patterns", "architecture", "golang"]
categories: ["architecture"]
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

The Gang of Four catalog is a reference library, not a shopping list. In years of production code I keep reaching for the same handful of patterns, and I skip most of the rest. Here is the short list that actually earns its keep.

<!--more-->

## Repository: The Boundary Keeper

The repository pattern hides persistence behind a domain-shaped interface. It turns your business code into something you can test without a database.

```go
type UserRepository interface {
    FindByID(ctx context.Context, id string) (*User, error)
    Save(ctx context.Context, u *User) error
}

type PostgresUserRepository struct {
    db *sql.DB
}

func (r *PostgresUserRepository) FindByID(ctx context.Context, id string) (*User, error) {
    row := r.db.QueryRowContext(ctx, "SELECT id, name FROM users WHERE id = $1", id)
    var u User
    if err := row.Scan(&u.ID, &u.Name); err != nil {
        return nil, err
    }
    return &u, nil
}
```

The benefit is not an extra layer of indirection — it is that the *use cases* read cleanly and the *database details* stay confined. Swap Postgres for an in-memory fake in tests and everything above the interface stays untouched.

## Strategy: Behavior You Can Swap

Strategy keeps algorithmic choices behind an interface so callers can change behavior without a rewrite. Retry policies are a textbook example.

```go
type RetryPolicy interface {
    ShouldRetry(attempt int, err error) bool
}

type exponentialBackoff struct{ maxAttempts int }

func (e exponentialBackoff) ShouldRetry(attempt int, err error) bool {
    return attempt < e.maxAttempts && err != nil
}
```

It is the same shape as an interface in Go or a function parameter in Python. The pattern survives because it is just *polymorphism with a clear name*.

## Builder: Assembling the Complicated Thing

Builders earn their place when construction is long, optional parts abound, and mistakes are easy to make. HTTP clients are a classic victim of constructor bloat.

```go
client := NewClient().
    WithTimeout(5 * time.Second).
    WithRetries(3, time.Second).
    WithTLS(serverCert).
    Build()
```

{{< admonition tip "When NOT to use it" >}}
If your constructor has three arguments and no defaults to speak of, a builder is ceremony. Reserve it for genuinely complicated construction where the named steps make the code *easier* to read, not longer.
{{< /admonition >}}

## Adapter: Speaking the Local Language

Adapters translate one interface into another, letting external systems plug in without leaking into domain code. Every SDK wrapper in your codebase is an adapter in the wild.

```go
type NotificationSender interface {
    Send(ctx context.Context, to, message string) error
}

type EmailAdapter struct{ client *smtp.Client }

func (a EmailAdapter) Send(ctx context.Context, to, message string) error {
    // Translate domain message into a provider-specific format.
    return a.client.SendMessage([]string{to}, []byte(message))
}
```

The adapter pattern is why your domain code does not care whether the email goes out through SMTP, a third-party API, or a log line in local development.

## The Pattern Worth Avoiding

The **Singleton** usually shows up in Go as a global variable, and it costs more than it saves. It couples every caller to the same instance, hides construction order, and makes tests fight over shared state. Prefer explicit dependency injection: build the thing once, pass it where it is needed.

## What I Have Learned

The patterns that survive are the ones that *reduce coupling* or *make tests possible*. If a pattern does neither, it is decoration. Judge every pattern by that test and the catalog shrinks to a very manageable shortlist.

---

**Reflections:** Which design patterns earn their keep in your codebase, and which ones are pure ceremony? I would love to hear your list.
