# LogMate HOME-B v0.7.1 — Typography & Layout Render Review

Date: 2026-09-19
Status: CODE-RENDERED / OWNER REVIEW READY / NOT FINAL LOCK
Branch: design/first-use-baseline-20260918
Validated head: `5015ed5ec4918fb4ba9ae4a658cff02df87d8be2`
CI run: `35417132625`

## Trigger

Owner review of v0.7 identified:
- text appearing unstable / visually shaky;
- type feeling too large;
- need to re-review typography and layout together rather than continue cosmetic styling.

## Root-cause split

### Review-raster issue

The prior golden harness supplied only a limited review-font source and could visually overstate heavy/synthetic weight behavior.

The final v0.7.1 harness:
- loads a complete installed Regular/Bold family where available;
- prefers a neutral mature sans fallback;
- selected `Liberation Sans` on the validated CI runner;
- remains review-only and does not lock production typography.

### Product-composition issue

v0.7 hierarchy was still too size-dominant for a 390px Home.

The calibration reduces:
- identity 20 -> 18;
- current-period context 28 -> 24;
- primary current values 26 -> 22;
- section headings 17 -> 16;
- flight route/duration 19 -> 17;
- activity/totals values 19 -> 18;
- body/search 15 -> 14;
- metadata 13 -> 12.

## Baseline/rhythm repair

### Current period

`September` and `2026` now share one rich-text baseline rather than being separately positioned children.

### Recent Flights

Each row now uses:
1. one quiet metadata line;
2. route + duration on the same alphabetic baseline.

The previous vertically-centered two-line left block is removed.

### Control geometry

- visible icon circles are slightly smaller;
- interaction targets remain 44x44;
- action/search height is slightly reduced;
- control radii remain contemporary but less visually inflated.

## Layout calibration

Reduced spacing:
- Header -> actions;
- actions -> search;
- search -> current period;
- current period -> Recent;
- Recent -> Activity;
- Activity -> Totals.

Page inset increases from 22 to 24 to create a more controlled text column.

The result fits more information without shrinking accessibility text or turning Home into a dense ledger.

## Gate result

PASS:
- Flutter analyze;
- Home semantic regression;
- 200% text;
- short-height viewport;
- focused Search + simulated IME;
- light golden;
- dark golden;
- golden artifact upload.

## Visual review conclusion

Compared with v0.7:
- type hierarchy is calmer;
- oversized-display feeling is reduced;
- repeated flight rows scan more evenly;
- baseline wobble is reduced;
- Light and Dark share a more consistent density;
- control surfaces no longer dominate the content.

Remaining open:
- final production typeface;
- native iOS/Android font raster comparison;
- LogMate identity wordmark/type treatment;
- final icon optical system;
- physical-device validation;
- representative pilot/human validation.

This candidate is ready for owner visual review but is not a baseline lock.
