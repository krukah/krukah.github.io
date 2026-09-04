---
title: "The title, in sentence case"
date: 2026-09-04
tags: [software]
plate: lattice
description: >-
  One sentence. It becomes the subtitle under the title, the summary in the
  feed, and the description a link preview shows.
---

Open with the claim. No throat-clearing, no "in this post I will".

## A heading, if the piece needs one

Body text is IBM Plex Serif at 17.5px over a 34rem measure. Links look
[like this](https://example.com). Inline `code` looks like this.

- Lists get a faint marker
- One idea per item

> A pull quote sits behind an amber rule.

```rust
fn worth_saying(x: u32) -> u32 { x + 1 }
```

Drop one of the plates into the body as a figure when a drawing helps:

<figure>
  {% include plate.html name='wave' scale='lg' %}
  <figcaption>Fig. 1 — what the drawing shows.</figcaption>
</figure>

Available plates: `rosette` `ladder` `tree` `cluster` `wave` `lattice`
`keys` `reel` `compass` `candles`. Add a new one as an SVG in `_includes/plates/` and a `when`
branch in `_includes/plate.html`.
