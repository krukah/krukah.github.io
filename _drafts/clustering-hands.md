---
title: "Clustering hands by the shape of their futures"
date: 2025-11-05
tags: [ai]
plate: cluster
description: >-
  A hand is not a strength. It is a distribution over the strengths it can
  still become.
---

The naive abstraction sorts hands by equity and cuts the sorted list into
buckets. It is fast, it is easy to explain, and it throws away the thing that
makes poker interesting.

Two hands can have the same equity and want completely different things. A
made middle pair is a flat distribution: it will probably still be a middle
pair on the river. A suited connector is bimodal: it becomes very strong or
worthless, and almost never lands in between. Averaging both to a single
number puts them in the same bucket, and the solver then plays them the same
way, which is wrong twice.

The fix is to cluster the distributions rather than their means. Represent
each hand as a histogram over its equity on the next street, then group hands
whose histograms are close under earth mover's distance. Bimodal hands find
each other. Flat hands find each other. The buckets start to look like the
categories a human player would name without being told to.

*Placeholder prose written by Claude. Replace or delete before publishing.*
