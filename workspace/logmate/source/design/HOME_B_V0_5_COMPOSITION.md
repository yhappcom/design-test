# LogMate HOME-B v0.5 — Specialist-led Composition

Status: ACTIVE CODE-RENDER CANDIDATE / NOT FINAL BASELINE
Date: 2026-09-19
Lineage: HOME-B v0.2 -> v0.3 -> v0.4 -> v0.5

## Why v0.5 exists
v0.4 proved the visual system in Flutter, but its composition still resembled the current production Home: each confirmed information family was rendered as a vertically stacked section.
v0.5 keeps the same semantics and visual system while redesigning the Home composition around specialist consensus.

## Fixed invariants
- English-only.
- Home ad-free.
- C017 System C low-chroma operational working palette.
- no stock Card/dashboard grammar.
- no greeting/Captain hero.
- no aviation imagery.
- no bottom navigation.
- no new product feature.
- Search remains directly below the work actions.
- Current Period / Recent / Activity / Totals remain distinct semantic families.
- Activity quick periods remain 7D / 28D / 90D / Custom.

## Composition

### 1. Header
`LogMate` + Settings only.

### 2. Work band
`Add Flight` primary + `View Logbook` secondary.
Horizontal only when text/width permits; otherwise recompose vertically. Never shrink type to preserve one row.

### 3. Retrieval
Full-width Search line immediately after the work band.

### 4. Calendar orientation
Do not render a generic boxed `Current Period` dashboard.
Use the actual current month as the orientation datum:
`‹  SEP 2026  ›`
followed by only:
- This month
- This year

This preserves the Current Period semantic family while reducing one unnecessary heading layer.

### 5. Recent flights
Home rows are not a miniature ledger.
Each row uses two levels:
- metadata: date + flight number;
- primary: route, with duration aligned as the numeric outcome.

Example:
`SEP 02 · 7C132`
`GMP → CJU                         1+12`

Use 2–3 rows, restrained rules, no row cards.

### 6. Activity
Below Recent in natural scroll.
Period selector remains text/indicator based.
Metrics: Legs / Block / TO/LD.
At enlarged text, metrics recompose rather than clip.

### 7. Totals
Lower reference layer.
Three configured Home total slots remain for this candidate.
`Customize` and `Details` stay subordinate and may wrap/recompose independently.

## First viewport intent
At normal compact phone size, optimize for:
1. task start;
2. retrieval;
3. current calendar orientation;
4. latest record resumption.

Do not optimize for showing Activity and Totals above fold.

## Accessibility/reflow requirement
- controls use minimum height, not fixed height;
- button labels may wrap/recompose but are never scaled down;
- section heading/trailing actions may wrap;
- Recent and metric planes recompose under large text;
- 200% text, short-height and Search+IME are CI gates.

## What v0.5 does NOT decide
- final production typeface;
- final physical-device color tokens;
- final Home total-slot semantics after engine closure;
- Empty Home Search behavior;
- tablet/EFB composition.