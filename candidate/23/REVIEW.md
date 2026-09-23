# Candidate 23 — Cockpit Paper — Review Gate

Baseline: `79fd5c43ca6b09ea5b773c77319709139f1b8089` (`checkpoint/home-structural-baseline-20260919`).
Generation inputs: baseline source/contracts only. Candidate 01, 17–22 and all rejected candidates were not used as design inputs.

Concept: restrained cockpit-document visual atmosphere. The candidate delegates the complete Home implementation to frozen `HomeV011` and applies only a mild theme-dependent color transform. Therefore order, displayed fixtures, product semantics, actions/destinations, interaction states and operational geometry are unchanged by construction.

## Canonical discipline passes
- Type — **KEEP**. Baseline font roles, tabular figures, airport monospace zoning, sizing and glyph coverage are unchanged; deterministic renderer loads explicit sans/mono/Material Icons fonts.
- Color — **KEEP**. Transform is deliberately mild and monotonic; it does not introduce new semantic color encoding or remove non-color state cues. Light becomes warmer paper; dark becomes cooler instrument ink.
- Layout / Spatial — **KEEP**. No layout widget, constraint, spacing, ordering or operational-data geometry is modified.
- Interaction — **KEEP**. Baseline hit targets, focus behavior, selection semantics and destinations remain untouched.
- Content / UX Writing — **KEEP**. No authored string, label, terminology, value or information sequence is modified.
- Web / runtime — **KEEP TO RENDER**. Source is a shallow visual wrapper around the frozen implementation; deterministic 390×844 runtime render is the next evidence gate.
- Accessibility / Human Factors — **KEEP**. Semantics tree and baseline large-text behavior are inherited unchanged; meaning does not depend on newly introduced color alone. Human task-performance evidence remains outside static expert review.
- Brand / Identity — **KEEP**. Direction avoids decorative aviation mimicry; identity remains restrained, operational and professional while creating a distinct paper/instrument atmosphere.

Unanimous pre-render gate: **PASS / KEEP TO RENDER**.

## Render / visual inspection
Pending GitHub Actions artifact. Candidate remains IN REVIEW until both final PNGs are opened and inspected.
