# LogMate HOME-B v0.6 — Premium Identity Pass

Status: OWNER REVIEW CANDIDATE / NOT SELECTED / NOT PRODUCTION
Date: 2026-09-19
Lineage: HOME-B v0.5 -> v0.6
Research input: PREMIUM_IDENTITY_BENCHMARK_20260919.md

## Purpose

v0.6 does not reopen the validated Home information architecture.

It preserves v0.5 semantics and introduces a controlled premium-brand identity layer based on:
- essential reduction;
- precision;
- material honesty;
- contextual restraint;
- micro-detail finishing.

Internal character:
**Quiet Precision**

This phrase is design vocabulary only and is not product copy.

## Fixed invariants

- English-only.
- Home ad-free.
- Add Flight remains primary.
- View Logbook remains secondary.
- Search remains directly after work actions.
- current calendar orientation remains distinct from rolling Activity.
- Recent Flights / Activity / Totals remain distinct semantic families.
- Activity remains 7D / 28D / 90D / Custom.
- no aviation imagery.
- no lifestyle imagery.
- no fake material texture.
- no gradient used to imitate metal/glass.
- no rounded-card dashboard grammar.
- no bottom navigation.
- no new product feature.
- same mock flight data as v0.5 for direct visual comparison.
- 200% text / short height / Search+IME remain hard gates.

## Premium translation

### Typography
- Keep mature fallback typography until Type production gate closes.
- Increase role contrast through proportion, weight and alignment rather than adding multiple families.
- Make operational values visually stronger than chrome.
- Use tabular figures for operational numerical readouts.

### Header
- Retain LogMate + Settings only.
- Replace generic gear icon with restrained textual Settings action for this candidate.
- At enlarged text, header recomposes vertically instead of shrinking.

### Work actions
Primary:
- near-square 2px radius;
- graphite field;
- 3px sparse accent rail;
- label + minimal plus mark.

Secondary:
- ruled action strip rather than pill/card;
- no filled box ownership.

### Search
- remove generic Material search icon;
- use a small SEARCH locator plus an authored retrieval line;
- focus increases line weight and accent, not component size.

### Calendar
- month becomes the Home orientation signature:
  - SEP as dominant datum;
  - 2026 subordinate;
  - month controls quiet on the opposite axis.
- This month / This year remain unchanged in meaning.

### Recent Flights
- introduce a narrow metadata rail for date + flight identifier;
- route becomes the primary text axis;
- duration becomes the aligned numerical outcome;
- rules begin after metadata rail rather than spanning the entire row.

### Activity
- selection uses a small horizontal precision mark instead of a conventional tab underline;
- value plane keeps vertical datum separators;
- no compliance implication is added.

### Totals
- preserve the three current candidate slots;
- stronger numerical alignment and quieter labels;
- no cards or KPI blocks.

## Palette

Light:
- warm mineral canvas;
- graphite text/action field;
- low-chroma petrol accent;
- quiet neutral rules.

Dark:
- near-black neutral canvas;
- charcoal action field rather than inverted white block;
- restrained cyan/petrol accent;
- separately authored text/rule values.

Color is not the identity by itself. Proportion and data geometry remain primary.

## Responsive rule

At pressure:
- action pair stacks;
- header recomposes;
- month/navigation can wrap;
- metrics become label/value rows;
- Recent rows become vertical;
- Totals become stacked label/value;
- section links can move below headings.

No type shrink is permitted to preserve the normal composition.

## Not decided

- final production typeface;
- final custom icon family;
- final production motion/haptic language;
- physical-device palette lock;
- tablet/EFB recomposition;
- first-use transfer styling;
- owner selection between v0.5 and v0.6 lineage.

## Implementation evidence

Design-only Flutter:
- `design/prototype/logmate_visual_preview/lib/premium_v0_6.dart`
- preview exposes v0.6 and v0.5 side-by-side through the design shell.

Production `lib/` remains unchanged.
