# LogMate HOME-B v0.6 Premium Render Review

Date: 2026-09-19
Status: CODE-RENDERED / OWNER REVIEW READY / NOT FINAL LOCK
Branch: design/first-use-baseline-20260918
Validated head: `997e6eee44a39191caa8e9ea468f04296299e15a`
CI run: `35413129800`

## Gate result

PASS:
- Flutter analyze;
- v0.5 semantic regression tests;
- v0.6 semantic contract test;
- 200% text pressure;
- short-height viewport;
- Search + simulated IME;
- light golden;
- dark golden;
- artifact upload.

No production Flutter screen was promoted.

## Direct visual comparison against v0.5

### Improved

1. **Authorship**
   v0.6 no longer depends mainly on a teal Material-style primary button for identity. The screen has a repeatable geometry system: accent rail, precision rules, metadata rail, numeric axes and asymmetric calendar datum.

2. **Calendar orientation**
   `SEP + 2026` reads as a deliberate Home landmark rather than a generic centered selector.

3. **Recent Flights**
   Date/flight metadata is visually quieter and spatially separated from route/duration. Operational data carries more visual authority.

4. **Action grammar**
   Primary and secondary actions are materially distinct without becoming two rounded cards.

5. **Light-mode character**
   Warm mineral canvas and graphite field reduce generic mobile-dashboard character while remaining readable.

6. **Dark-mode character**
   The refined dark primary action stays charcoal rather than becoming a large inverted light block.

7. **Section-link alignment**
   `View all` and `Details` remain inline at normal text and only recompose under large-text pressure.

### Preserved

- Add Flight remains primary.
- Search remains directly below actions.
- Current calendar period / Recent / Activity / Totals retain meaning.
- 28D remains the selected rolling activity example.
- no Home ad.
- no image/illustration.
- no new navigation.
- same recent-flight mock data as v0.5 after final drift correction.

## Remaining critique

### Typography
The hierarchy is materially better, but the underlying mature fallback is still generic. This is acceptable now because the custom-type production gate remains open. Premium identity must not be faked through excessive tracking or an unvalidated display face.

### Iconography
v0.6 intentionally reduces generic Material icon dependence, but a complete LogMate icon grammar does not yet exist. The plus and chevron marks are interim authored primitives, not a finished icon family.

### Motion / tactile finish
Static premium character is now visible. Motion, haptic and focus-transition finishing remain open and should be tested only after the static baseline is selected.

### First-use transfer
Welcome / Previous Total / Empty Home still use the older v0.4/v0.5-derived visual layer. They must not be silently restyled until owner decides whether v0.6 becomes the selected Home/system direction.

### Physical device evidence
CI goldens validate code geometry and bounded rendering, not calibrated physical appearance, glare, real-device font rasterization or representative-pilot preference.

## Coordinator judgment

v0.6 is a meaningful improvement over v0.5 specifically on the user's stated concern: v0.5 was too utilitarian and lacked the premium-brand image that motivated the Design Studio.

The improvement comes from:
- composition;
- proportion;
- precision;
- restrained material/color treatment;
- micro-detail;

not from luxury decoration.

This is sufficient for owner visual review.

Do not create v0.7 before owner review unless a technical or semantic failure is found.
