# LogMate Home UI Candidate Package 02

Status: OWNER-DECISION PACKAGE PREP — NON-CANONICAL
Date: 2026-09-19
Baseline: NONE SELECTED
Active lineages: HOME-A v0.2 / HOME-B v0.3

## Coordinator recommendation

Recommend **HOME-A v0.2 — Action → Current Period → Recent → Search → Activity → Totals**.

Reason:
- preserves Manual-first and current Home product families;
- gives immediate current-period orientation without inventing a career/lifetime hero;
- lets Recent confirm/resume the latest operational context before opening a keyboard-heavy retrieval mode;
- transfers cleanly to Empty Home, Add Flight and View Logbook;
- keeps Search first-class but prevents focused Search from owning the entire upper Home surface.

HOME-B v0.3 remains a valid retrieval-weighted alternative:
`Action → Search → Current Period → Recent → Activity → Totals`.

## Shared complete visual system — S1 Warm Neutral Operational

This system is shared by A and B. It is a coordinator synthesis for comparison, not a lock.

### Source inheritance

From current production theme/code:
- light surface `#FFFAF8` as the default decision specimen surface;
- primary text `#171715`;
- existing brand green `#00A693` only for primary action/focus/selected reinforcement;
- existing spacing family `4 / 8 / 12 / 20 / 28 / 36`;
- existing 20 / 17 / 15 type-role family;
- current Settings entry and current Material icon semantics may remain as neutral implementation references.

From Titanium/Instrument Archive research:
- datum/rule hierarchy;
- tabular numeric discipline;
- calm dense rows;
- asymmetry driven by information importance.

Explicitly not inherited:
- dark-only appearance;
- aircraft/cockpit/watch imagery;
- Titanium naming/slogans;
- career/lifetime hero;
- invented navigation/features.

From daylight/blue proposals:
- daylight legibility;
- clear Home information grouping.

Explicitly not inherited:
- blue-heavy identity;
- equal rounded dashboard cards;
- hero aviation imagery;
- unauthorized bottom navigation.

From Previous Total work:
- state orthogonality;
- semantic labels;
- precise numeric/input hierarchy.

Explicitly not inherited:
- teal as a second independent brand system;
- generic radio-card/form-card identity.

## System matrix

### Appearance
- light warm-neutral default specimen aligned with current theme implementation;
- dark remains an implementation-supported appearance to validate later, not a separate brand language;
- no gradient, glass, aviation photography or decorative texture.

### Surface hierarchy
- one page surface;
- grouping by spacing/alignment/rules first;
- stock Flutter/Material cards and box panels are excluded;
- no repeated rounded section containers;
- true controls may use custom-authored boundaries only when interaction affordance requires them.

### Typography
- screen/product label: 20 role;
- section and operational emphasis: 17 role;
- body/actions/row labels: 15 role;
- numeric values use tabular figures where available;
- exact font family remains provisional; candidate must survive current LogMateRoboto/system fallback.

### Numeric grammar
- cumulative/duration display uses current product `H+MM` contract where applicable;
- values right-align within comparison rows;
- no oversized unsupported career total.

### Rule grammar
- 1px low-contrast neutral rules separate rows/semantic boundaries;
- section separation relies on 20–28px rhythm;
- rules never replace required touch-target geometry.

### Actions
- Add flight is the strongest primary action;
- View logbook is strong adjacent secondary action;
- both remain at the top as confirmed product behavior;
- no giant hero CTA.

### Search
- 40px bounded input/control, matching current product contract;
- full-width on compact Home;
- restrained neutral fill/border; brand green appears on focus, not as persistent decoration.

### Navigation/chrome
- LogMate header + Settings entry;
- no bottom navigation is introduced;
- no new Home tabs;
- section-detail chevrons remain only where current product contract requires them.

### Icon policy
- use existing familiar semantic icons where useful;
- no decorative aviation iconography;
- text remains primary when clearer.

### Image policy
- no operational/lifestyle imagery on Home.

### Density progression
- Home = medium information density / low visual noise;
- Welcome later reduces this system;
- Add Flight increases interaction density;
- View Logbook increases data density.

### Responsive
- compact: one primary vertical axis;
- wide: recompose only when relationship/width evidence justifies it;
- no equal-card grid merely because width exists.

### State grammar
- focus, selected, error, disabled, read-only, recovery remain independent;
- no color-only state meaning.

### Ad boundary
- Home is ad-free in the current owner direction;
- no reserved Home ad region is rendered;
- monetization research moves to lower-intent detail/browse surfaces after this Home decision.

### Native/PWA
- same semantic visual system;
- no claim that install/storage/background/sync behavior is equivalent.

## Product families that MUST remain on Home

Both candidates retain:
1. header / Settings
2. Add flight
3. View logbook
4. Search
5. current month/year summary family
6. Recent
7. Activity
8. Totals

No candidate may delete one of these simply to simplify composition.

## Candidate A — HOME-A v0.2

Order:
`Header → Actions → Current Period → Recent → Search → Activity → Totals`

### Current Period
- compact month context with previous/current/next access;
- `This month` and `This year` values remain present;
- not a card hero;
- no unsupported lifetime metric.

### Recent
- section title + chevron/detail entry;
- 2–3 compact rows;
- date / flight / route / duration keep one readable semantic grouping;
- restrained row rules.

### Search
- placed after Recent;
- remains full-width and immediately recognizable;
- focused state may temporarily dominate the local area but not normal Home.

### Activity
- owner-confirmed quick periods: `Last 7 days / Last 28 days / Last 90 days / Custom`;
- Legs / Block / TO-LD remain the summary semantics;
- avoid KPI tiles; use aligned readouts.

### Totals
- preserve detail + Customize entries;
- exactly three Home total slots as current contract;
- aligned values, no hero.

## Candidate B — HOME-B v0.3

Order:
`Header → Actions → Search → Current Period → Recent → Activity → Totals`

All visual/system details are identical to A.

Difference:
- Search moves directly below Actions;
- Current Period and Recent move down by one region;
- no extra accent, card, icon or type change is allowed to make Search look more heroic.

## Decision-grade comparison requirement

The visual board must make the owner choose primarily between:
- A: context/resume before retrieval
- B: retrieval before context/resume

It must NOT make the owner choose between unrelated colors, fonts, cards, icons or navigation.

## Transfer strip requirements

Include small but real-looking transfer specimens using the same S1 system:

### Add Flight
- current section semantics preserved;
- current confirmed section containment may remain quiet/structural;
- no visual claim of Save/persistence completion;
- input/focus style shares Home grammar.

### View Logbook
- existing landscape ledger semantics preserved;
- same neutral/rule/numeric discipline;
- 36px row rhythm and compact-header logic remain product contract;
- no Home card grammar transferred into ledger.

## Old specimen standing

`HOME_AB_DECISION_SPECIMEN_v0.1.svg` and `HOME_AB_PRESSURE_SPECIMEN_v0.1.svg` remain structural/pressure evidence only.
They are not owner-ready complete UI candidates.

## Owner decision requested after visual render

Choose:
- HOME-A v0.2
- HOME-B v0.3
- or reject both.

If selected, that lineage becomes the first candidate eligible for `design/VISUAL_BASELINE.md` entry after explicit owner approval.

## Owner constraint update — 2026-09-19

This package must be re-rendered before owner comparison.

Mandatory changes:
- **all app UI inside device frames is English-only**;
- no Korean app strings;
- no stock Flutter/Material card/box look;
- no repeated rounded section panels;
- no generic filled Material input surfaces;
- preserve all current Home product families and A/B hierarchy difference;
- use line/rule/datum/spacing hierarchy instead of card hierarchy;
- do not change palette/type/navigation/ad policy merely because the primitive grammar changed.

Impact classification:
**SYSTEM REVISION REQUIRED, candidate lineages preserved.**
HOME-A v0.2 and HOME-B v0.3 remain the same hierarchy candidates; only their shared visual primitive layer must be revised.

## HOME-B v0.3 render delta

Owner-directed changes from v0.2:
- Home advertising removed completely.
- Activity quick period changes 30D -> 28D.
- Apply Design Studio C017 System C low-chroma operational light/dark palette for the portfolio render.
- Preserve English-only UI.
- Preserve no stock Flutter/Material box-card grammar.
- Preserve B hierarchy: Actions -> Search -> Current Period -> Recent -> Activity -> Totals.
- Greeting/Captain hero is not a confirmed Home family and is not part of the v0.3 render.

Unchanged:
- Add flight / View logbook remain top actions.
- Current Period remains calendar context.
- Recent, Activity and Totals remain distinct semantic layers.
- no bottom navigation, no aviation imagery, no invented feature, no lifetime/career hero.
