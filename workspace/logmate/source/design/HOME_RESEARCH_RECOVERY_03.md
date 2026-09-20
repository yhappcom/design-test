# LogMate Home Research Recovery — Period / Color / IA / Ads

Status: ACTIVE SYNTHESIS / NO NEW OWNER LOCK
Date: 2026-09-19
Purpose: recover existing research before further Home-B revision.

## 1. Rolling period research status

### Existing product/UI contract
`docs/specs/ui-contract.md` already confirms:
- Home quick Activity periods: `Last 7 days / Last 30 days / Last 90 days / Custom`;
- Custom period screen: `Month / Year / Date range`;
- Month lists months with records, newest first;
- `1 month / 3 months / 6 months` are explicitly not part of the quick-period contract;
- Home separately retains a current month/year summary family.

### What is NOT currently proven
No recovered LogMate research establishes that `30 days` was selected because FAA/EASA/Korean aviation recency regulations require 30 rather than 28 days.
The regulatory/logbook research currently recovered focuses on record fields, credit semantics, FCL.050-style record structure and company/FOM context, not a `28D vs 30D` Home-summary decision.

### Consequence
Do not redesign Home around 28D merely because some aviation regulations use rolling-day windows in other contexts.
Do not claim 30D is aviation-regulation-derived.
Current product contract remains `7/30/90 + Custom` unless a dedicated regulatory/product decision changes it.

### Role separation already present
- Current Month / This Year summary = calendar/current-period orientation.
- Activity `7/30/90/Custom` = rolling recent-activity analysis.
- Totals = cumulative/reference values.
These are not the same semantic question, though they can create visual redundancy if rendered with equal prominence.

## 2. Color research status

Design Studio Color research is already mature enough to constrain LogMate candidates.

### C017
Three complete light/dark semantic systems were authored under identical constraints:
- A: restrained neutral + cyan-blue action
- B: brand-forward teal
- C: low-chroma operational

C was provisionally selected for a dense operational/data-product archetype because:
- least dependent on decorative chroma;
- strong contrast margins;
- straightforward light/dark role continuity;
- action/focus/status roles remain separated;
- lower-chroma chrome competes less with dense data.

Important: C is not yet a LogMate product palette lock.

### C020
Light and dark are separately authored mappings from the same semantic roles.
Dark mode is NOT an RGB inversion.
Status/data/action/focus roles stay semantically separate across phone, tablet/EFB and desktop/web.

### C021/C022
Concrete candidate semantic pairs and deterministic contrast calculations exist.
Example research pair direction:
- light primary text around deep graphite on white;
- dark primary text near-white on deep graphite;
- action/focus roles are separate;
- all bounded text/state pairs in C022 exceed 7:1, but actual component/non-text/device validation remains separate.

### Current LogMate implication
Bright saturated blue is not supported as the default merely because recent generated boards used it.
The strongest existing studio direction for an operational log product is a low-chroma operational system, with semantic light/dark mappings authored separately.
The current production green `#00A693` is implementation evidence, not proof that brand-forward teal should own the final visual system.

## 3. Home information architecture recovery

Current product contract and design synthesis already preserve these Home families:
1. Header / Settings
2. Add flight
3. View logbook
4. Search
5. Current month/year summary
6. Recent
7. Activity
8. Totals

Active hierarchy candidates:
- HOME-A v0.2: Actions -> Current Period -> Recent -> Search -> Activity -> Totals
- HOME-B v0.2: Actions -> Search -> Current Period -> Recent -> Activity -> Totals

Owner has expressed a provisional preference for B; this is not yet a formal baseline selection.

### Greeting
Greeting is NOT one of the confirmed Home product families.
`Captain` emphasis has no recovered product/domain requirement.
Therefore greeting may be omitted without violating product IA.
If retained, it must carry real orientation/context value and not become a hero or role-based status claim.

### Scroll
Nothing in the current Home contract requires one-screen/no-scroll composition.
Given all confirmed Home families, vertical scrolling is the natural default unless later task testing proves otherwise.

### This Month vs Activity vs Totals
Existing contracts already treat them as three different layers:
- Current Period = calendar orientation / current month-year snapshot
- Activity = rolling recent windows `7/30/90/Custom`
- Totals = cumulative/reference

Recommended synthesis from existing research:
- keep all three semantics during Home-B refinement;
- reduce visual duplication by giving them different hierarchy and presentation, not equal KPI cards;
- Current Period remains concise;
- Activity is the analytical rolling-window section;
- Totals is lower cumulative reference.

## 4. Advertising research recovery

Marketing research 054 / 071 / 089 already establishes:
- first-value and protected work are not ad inventory;
- monetization boundary should follow a complete comprehension/value block;
- banner geometry should be reserved and stable;
- ads must not sit adjacent to frequent controls or split a semantic block;
- scrollable content favors inline adaptive banners technically;
- fixed/non-scrolling layouts favor anchored adaptive banners technically;
- actual placement quality requires later interaction/revenue evidence.

### Home consequence
The greeting/top-context area is a poor ad candidate.
Top Home contains identity, primary actions, Search/current context and should remain operational.

Because the current Home direction permits scrolling, the earlier blanket `anchored bottom banner` preference must be treated as conditional rather than universal.
For a scrollable mature Home, an inline adaptive slot after a complete product-value block is technically/research-consistent.
Exact placement remains OPEN and empirical.

Safest current design-review candidates:
- after Activity, before Totals; or
- after Totals.

Do not place an ad:
- between heading and its values;
- between Recent row identity and its value;
- between Activity period selector and Activity result;
- inside first-populated Home;
- in greeting/top context.

## 5. What is actually decided vs open

### Already supported / preserve
- Activity quick periods = 7 / 30 / 90 / Custom.
- Custom supports Month / Year / Date range.
- Current Period, Activity and Totals are distinct semantics.
- Home can scroll.
- greeting is optional/non-canonical.
- no product basis for emphasizing `Captain`.
- light/dark must use semantic role mapping, not inversion.
- low-chroma operational color system is the strongest existing research direction for this product archetype.
- top/greeting area is not an ad target.

### Still OPEN
- whether future aviation-specific regulation mode should add 28D or another compliance-oriented period;
- final LogMate light/dark palette values;
- whether current production green is retained as brand/action accent;
- exact Home ad slot (after Activity vs after Totals or other completed-value boundary);
- whether owner formally selects HOME-B v0.2 as the active baseline.

## 6. Next Home-B work

Do NOT create another fresh concept.
Revise HOME-B within lineage only after:
1. applying existing low-chroma semantic color research;
2. removing unsupported greeting/Captain hero treatment;
3. preserving Search -> Current Period -> Recent -> Activity -> Totals;
4. preserving 7/30/90/Custom until a real regulation/product decision changes it;
5. showing scroll behavior with Current Period, Activity and Totals as distinct hierarchy levels;
6. testing one or two ad-boundary specimens without treating either as final.