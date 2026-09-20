# HOME-B v0.10 — Precision Recomposition Plan

Status: INTERNAL ITERATION / NOT PRODUCT AUTHORITY
Date: 2026-09-19
Lineage: HOME-B v0.9 -> v0.10

## Research-backed changes

- L002: reduce unnecessary vertical chrome without reducing required information.
- Interaction 007/015: keep familiar action meaning while removing stock Material appearance.
- T017/T018/T020: preserve semantic route geometry; do not use blanket/generic monospace as the final identifier treatment.
- CD002/CD004: replace ambiguous 7D/28D/90D abbreviations with explicit day labels because brevity does not outrank comprehension.
- Layout 006/L001: use relationship grids and optical balance rather than mechanical right alignment.

## Planned composition

- Header/actions/search: smaller visible height while retaining interaction target safety.
- Current period: symmetric previous/next controls around September 2026.
- Recent Flights: one-line Date / Flight / Route / Block operational grid at normal text size; recompose at large text.
- Activity: 7 days / 28 days / 90 days / Custom, centered across full width.
- Activity metrics: centered 3-column summary grid.
- Totals: centered 3-column summary grid with stronger labels.
- Operational identifiers: mature proportional review face inside stable semantic slots.
- Numbers: tabular figures where repeated comparison matters.

## Internal gate

Do not send first render to owner.
Render -> specialist re-critique -> correct -> rerender until known research/deterministic mismatches are closed.


## Internal render/re-critique

The first v0.10 code render was not delivered to the owner.

Specialist re-critique found:
1. the primary/secondary pair still visually resembled generic app buttons;
2. using a selected underline to distinguish Add Flight would incorrectly imply persistent selection/tab state;
3. shortening Instrument Flight Time to Instrument weakened semantic fidelity and produced inconsistent Total-value baselines.

Corrections:
- replace standalone button surfaces with one shared low-profile command rail;
- use a compact filled plus affordance for Add Flight instead of selected-state styling;
- keep View Logbook as the secondary command with directional arrow;
- add a restrained rule under the Recent column header to reinforce schema without card chrome;
- restore Instrument Flight Time and reserve equal label height across all Total cells;
- keep Total values on one numeric baseline.

## Owner-review reference

The final internal 390x844 Light/Dark reference preserves:
- compact top region;
- symmetric month navigation;
- one-line Date / Flight / Route / Block scan path;
- explicit day terminology;
- centered Activity and Totals summary mass;
- full Total terminology;
- semantic route geometry with proportional identifier type.

No known mismatch with the owner's current feedback remains in the static owner-reference render.

## Runtime evidence boundary

Actions run 53 ended before usable step-level validation evidence was available. This document does not attribute a cause.

Pending:
- Flutter analyze;
- semantic contract execution;
- 200% text;
- short-height;
- Search + IME;
- Flutter golden generation.

These are runtime gates, not silently treated as passed.
