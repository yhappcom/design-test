# LogMate HOME-B v0.7.1 — Typography & Layout Calibration

Status: ACTIVE OWNER-REVIEW CANDIDATE / NOT PRODUCT AUTHORITY
Date: 2026-09-19
Lineage: HOME-B v0.7 local refinement
Trigger: owner observed text instability/shaking and an oversized type impression.

## Diagnosis

Two separate issues were identified.

### Preview raster / weight instability

The CI golden harness loaded only one Regular review-font file into `PreviewSans` while the UI requested heavier weights. The review harness therefore did not provide a complete Regular + Bold source pair for weight matching.

v0.7.1 loads an installed Regular + Bold pair into the same review family. This is a review-fidelity correction, not a production typeface selection.

### Hierarchy remained too size-dominant

v0.7 reduced industrial chrome, but the 390px Home still used large display/value roles that made the screen feel heavier than intended.

Design Studio Type Study 009 requires semantic roles before font choice and recommends using the minimum number of hierarchy variables. Layout Study 006 treats spacing/alignment as a relationship system rather than empty expansion.

## Revised normal-size role scale

| Role | v0.7 | v0.7.1 |
| --- | ---: | ---: |
| Product identity | 20 | 18 |
| Current-period context | 28 | 24 |
| Primary current values | 26 | 22 |
| Section heading | 17 | 16 |
| Flight route / duration | 19 | 17 |
| Activity / Totals values | 19 | 18 |
| Body / Search | 15 | 14 |
| Metadata | 13 | 12 |
| Control label | 14 | 14 |

Weight vocabulary is reduced toward Regular + Semibold/Bold roles rather than many intermediate visual weights.

## Baseline repair

Recent Flights changes from a two-line left column vertically centered against duration to:
- metadata line;
- route and duration on one alphabetic baseline.

Current month/year changes from two separately positioned children to one rich-text baseline.

## Layout calibration

- page inset: 22 -> 24;
- smaller top/action/search gaps;
- search/current-period: 32 -> 28;
- current-period/Recent: 34 -> 30;
- Recent/Activity: 30 -> 26;
- Activity/Totals: 34 -> 30;
- row padding reduced;
- metric column gap reduced;
- action/search visual height reduced slightly.

Small circular navigation controls keep a 44x44 interaction box even when their visible circle is smaller.

## Required gates

- semantic regression;
- 200% text;
- short-height viewport;
- focused Search + simulated IME;
- light/dark golden review.

## Open

- final production typeface;
- iOS/Android native font comparison;
- physical-device rasterization;
- custom LogMate type work;
- representative pilot/human validation.

No typeface lock is implied.
