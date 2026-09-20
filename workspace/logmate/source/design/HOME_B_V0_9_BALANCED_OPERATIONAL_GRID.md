# LogMate HOME-B v0.9 — Balanced Operational Grid

Status: INTERNAL REVIEW CANDIDATE / NOT PRODUCT AUTHORITY
Date: 2026-09-19
Lineage: HOME-B v0.8 -> v0.9

## Trigger

Owner review identified a process and composition failure:
- the region below Activity did not use the available width coherently;
- Activity / Totals visually accumulated on the left;
- the first render was being handed to the owner before internal specialist re-critique.

## Research reconciliation

### Layout

Design Studio Layout Study 006 defines the grid as a relationship system coordinating edges, columns, baselines, rhythm and hierarchy.

v0.8 violated that intent below Activity:
- the quick-period control occupied only part of the width;
- the totals third metric dropped to a new left-anchored row;
- lower-screen elements did not share a stable column system.

v0.9 uses an invisible full-width grid:
- 2 equal columns for current-period metrics;
- 4 equal columns for Activity periods;
- 3 equal columns for Activity metrics;
- 3 equal columns for Totals.

### Type

Type Study 009 requires typography and column geometry to be designed together.

v0.9 therefore:
- keeps tabular numerals for quantities/time;
- replaces artificial per-character spacing with a mature review-only mono/data face for airport codes and flight identifiers;
- preserves fixed DEP / arrow / ARR slots;
- keeps production custom type OPEN.

### Interaction / owner-review process

Design Studio I041/I042 explicitly separates the internal deterministic iteration loop from the coherent owner gate.

This rule is promoted into design/README.md for future LogMate visual work.

## Composition changes

- Add Flight / View Logbook become equal-width action siblings with primary/secondary surface contrast.
- Search remains full width.
- Activity selector spans the full content width with four equal targets.
- Activity metrics span three equal columns.
- Totals becomes one three-column row instead of two columns plus a left-biased orphan metric.
- Totals actions align to the right edge.
- vertical spacing is compacted enough that lower Home reads as one composition rather than leftover content.

## Required internal gate

Before owner delivery:
- analyze;
- semantic contract;
- width-distribution contract;
- 200% text;
- short-height;
- Search + IME;
- light/dark golden;
- specialist visual re-critique;
- rerender if any deterministic/research mismatch remains.

No owner selection or baseline promotion is implied.


## Internal specialist re-review result

The first v0.9 composition was not sent directly to owner review.

Internal review compared the rendered result against:
- Type Study 009 — role-based hierarchy, stable numerical/data roles and typography-column cooperation;
- Layout Study 006 — full-width relationship grid, repeated alignment anchors and rhythm;
- Interaction I041/I042 — internal deterministic/specialist loop before coherent owner gate;
- current LogMate invariants in DECISIONS.

### Mismatches found and corrected internally

1. Metadata contrast was too weak.
   - Light tertiary moved from #858D88 to #7D8580.
   - Dark tertiary moved from #767E79 to #848C87.

2. Major vertical intervals were not sufficiently systematic.
   - Recent / Activity / Totals major transitions were normalized around a 22px rhythm.

3. Fixed operational data slots were not yet safe under large-text scaling.
   - date, flight-number, DEP, arrow, ARR and duration slots now scale with text.

4. The four equal Activity period cells could fail at enlarged text.
   - normal size retains four equal full-width columns;
   - large text recomposes to intrinsic-width Wrap targets.

5. v0.8 artificial character-cell spacing looked designed by geometry rather than by type.
   - v0.9 uses a mature review-only monospace/data role inside fixed airport/identifier slots.
   - custom LogMate operational type remains a later Type gate, not assumed finished.

### Final visual review

At the 390x844 owner-reference size:
- Activity uses the full content width;
- Activity metrics occupy all three horizontal regions;
- Totals occupies the same three-column grid rather than leaving an orphan left metric;
- Instrument Flight Time wraps inside a normalized label area while the three numeric values share one baseline;
- Recent flight routes remain stable without the conspicuous letter-by-letter spacing of v0.8;
- Light and Dark retain the same spatial hierarchy.

No known research/layout mismatch remains in the owner-reference render.

### Runtime evidence boundary

GitHub Actions runs 51 and 52 completed as failure before job-step evidence became available. Cause is not asserted here.

Therefore:
- local visual reference review is COMPLETE;
- Flutter analyze / semantic contract / 200% / short-height / IME / Flutter-golden execution for v0.9 remains PENDING;
- no production/runtime PASS is claimed.
