# LogMate Home Render Contract 03

Status: PRE-SELECTION VISUAL RENDER CONTRACT — NON-CANONICAL
Date: 2026-09-19
Lineages: HOME-A v0.2 / HOME-B v0.2

## Purpose
Render owner-decision candidates without changing the already-defined hierarchy candidates.

## Non-negotiable system invariants
- all in-app UI is English-only;
- no Korean product strings inside device frames;
- no stock Flutter/Material Card look;
- no repeated rounded section panels;
- no equal-card KPI dashboard;
- no generic filled Material fields;
- no aviation lifestyle/hero imagery;
- no bottom navigation unless product authority later explicitly requires it;
- no new slogan, tagline, or invented feature;
- no career/lifetime hero total;
- same warm-neutral surface / graphite text / restrained existing brand-green role for both candidates;
- same typography roles and same component grammar for both candidates;
- preserve current Home product families: header/Settings, Add flight, View logbook, Search, current-period summary, Recent, Activity, Totals;
- first-populated Home ad-free; mature ad candidate is not part of this decision render;
- no production/runtime claim.

## Shared visual grammar
- warm neutral light surface;
- one dominant left datum;
- spacing and low-contrast rules establish grouping;
- section headings sit on the page, not inside cards;
- recent/activity/totals values use aligned rows and tabular numerals;
- primary action is authored, not a stock FilledButton;
- secondary action is quiet text/line control;
- Search is a custom low-profile bounded control with only the minimum interaction boundary;
- current-period selector/readout is line-based rather than boxed;
- Settings remains a small utility icon/action in the header;
- section-detail access may use a subtle trailing chevron/text link where current contract requires it;
- rounded geometry, if any, is reserved for an actual control boundary and must not create a card hierarchy.

## HOME-A v0.2
Order:
Header -> Actions -> Current Period -> Recent -> Search -> Activity -> Totals

## HOME-B v0.2
Order:
Header -> Actions -> Search -> Current Period -> Recent -> Activity -> Totals

## Comparison rule
The two candidate screens must look like the same app and same design system.
The only meaningful decision variable is whether Recent/current context precedes Search or Search precedes current context.

## Forbidden render drift
- blue-dominant rebrand;
- green-dominant rebrand;
- three-option expansion;
- Resume-led/Overview-led replacement;
- card stacks;
- Korean UI;
- hero greeting banner;
- plane icons as decoration;
- aircraft photos;
- bottom nav;
- map feature;
- made-up stats or sections beyond the current Home families;
- portfolio-style marketing copy around the app that obscures the actual UI comparison.

## Decision-readiness target
Each candidate must look like a plausible production Home, not a wireframe, while remaining non-canonical.
After render, owner should be able to choose A / B / reject both without needing to reconstruct missing layout detail.