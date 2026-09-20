# LogMate Home Layout Synthesis — Research Transfer v0.1

Status: DESIGN SYNTHESIS / NON-LOCKING
Date: 2026-09-18
Branch: design/first-use-baseline-20260918
Purpose: translate current Design Studio Layout/Interaction research into a Home-first layout brief before visual exploration.

## 1. Why Home should be layout-led

Home is the product's central medium-density surface.

It must bridge:
- low-density Welcome / first-use;
- medium/high-density Add Flight and operational summaries;
- high-density View Logbook.

Therefore Home cannot be designed as a collection of attractive cards. Its primary problem is:
- whole-product hierarchy;
- semantic grouping;
- density control;
- responsive recomposition;
- action priority;
- ad-boundary protection.

## 2. Canonical layout research transferred

### Study 006 — Grid, Composition, Hierarchy
Key rule:
A grid is a relationship system, not a visible box system.

Transfer to Home:
- establish shared alignment edges;
- decide which elements belong to one scanning lane;
- allow asymmetry when hierarchy requires it;
- preserve relationships across viewport changes rather than coordinates.

Do not:
- impose equal-width cards simply because a grid exists;
- use symmetry as a proxy for balance;
- shrink a desktop/card grid into phone.

### Study 014 — Perceptual Grouping
Key rule:
Group before aligning.

Transfer to Home:
- identify semantic groups before drawing separators/containers;
- intra-group spacing must be perceptually smaller than inter-group separation;
- visible containment is a strong grouping claim;
- repeated cards create excessive common-region pressure.

Home implication:
Recent, Activity, Totals and core actions should not automatically become equal cards.

### L001 — Figure/Ground, Visual Balance
Key rule:
Balance is holistic and not identical to symmetry.

Transfer:
- Home may be asymmetrical if the hierarchy is clear;
- a dominant primary action cluster may carry more visual mass;
- optical correction cannot rescue broken hierarchy.

### L002 — Whitespace, Density, Spatial Rhythm
Key rule:
Information density != visual density != interaction density != navigation/temporal density.

Transfer:
- Home can show substantial operational information while remaining visually calm;
- remove visual competition, not useful information;
- spacing must have a job;
- dense repeated rows may be calmer than sparse decorated cards.

Density task model for Home:
- discovery: Add Flight / View Logbook / Search;
- monitoring: Activity / Totals;
- known-item scan: Recent;
- transition: drill-in to details.

### L045/L046 — Whole-product hierarchy before component polish
Key rule:
The meaningful layout unit is a user question and dependent evidence, not a card.

Transfer:
Home hierarchy must be designed as:
1. What can I do now?
2. What is current/relevant?
3. What happened recently?
4. What is changing over time?
5. What are my totals?
6. Where do I go for secondary controls?

An ad or unrelated control must not interrupt a protected semantic pair/group.

### L047/L050 — Protected semantic groups and reflow
Key protected groups relevant to Home:
- section heading → explanatory state;
- list item identity → primary metric → drill-in;
- value → qualifier/period;
- state → action → recovery.

Transfer:
- under narrow width / large text, groups may stack;
- semantic order must survive;
- no ad may split a protected first-value/data group;
- no sticky layer may obscure focused/meaningful content.

### L061/L062 — Constraint-budget responsive repair
Key rule:
Breakpoints emerge from content/constraint failure, not device names.

Transfer:
- don't design “iPhone layout” vs “iPad layout” first;
- calculate available width and competing claimants;
- recompose before shrinking type or targets;
- secondary metadata can move regions before primary semantics are dropped.

### L066 — LogMate projection/density
Key rule:
The View Logbook ledger may legitimately remain two-dimensional, but surrounding UI should not inherit that exception.

Transfer:
- Home remains one-dimensional/reflowable by default;
- do not bring ledger horizontal-scroll logic into Home;
- dense data can exist without semantic deletion.

### Latest L074 / I070
Key rule:
When a focused object disappears, reveal and move focus to a declared semantic fallback destination.

Transfer:
Later Home dynamic states (filtering, hidden sections, recovery) must use stable semantic identity, not ordinal position.

## 3. Home semantic regions before visual composition

Recommended semantic grouping, not final layout:

### Region A — Product / context header
- LogMate identity / current context
- Settings or secondary utility access

### Region B — Primary task actions
- Add Flight
- View Logbook

These form one task group but are not necessarily equal in visual weight.

### Region C — Search
Search is a direct retrieval task, not a decorative toolbar item.

### Region D — Recent
Purpose:
- resume context;
- confirm latest records;
- drill into recent work.

### Region E — Activity
Purpose:
- time-period behavior/monitoring.

### Region F — Totals
Purpose:
- cumulative/reference view.

### Region G — Monetization boundary
Only on mature eligible Home.
Must remain outside protected product groups.

## 4. Preliminary hierarchy

Working hierarchy for Mature Home:

1. Core action access
2. Current/recent operational context
3. Search / retrieval
4. Recent records
5. Activity
6. Totals
7. Secondary settings/navigation
8. Advertising, when eligible

Exact order of Search versus current/recent context remains a design question and must be evaluated against actual task frequency and Home data contract.

## 5. What Home should NOT become

Reject:
- equal-card dashboard;
- KPI tile grid;
- career-total hero without product authority;
- giant decorative header;
- persistent aviation illustration;
- bottom navigation added only for familiarity;
- color-coded dashboard hierarchy;
- mixed rounded cards + pills + shadows as identity;
- ad inserted between a metric and its qualifier;
- phone UI simply centered inside tablet whitespace.

## 6. Grid hypothesis

Initial Home grid should be defined by relationships:

Phone:
- one primary vertical reading axis;
- shared left/right page inset;
- aligned section headings;
- stable value alignment within repeated data families;
- local two-column metric pair only when semantic comparison benefits.

Wide:
- second region/column only when simultaneous context is useful;
- do not split merely because width is available.

Potential wide relationship:
- primary work + recent on one side;
- activity/totals context on another;

This remains a candidate, not a decision.

## 7. Density strategy

Home target:
Medium density / low visual noise.

Expected:
- more simultaneous information than Welcome;
- less density than View Logbook;
- lower visual density than a typical card dashboard.

Use:
- repeated alignment;
- section rhythm;
- typographic hierarchy;
- restrained separators;
- compact ledger excerpt where appropriate.

Avoid:
- large empty vertical gaps that increase scan distance;
- borders around every group;
- oversized headings;
- tiny secondary text.

## 8. Spatial rhythm working hypothesis

Reuse current portfolio spacing family:
4 / 8 / 12 / 20 / 28 / 36

But treat these as implementation candidates, not perceptual laws.

Required relational tiers:
1. within control/data pair;
2. repeated row separation;
3. local group separation;
4. section separation;
5. major region separation;
6. page inset.

The important test is perceptual distinction between tiers, not token compliance.

## 9. Responsive/reflow rules

Before a breakpoint:
- test actual label/value pressure;
- test longest realistic data;
- test 200% text;
- test ad-reserved state;
- test keyboard/focus where Search is active.

When pressure occurs:
1. allow flexible allocation;
2. remove non-semantic fixed space;
3. move secondary metadata;
4. stack protected pairs/groups;
5. introduce a second region only on wide surfaces where useful;
6. never solve with font shrink, semantic deletion or target shrink.

## 10. Advertising layout rule

Mature Home may contain a reserved anchored bottom banner.

It must not:
- sit directly against Add Flight / View Logbook / Search;
- split Recent row identity from its metrics;
- split Activity/period from values;
- split Total label/value/qualifier.

First Populated Home remains ad-free.

No-fill/ad-unavailable state must preserve product hierarchy.

## 11. Home-first design sequence

### Step 1 — Semantic wireframe
No color, no cards, no icons beyond navigation necessities.

Place only:
- header/context;
- Add Flight / View Logbook;
- Search;
- Recent;
- Activity;
- Totals;
- Settings access;
- optional reserved ad region.

### Step 2 — Grouping audit
Check:
- proximity;
- false grouping;
- unnecessary region boundaries;
- visual reading order.

### Step 3 — Density audit
Check:
- information density;
- visual density;
- interaction density;
- navigation/temporal cost.

### Step 4 — Grid/alignment audit
Check:
- shared edges;
- repeated scan lanes;
- value alignment;
- intentional asymmetry.

### Step 5 — Reflow matrix
Test:
- compact phone;
- large text / 200%;
- wide phone/tablet;
- long labels;
- ad/no-ad.

### Step 6 — Transfer specimen
Apply Home grammar to:
- Welcome reduction;
- Add Flight field section;
- View Logbook controls/totals.

### Step 7 — owner review
Only then present Home Direction candidate.

## 12. Immediate recommendation

Do not generate another polished Home mock yet.

First produce 2–3 grayscale semantic layout alternatives that differ only in:
- hierarchy/order;
- grouping;
- alignment;
- density.

Keep typography/color/button styling constant and provisional.

The comparison should answer:
- which layout best supports the actual LogMate tasks?
not:
- which looks more polished?

