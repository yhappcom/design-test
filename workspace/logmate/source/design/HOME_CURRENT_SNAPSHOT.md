# LogMate Home — Current Design Snapshot

Status: **CURRENT OWNER-REVIEW CANDIDATE / NOT FINAL VISUAL BASELINE**  
Date: 2026-09-19  
Lineage: HOME-B v0.11  
Implementation reference: `design/prototype/logmate_visual_preview/lib/home_v0_11.dart`

## 1. Authority and use

This file contains the **current Home candidate only**.

Use it for current design review, prototype maintenance, transfer work, and implementation comparison.  
Do **not** reconstruct the current Home from earlier values in `HOME_B_V0_11_VISUAL_SYSTEM_CONSOLIDATION.md` or earlier D-019 refinements.

Authority boundaries:
- product/domain meaning: `MASTER.md` and `docs/specs/`;
- current Home visual state: this snapshot;
- historical design reasoning and rejected trials: consolidation / decisions chronology;
- this snapshot is **not** a final visual baseline until explicit owner selection and canonical promotion.

## 2. Current composition

Order:

`Header -> Actions -> Search -> Current Period -> Recent Flights -> Activity -> Totals`

Home remains:
- ad-free;
- English-only UI;
- natural vertical scroll;
- no bottom navigation implied by this candidate;
- free of repeated stock Material card/dashboard grammar.

## 3. Header and primary actions

### Header
- identity: `LogMate`;
- Settings: outlined gear;
- Settings hit target: 40 x 40 logical px;
- glyph: 18px;
- glyph receives a right-edge optical adjustment while the hit target remains unchanged.

### Actions
- `＋ Add Flight` at the left;
- `View Logbook ›` at the right;
- equal semantic/visual hierarchy;
- neutral secondary glyphs;
- no filled primary-button treatment.

## 4. Search

Current visual candidate:
- placeholder: `Search logbook`;
- interaction target height: 40px;
- visible search surface: 34px;
- radius: 7px;
- search icon: 16px;
- text/hint: 12.5px.

Product boundary:
- input/focus shell exists;
- query/results are not implemented;
- Home suggestion/autocomplete behavior remains **SEARCH-001 OPEN**;
- Add Flight airport autocomplete is a separate contract.

## 5. Current Period

Context presentation:
- month context: 19px;
- year metadata: 12.5px;
- two equal metric columns: `This month` / `This year`.

**Owner-confirmed metric semantic: Block Time.**

Therefore both Current Period duration values represent Block Time aggregation for their displayed period context.

Still OPEN:
- raw vs credited Block Time;
- opening-balance treatment;
- exact operational-date / UTC period boundary;
- real calculation/ledger connection.

Current prototype values such as `42+15` and `318+40` are mock presentation data, not calculated product results.

## 6. Recent Flights

### Geometry
Content width at the 390px reference: 342px.

Track allocation:
- Date: 23%;
- Flight: 25%;
- Route: 30%;
- Block: 22%.

Headers and outer value components are centered in their semantic tracks.

### Date
Current Home candidate:
- selective monospace;
- size 13.5px;
- weight 400;
- letter spacing 0;
- tabular figures retained for numeric date characters.

Header `Date` remains proportional UI typography.

### Flight
Keep the current presentation grammar.

Semantic:
- IATA-style commercial flight identifier;
- 2-character carrier designator;
- 1–4 digit flight number;
- optional 1-character operational suffix;
- 7-character presentation capacity.

Presentation:
- internally zoned carrier + number/suffix;
- carrier/number zone structure remains distinct;
- do not replace with intrinsic whole-string centering;
- do not restore the rejected equal-character-cell experiment.

### Route
DEP / ARR current Home candidate:
- selective monospace;
- size 13.5px;
- weight 400;
- letter spacing 0.

Arrow:
- independent center zone;
- tertiary/quiet visual role.

Current 390px Route budget supports the reviewed `WAW -> ICN` class of stress without horizontal overflow in the static reference.

### Block
- current operational-data font remains proportional;
- tabular figures;
- centered fixed value box: 52px at base scale;
- normal capacity target includes at least `00+00`.

## 7. Activity

Periods:
- `7 days`;
- `28 days`;
- `90 days`;
- `Custom`.

Current selection reference: `28 days`.

Interaction:
- four equal full-width selection zones;
- selected state = local neutral surface + weight;
- no underline/tab grammar.

Summary:
- Legs;
- Block;
- TO / LD.

Summary numerics use the quieter summary-data role rather than Current Period primary emphasis.

`28 days` is an aviation-aligned rolling activity window, not a compliance/currency claim.

## 8. Totals

Home current candidate:
- section destination: `Details ›`;
- no Home-level `Customize`;
- three equal current candidate slots:
  - Block;
  - Night;
  - Inst.

Stress capacity reference:
- `99,999+59` in all three slots.

This does **not** close TOTAL-001 category/slot/persistence decisions.

## 9. Section destination grammar

- Recent Flights -> `View all ›`;
- Activity -> `Details ›`;
- Totals -> `Details ›`.

Current utility tone:
- secondary-neutral;
- not default accent green.

Literal chevron rendering remains a prototype detail; a final platform-stable icon primitive may replace the text glyph without changing semantics.

## 10. Typography roles

Current Home role hierarchy:
- Identity: LogMate;
- Context: month/year;
- Section: Recent Flights / Activity / Totals;
- Data Label: metric and column labels;
- Primary Data: Current Period Block Time values;
- Summary Data: Activity/Totals values;
- Operational Data: Route / Block row values;
- Metadata: Date / Flight identifier;
- Action / Utility: commands and section destinations.

Current selective-monospace use is intentionally narrow:
- Recent Date;
- Recent DEP/ARR.

Not current policy:
- global monospace UI;
- equal per-character cells;
- automatic application to View Logbook / Activity Detail / Add Flight.

## 11. Color

Light:
- canvas: `#FAFBF8`;
- surface: `#F0F2EF`;
- text: `#151817`;
- secondary: `#606864`;
- tertiary: `#7C847F`;
- accent: `#326A6D`.

Dark:
- canvas: `#101311`;
- surface: `#1A1F1C`;
- text: `#F1F3F0`;
- secondary: `#A9B0AB`;
- tertiary: `#858D88`;
- accent: `#8EBFC1`.

Accent is reserved for explicit state/focus/semantic use, not generic utility navigation.

## 12. Rejected / superseded treatments

Do not restore:
- stock Material card/dashboard grammar;
- Route-dominant historical Recent track ratios;
- Header -> Search -> Current Period -> Actions historical order;
- accent-green generic View all / Details links;
- Activity underline/tab treatment;
- Home Totals Customize action;
- equal per-character fixed-cell Date/Flight/Route experiment;
- intrinsic whole-string Flight centering.

## 13. Current open items before baseline promotion

1. Select and register a production monospace family or other verified native implementation that reproduces the accepted Date/DEP/ARR treatment.
2. Validate that typography on native iOS and Android; generic `fontFamily: 'monospace'` in the prototype is not the production contract.
3. Decide whether the accepted Date/identifier treatment transfers to View Logbook and Activity Detail after rendered comparison.
4. Resolve Search interaction under SEARCH-001.
5. Resolve TOTAL-001~004 product aggregation/configuration questions as applicable.
6. Replace prototype literal chevrons with a platform-stable icon primitive if native review shows metric inconsistency.
7. Execute native Flutter/runtime, 200% text, IME, semantic, physical-device and representative-user validation before final baseline claims.

## 14. Evidence boundary

Current evidence includes static Light/Dark code-render review and targeted stress references.

Do not claim from this snapshot:
- final visual baseline;
- native iOS/Android typography parity;
- production monospace family selection;
- Flutter runtime/golden/IME/200% PASS for the latest candidate;
- representative-pilot usability PASS;
- app-wide operational typography approval.
