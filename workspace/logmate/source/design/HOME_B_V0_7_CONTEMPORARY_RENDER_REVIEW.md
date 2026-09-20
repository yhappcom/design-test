# LogMate HOME-B v0.7 Contemporary Premium Render Review

Date: 2026-09-19
Status: CODE-RENDERED / OWNER REVIEW READY / NOT FINAL LOCK
Branch: design/first-use-baseline-20260918
Validated head: `796c6d3436a3ae67f281a45f7779ad2b9056e14e`
CI run: `35415297386`

## Trigger

Owner review of v0.6:
- improved over v0.5;
- still rough;
- still carried an older-app impression;
- required materially more improvement.

## Gate result

PASS:
- Flutter analyze;
- v0.5 regression contract;
- v0.6 regression contract;
- v0.7 semantic contract;
- v0.7 200% text pressure;
- v0.7 short-height viewport;
- v0.7 focused Search + simulated IME;
- light golden;
- dark golden;
- artifact upload.

## What changed from v0.6

### Removed dated industrial grammar

Removed or materially reduced:
- uppercase SEARCH locator;
- underlined search-field language;
- full-width rule dependency;
- metadata rail;
- abbreviated SEP hero treatment;
- text Settings control;
- ruled rectangular secondary action;
- dash Activity selector;
- vertical metric separators.

### Introduced contemporary control material

Controls now use soft surfaces:
- Settings;
- Add Flight;
- View Logbook;
- Search;
- month navigation;
- Activity period selector.

Operational content itself remains mostly unboxed.

This intentionally follows the principle:
**material for controls; openness for content.**

### Hierarchy

Current period:
- natural-language `September 2026`;
- month is prominent without behaving like an instrument readout;
- period metrics sit in open space.

Recent Flights:
- date + flight identifier becomes one quiet metadata line;
- route is primary;
- duration is the aligned outcome;
- rows use spacing rather than separators.

Activity:
- familiar segmented interaction replaces the custom dash selector;
- metrics remain open below the control.

### Curvature

Rounded geometry is used only for interactive control surfaces.
The Home does not become a repeated rounded-card dashboard.

### Dark mode refinement

The initial v0.7 dark Add Flight surface was too bright/cyan.
Final candidate reduces it to a deeper petrol surface to keep primary emphasis without becoming consumer-bright.

### Settings semantics

The initial sliders/tune symbol could read as filtering.
Final candidate returns to a familiar Settings gear inside the modern control surface.

## Comparative judgment

v0.5:
- generic Material utility.

v0.6:
- authored, but industrial/archival and visually older.

v0.7:
- materially more contemporary;
- less line-heavy;
- less dashboard-like;
- more native/product-like;
- clearer separation between controls and content;
- more premium through spacing, restraint and surface hierarchy rather than decoration.

## Remaining open issues

- final production typeface remains open;
- icon family remains system/familiar, not custom LogMate iconography;
- motion/haptic finishing is not represented in static goldens;
- physical-device palette/rasterization validation remains open;
- tablet/EFB composition remains open;
- Welcome / Previous Total / Empty Home still use the prior visual layer;
- representative pilot/human validation remains deferred.

## Recommendation

Use v0.7 as the next owner-review candidate.

Do not promote it to MASTER/ui-contract until explicit owner approval.

If the owner still reports a dated or rough impression, do not produce another cosmetic v0.8 automatically. Reopen the identity model and typography/material architecture first.
