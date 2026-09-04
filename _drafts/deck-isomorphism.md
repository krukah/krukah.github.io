---
title: "Isomorphism in a 52-card deck"
date: 2026-04-19
tags: [software]
plate: lattice
description: >-
  Two hands that play identically should cost you one entry in the table,
  not two.
---

The first table I built for robopoker had an entry for every pair of hole
cards against every board. It was correct and it was enormous, and most of it
was the same information written down four times.

Suits only matter through the relationships they create. If no flush is
possible and no flush draw is live, then hearts and spades are labels, not
facts. Two hands that differ only by a relabelling of suits reach the same
decision from the same position, and they should share a row.

Canonicalising is the fix: for each hand, enumerate the suit permutations,
apply each one, and keep the lexicographically smallest result. The smallest
image is the canonical form, and every hand in the orbit maps to it.

The saving is not marginal. On the flop it is close to a factor of four, and
it compounds through every street below.

*Placeholder prose written by Claude. Replace or delete before publishing.*
