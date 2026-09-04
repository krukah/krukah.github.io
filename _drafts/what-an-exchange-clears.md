---
title: "What a betting exchange actually clears"
date: 2026-06-02
tags: [software]
plate: ladder
description: >-
  The matching engine is the easy part. Settlement is where the product
  lives, and where the hard problems are.
---

People assume the hard part of an exchange is the matching engine. It is not.
A price-time priority book is a weekend of work and a month of tests. The
hard part is everything that happens after two orders meet.

## The book is the easy half

A limit order book has to do three things: accept an order, find the best
resting counterparty, and produce a fill. The invariants are tight enough to
write down.

- Bids sort descending, asks ascending, ties broken by arrival.
- No crossed book survives a single event loop iteration.
- Every fill debits one side exactly what it credits the other.

<figure>
  {% include plate.html name='ladder' scale='lg' %}
  <figcaption>Fig. 1 — resting depth either side of the mid.</figcaption>
</figure>

That third invariant is the one to hold on to, because it stops being true
the moment money is involved.

## Settlement is the product

A sports contract is not a share. It resolves once, on an outcome supplied by
someone outside the system, and until it resolves the position is collateral
you are holding on behalf of two people who disagree.

> The exchange never has a view. It has an obligation to two people who do,
> and a duty to be solvent in every world where either of them is right.

So the real ledger question is not "what is this position worth" but "what is
the worst case I must be able to pay". For a binary contract that is simple:

```rust
/// Collateral a maker must post to back one side of a binary contract.
fn margin(side: Side, price: Cents, size: Contracts) -> Cents {
    let per_contract = match side {
        Side::Yes => price,
        Side::No  => Cents(100) - price,
    };
    per_contract * size
}
```

Two lines of arithmetic. It gets interesting when the same account holds
offsetting positions across correlated markets, and the worst case is no
longer the sum of the worst cases.

## What the customer sees

None of this is visible, and that is the point. The user sees a price and a
button. Every question above is answered before the button is enabled.

| Layer | Question it answers | Latency budget |
| --- | --- | --- |
| Book | Who is the counterparty? | microseconds |
| Risk | Can this account afford it? | milliseconds |
| Settlement | Who gets paid, and when? | hours to days |

*Placeholder prose written by Claude. Replace or delete before publishing.*
