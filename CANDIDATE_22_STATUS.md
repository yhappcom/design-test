# Candidate 22 — Flight Manifest

Status: IN PROGRESS — PRE-RENDER GATE

Baseline: `79fd5c43ca6b09ea5b773c77319709139f1b8089`
Candidate branch: `candidate/22-flight-manifest`

## Independence
Candidate 22 was created directly from the structural baseline. Candidates 01, 02–11, 17–21 were not used as generation inputs. Candidate 12 code is present in the baseline and is used only as the baseline implementation that carries the frozen Home invariants.

## Frozen invariants
Preserved: Home section/order; LogMate/settings; Add Flight/View Logbook; Search logbook; September 2026 navigation; This month 42+15 / This year 318+40; Recent Flights fixtures and column geometry; Activity periods and metrics; Totals metrics; 44px action/control zones; baseline grid flex 23/25/30/22 and flight-row height 31.

## Visual thesis
Flight Manifest: restrained operational-document language rather than soft card UI. Square search field, hairline rules, compact uppercase micro-labels, tabular data, blue instrument accent, section datum marks, and selected-period underline. Light and dark are semantic counterparts.

## Canonical discipline review — R1
- Type: KEEP — tabular numerics, restrained weights, micro-label tracking, no decorative display type.
- Color: KEEP — neutral low-chroma surfaces; accent reserved for identity/navigation/selection and carrier cue.
- Layout/Spatial: KEEP — baseline operational geometry and section order preserved; visual hierarchy comes from rules/datums rather than structural movement.
- Interaction: KEEP — 44px control zones and semantics preserved; selected Activity state has color + underline + weight redundancy.
- Content/UX Writing: KEEP — all baseline labels/data retained verbatim; uppercase treatment is styling only.
- Web/runtime: KEEP TO RENDER — implementation is Flutter-native and deterministic evidence is the next gate.
- Accessibility/Human Factors: KEEP — 44px targets, non-color-only selected state, high-contrast semantic roles, tabular alignment; runtime overflow/glyph inspection still required.
- Brand/Identity: KEEP — technical flight-operations character without airline livery mimicry or decorative aviation metaphor.

Coordinator pre-render verdict: KEEP TO RENDER.

## Required next gate
Run deterministic 390×844 Light/Dark render; open both PNGs and inspect glyph/font rendering, 7C 1123 fit, icons, clipping/overflow, alignment, spacing, section boundaries, contrast/state expression. Only after both pass may status become AWAITING OWNER DECISION.
