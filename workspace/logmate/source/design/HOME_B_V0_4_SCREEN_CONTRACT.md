# LogMate HOME-B v0.4 Screen Contract

Status: REFINED PREFERRED CANDIDATE / NOT FINAL VISUAL BASELINE
Date: 2026-09-19
Lineage: HOME-B v0.2 -> v0.3 -> v0.4

## Purpose
Translate the cross-specialist review into a decision-grade Home without preserving the current implementation's visual packing.

## Unchanged invariants
- English-only UI.
- No stock Flutter/Material Card or generic box-panel grammar.
- Home is ad-free.
- Low-chroma operational color direction from Design Studio C017/C020–C022.
- No greeting/Captain hero.
- No aviation lifestyle imagery.
- No bottom navigation introduced.
- Product families remain: Header/Settings, Add flight, View logbook, Search, Current Period, Recent, Activity, Totals.
- Activity quick periods: 7D / 28D / 90D / Custom.
- Current Period is calendar context; Activity is rolling analysis; Totals is cumulative reference.

## HOME-B v0.4 order
`Header -> Actions -> Search -> Current Period -> Recent -> Activity -> Totals`

## Layout correction from v0.3
v0.3 visually compressed all major sections into one phone viewport.
v0.4 deliberately allows vertical scrolling.

First viewport priority:
1. Header / Settings
2. Add flight / View logbook
3. Search
4. Current Period
5. top of Recent

Below fold:
6. remainder of Recent
7. Activity
8. Totals

Do not reduce typography or row spacing merely to expose Activity/Totals above fold.

## Header
- `LogMate` left.
- Settings utility action right.
- No greeting.
- No subtitle, slogan, sync badge or ad.

## Actions
- Two explicit controls in one horizontal work band when width permits.
- `Add Flight` receives primary action role.
- `View Logbook` is adjacent secondary action.
- Controls may have authored interaction boundaries; they must not look like two dashboard cards.
- Minimum touch geometry remains accessible.

## Search
- Full-width direct retrieval control below Actions.
- Neutral when idle.
- Focus state uses focus semantic role and visible geometry, not color alone.
- No filled Material field appearance.
- Search-results monetization is not part of Home.

## Current Period
- Heading: `Current Period`.
- Current calendar month represented as English UI + numeric/date presentation consistent with date contract.
- Three operational values may be shown as a single aligned datum row rather than tiles/cards.
- Current period is concise and does not become a hero.

## Recent
- Heading: `Recent` with detail navigation when required.
- 2–3 recent rows are enough for Home.
- Each row preserves date / flight / route / duration semantic grouping.
- Use row alignment and restrained rules, not cards.
- Do not fabricate data in actual first-use states; populated candidate uses representative fixture only for composition review.

## Activity
- Text-tab period selector: `7D  28D  90D  Custom`.
- Selected period uses text/indicator geometry + semantic selected role.
- Avoid segmented-control box styling.
- Summary values: `Legs`, `Block`, `TO/LD`.
- Values align as one operational readout plane.

## Totals
- Lower in the scroll hierarchy.
- Preserve exactly three Home slots until product contract changes.
- No career/lifetime hero.
- Detail/Customize affordances remain subordinate.

## Light semantic palette
- canvas #F7F8F8
- surface #FFFFFF
- primary text #1B2224
- secondary #596164
- rule #C9CED0
- action #355F6B
- focus #654FB0
- selected #E0EAED

## Dark semantic palette
- canvas #14191B
- surface #1A2022
- primary text #F0F3F4
- secondary #BCC3C5
- rule #4B5558
- action #9BC3CF
- focus #B8AAE5
- selected #29373B

Dark is separately authored semantic mapping, not inversion.

## Required validation after render
- Type pressure with 15/17/20 roles and tabular numerals.
- 200% text/reflow.
- Search focus + software keyboard.
- short-height viewport.
- dark-mode boundary visibility.
- grayscale/selected-state survival.
- native phone and PWA semantic continuity.
- no visual return to card/dashboard grammar.
