# LogMate Home Visual Specimen Contract 01

Status: NON-CANONICAL — OWNER-DECISION PACKAGE PREPARED
Date: 2026-09-19
Baseline: NONE SELECTED
Active candidate lineage: HOME-A/B v0.1

## Purpose
Define decision-grade visual specimens without inventing a new identity. The owner compares hierarchy, not random styling. This contract does not select a candidate or create Portfolio Approval, Visual Lock, or Implementation Lock.

## Shared rendering grammar
A/B use the same visual tokens and content fixture. Only hierarchy/order/grouping may differ.

- compact-width portrait reference; device name is not a breakpoint;
- 24 logical-pixel working inset and one dominant start-edge datum;
- 20 task title / 17 section or numeric emphasis / 15 action, row, body and field roles;
- no production 10–13 helper tier, custom font claim, card taxonomy, decorative aviation identity or generic dashboard hero;
- neutral luminance hierarchy first; focus/selection/error/disabled/recovery remain orthogonal;
- bounded containers are reserved for actual controls; whitespace + rules carry grouping.

## Candidate A — HOME-A v0.1
Order: Header -> Work band -> Recent -> Search -> Activity -> Totals.
Empty transfer removes Recent/Activity/Totals rather than manufacturing zeros. Coordinator recommendation remains A.

## Candidate B — HOME-B v0.1
Order: Header -> Work band -> Search -> Recent -> Activity -> Totals.
Search receives no additional hero/card/accent styling merely because it ranks earlier.

## Decision and transfer artifacts
1. `design/specimens/HOME_AB_DECISION_SPECIMEN_v0.1.svg`
   - normal A/B mature comparison;
   - Empty Home;
   - Search focus;
   - Add Flight transfer;
   - View Logbook transfer.
2. `design/specimens/HOME_AB_PRESSURE_SPECIMEN_v0.1.svg`
   - 200% text/reflow relationship-failure recomposition;
   - Search + on-screen-keyboard pressure with query/result retained above the obscuration region;
   - explicit First Populated Home with no ad slot;
   - Mature Home with reserved adaptive-banner geometry only and no ad-runtime claim;
   - Add Flight primary-focus treatment independent from other state axes.

Illustrative data are layout fixtures, not runtime evidence. Exact hue/font/radius are rendering necessities, not proposed locks.

## Pressure-gate disposition
The previously missing visual-composition specimens are now represented. This closes the **portfolio/candidate composition coverage gap only**. It does NOT constitute physical-device, browser, keyboard/IME, AT, focus-order, persistence, sync, ad-SDK, calculation, or responsive-runtime PASS.

Therefore:
- candidate visual package: PREPARED FOR OWNER COMPARISON;
- HOME-A recommendation: unchanged;
- HOME-B: retrieval-weighted alternative;
- HOME-C: reference only;
- baseline: NONE SELECTED;
- Portfolio Approval / Direction Lock / Visual Lock / Implementation Lock: unchanged.

## Impact classification — 2026-09-19
LogMate `main` remains `b551ce43`: NO IMPACT on HOME-A/B.

The pressure artifact does not introduce a new visual identity. It applies the existing specimen grammar to missing states. Impact on active lineage: **SUPPORTS CURRENT DIRECTION**.

The 200% specimen intentionally recomposes the work actions vertically and splits Recent content by semantic relationship rather than shrinking labels. The keyboard specimen reserves an obscuration region rather than claiming a specific platform keyboard height. The mature-ad specimen reserves geometry without implying ad eligibility/runtime success. These are design pressure hypotheses pending matching runtime validation.

## Governance
- No owner selection is inferred from artifact completion.
- No design evidence is promoted to product authority automatically.
- Portfolio remains downstream and non-locking.
- Production Flutter remains unchanged.
