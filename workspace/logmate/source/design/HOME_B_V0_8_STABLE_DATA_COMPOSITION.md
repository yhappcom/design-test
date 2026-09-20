# LogMate HOME-B v0.8 — Stable Data Composition

Status: ACTIVE OWNER-REVIEW CANDIDATE / NOT PRODUCT AUTHORITY
Date: 2026-09-19
Lineage: HOME-B v0.7.1 -> v0.8
Trigger: owner requested overall visual improvement and explicitly required DEP/ARR typography to remain visually stable, not only numeric data.

## Design objective

Use stability of operational data as part of the visual system.

The Home should not merely look aligned in a static screenshot. Repeated operational values should keep their spatial anchors when content changes.

## Stable data roles

### Numeric data

Continue tabular numeral treatment for:
- block time;
- current-period totals;
- Activity values;
- Totals;
- dates where numeric width matters.

### DEP / ARR airport codes

Each three-letter airport code uses:
- equal-width character cells;
- a fixed DEP slot;
- a fixed arrow slot;
- a fixed ARR slot.

This means the route geometry is stable independently of the proportional sans used elsewhere.

The approach deliberately avoids making the whole product monospace.

### Flight identifiers

Flight identifiers use equal-width character cells in the metadata role so mixed letters/numbers scan with less horizontal jitter.

## Typography

v0.8 further reduces size dominance:
- product identity: 17;
- current-period context: 22;
- current-period values: 20;
- section headings: 15;
- route/duration: 16;
- supporting metrics: 17;
- body/search: 13;
- metadata: 11.5.

The design continues to treat the CI review font as a surrogate. No production typeface is selected.

## Layout changes from v0.7.1

- Settings loses the filled circular chrome and becomes a quiet 44x44 icon target.
- Add Flight remains the only strongly filled top action.
- View Logbook becomes a lower-chrome secondary action.
- Search is slightly shorter and quieter.
- current-period and section spacing is tightened again.
- Recent Flights becomes the main stable-data specimen.
- Activity period control changes from a full-width segmented tray to independent low-chrome targets.
- Totals keeps open composition with tabular values.

## Interaction and accessibility

Preserved:
- English-only;
- Home ad-free;
- no bottom navigation;
- Add Flight primary;
- View Logbook secondary;
- Search immediately after actions;
- Current Period distinct from Activity;
- 7D / 28D / 90D / Custom;
- natural vertical scroll;
- 200% text pressure gate;
- short-height gate;
- Search + IME gate.

## Explicit non-goals

- no custom production font claim;
- no aviation imagery;
- no card dashboard;
- no decorative glass/gradient;
- no fake new Home feature;
- no semantic change to Home families.

## Review focus

1. Does DEP / ARR remain visually locked as route content changes?
2. Does the Home now feel calmer and less generic than v0.7.1?
3. Is the type hierarchy compact without becoming dense?
4. Does low-chrome secondary UI improve the premium impression?
