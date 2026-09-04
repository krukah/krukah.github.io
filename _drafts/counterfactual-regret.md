---
title: "Counterfactual regret without the notation"
date: 2026-08-14
tags: [ai]
plate: tree
description: >-
  What regret matching is actually doing, in words, before a single
  summation appears.
---

Every explanation of counterfactual regret minimisation opens with the same
three lines of notation, and every one of them loses the reader before the
idea arrives. The idea is small. Here it is without the notation.

You are at a decision point. You played some mixture of actions. Afterwards
you ask, for each action you could have taken: how much better would I have
done if I had always played that one instead? That number is the regret for
the action. Keep a running total of it. Next time you reach this decision,
play each action in proportion to how much positive regret it has
accumulated.

That is the whole algorithm. Everything else is bookkeeping about *how* you
estimate "how much better would I have done" when the game tree is too large
to walk.

The counterfactual part is the one word that earns its place. You do not
weight a decision point by how often you actually reach it — you weight it by
how often you would reach it if you were trying to. Otherwise a line you have
learned to avoid stops producing regret, and you stop learning why you were
right to avoid it.

*Placeholder prose written by Claude. Replace or delete before publishing.*
