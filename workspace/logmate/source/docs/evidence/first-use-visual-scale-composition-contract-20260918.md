# First-Use Visual Scale & Composition Contract

Status: **DESIGN RESEARCH — NOT PRODUCTION APPROVAL**  
Date: 2026-09-18  
Scope: Welcome / Previous Total / Empty Home / Add First Flight continuity  
Production Flutter: unchanged

## 1. Why this contract exists

The first Previous Total state board established semantic and interaction states, but visual approval must not be based on a pristine mock or on arbitrary small text used to create density. This contract converts current LogMate production tokens plus Design Studio Type/Color/Layout/Interaction/Content/Web evidence into a provisional visual scale that can be pressure-tested before implementation.

The values below are **candidate design constraints**, not a new production theme and not specialist PASS evidence.

## 2. Canonical evidence reconciliation

Current `logmate/main` theme uses a deliberately narrow text ladder:
- display 34;
- primary page/title roles 20;
- secondary title 17;
- title/body/label/hint roles 15.

Current spacing tokens are 4 / 8 / 12 / 20 / 28 / 36.

Design Studio latest evidence keeps custom LogMate Type gated and explicitly rejects shrinking type/tracking to solve density. Layout/Interaction requires 200% reflow, focus/target geometry and recovery surfaces to remain observable. Color requires selected/focus/error/disabled/read-only/recovery meanings to remain orthogonal. Content requires semantic truth before compactness. Web requires actual runtime evidence before browser/accessibility claims.

Therefore first-use design should begin from the mature 20/17/15 production-compatible ladder rather than inventing 10–13 px helper classes.

## 3. Provisional first-use type ladder

| Role | Candidate size | Weight direction | Notes |
| --- | ---: | --- | --- |
| Product identity / exceptional welcome display | 34 | strong | Welcome only if composition needs it; not repeated on operational forms |
| Page task title | 20 | bold | `Previous total`, `Add flight`; stable primary task label |
| Section / primary choice label | 17 | semibold | `Starting point`, high-salience choice label where needed |
| Body explanation | 15 | regular | Product-specific consequence/instruction; do not reduce for visual quietness |
| Field semantic label | 15 | medium/semibold | Full names; no compact ledger header substitution |
| Numeric editable value | 17 candidate | medium/semibold, tabular numerals if supported | Gives cumulative values operational salience without turning form into dashboard |
| Button/action label | 15 | semibold | Continue, Add previous total, Sign in |
| Helper/error/status | 15 | regular/medium | No 10–13 px helper tier merely to save space |

### Type rules

1. `15` is the current candidate floor for user-facing first-use copy, not a universal accessibility minimum.
2. Do not freeze exact line height until the resolved mature fallback is rendered; target roughly 1.3–1.5× for prose and enough metric clearance for labels/values.
3. Do not use negative tracking to fit labels.
4. Do not abbreviate `Instrument Flight Time` to solve form geometry.
5. Use tabular numeral features for cumulative values if the resolved production font supports them cleanly; do not switch the whole form to monospace.
6. `99,999+59`, `0+00`, `12+30`, dates and `I/l/1/0` remain proof strings.

## 4. Horizontal composition

### Compact/narrow first-use surface

Candidate page inset: **24** using the existing LogMate production rhythm.

Candidate readable work-column policy:
- full available width at compact phone widths minus 24/24 insets;
- cap the primary form column rather than allowing it to become arbitrarily wide on tablets/desktop;
- exact max width remains runtime-tested, with the existing Add Flight `maxWidth: 640` treated as useful implementation evidence rather than an automatic first-use rule.

### Wide surfaces

Do **not** convert to two columns merely because width is tablet-like.

Two-column composition is permitted only when:
- the two regions need simultaneous comparison/reference;
- each region retains safe text measure and target geometry;
- 200% text does not create fragmented reading order;
- semantic/focus order remains obvious.

Initial Previous Total is therefore **single-column by default even on wide surfaces**. Boundary Review is a stronger candidate for a two-region comparison because current baseline and new-boundary entry are genuinely related; it still collapses to one column when relationship geometry fails.

## 5. Vertical rhythm

Use the existing 4/8/12/20/28/36 family rather than inventing a second onboarding spacing system.

Working rhythm:
- page top to task title: platform/safe-area dependent;
- title → explanatory copy: 8;
- explanatory block → first major decision section: 28;
- section label → first choice: 12;
- choice title → consequence: 4;
- choice → choice: 12–20 depending on target architecture;
- decision block → revealed value region: 28;
- field label/value internal relation: 4–8;
- field row → field row: 20 candidate, allowed to expand with helper/error;
- final field → secondary Add action: 20;
- form → primary Continue: 28;
- bottom safe-area breathing room: at least existing production large rhythm; exact IME/inset behavior runtime-owned.

Whitespace must express hierarchy, not simulate luxury. Repeated 36+ gaps between every object are rejected.

## 6. Starting-point selection architecture

KEEP semantic architecture: explicit undecided → Zero or Carry.

Visual direction:
- no filled selectable cards;
- no nested editor inside choice container;
- one persistent selection mark plus full 17/15 label/consequence structure;
- entire logical choice target is operable;
- selected state must remain distinguishable without accent hue;
- focus and selected are separate visible states.

Candidate target row must not be forced into a fixed 44/48 height when consequence copy wraps. Minimum target geometry is a floor, not a row-height mandate.

## 7. Previous Total value-row anatomy

### Adequate relationship width

`15 label` and `17 numeric value` may share one horizontal relationship when all proof strings fit without compression:

```
Instrument Flight Time                     1,125+30
                                           ────────
```

The numeric editor owns enough width for `99,999+59` plus caret/focus treatment.

### Relationship failure / enlarged text

Recompose before collision:

```
Instrument Flight Time

1,125+30
────────
```

Rules:
- no ellipsis for required semantic label;
- no font-size reduction;
- no fixed row height;
- helper/error follows the editor;
- later rows move down naturally;
- Remove/action affordance moves to a non-colliding line or menu if present.

The breakpoint is content/relationship failure, not a named device class.

## 8. Input surface authorship

The current global production theme uses rounded filled Material fields. Previous Total should not automatically inherit that visual grammar merely because it uses a Flutter text input underneath.

Candidate authored grammar:
- quiet surface with a rule/baseline or minimal boundary;
- persistent external semantic label;
- right-aligned numeric value at adequate width;
- focus signaled structurally plus luminance/hue as support;
- error gets text + structural state, not red alone;
- raw edit value remains visibly editable without becoming a dashboard number tile.

Do not remove native semantics, caret, selection or keyboard behavior in pursuit of authorship.

## 9. Primary action placement

KEEP document-order `Continue` after the form as the default architecture.

Reject permanently overlaying bottom CTA for initial approval because:
- local errors can expand;
- 200% text increases form height;
- IME/short-height surfaces create obscuration risk;
- the task is data integrity, not conversion optimization.

A sticky/local action can be revisited only with measured focused-field/error visibility and scroll-offset evidence.

## 10. Color and emphasis budget

Brand accent must have a specific job. Candidate uses:
- primary action;
- active/focus support;
- selected mark support.

Do not use the same accent fill to simultaneously mean selected, focused, valid and actionable.

Hierarchy should survive grayscale through:
- weight;
- position;
- rule/boundary ownership;
- selection mark;
- explicit error/status text;
- editable vs read-only structure.

Night and forced-color transfer remain runtime validation, not design claims.

## 11. Welcome continuity

Welcome should use the same 20/17/15 system, with 34 reserved for product identity only if it improves authored identity without fake operational data.

Do not make Welcome visually impressive by adding:
- mock flights/totals;
- aviation HUD/cockpit graphics;
- feature cards;
- multiple tiny captions;
- oversized marketing headline that makes the next operational screen feel like another product.

The transition `Welcome → Previous Total` should feel like the same application becoming more operational, not marketing site → form app.

## 12. Empty Home / Add First Flight continuity

First-use visual grammar should transfer, not clone.

- Empty Home: 20/17/15 hierarchy, low visual density because data is genuinely absent, real Add Flight / Import actions only.
- Add First Flight: operational density may increase, but semantic labels must not drop below the first-use floor simply to fit more fields.
- First populated Home: real data, not onboarding decoration, creates density.

The current Add Flight implementation contains 13 px field-label overrides; this contract flags those for future cross-surface review rather than silently copying them into Previous Total. Production code is not changed here.

## 13. 200% / short-height pressure matrix

A visual candidate must be rendered at minimum against:

| Scenario | Required evidence |
| --- | --- |
| Default compact | complete hierarchy, no generic card leakage |
| `99,999+59` | no label/value collision or type compression |
| `Instrument Flight Time` | full semantic label |
| 200% text/zoom | vertical recomposition, no clipping |
| IME + short viewport | focused field/error visible; Continue reachable after scroll |
| Local error | row expands; no overlay/snackbar-only dependency |
| Added optional semantic | Remove/add controls do not steal value width |
| Boundary Review | read-only current baseline and editable new boundary visibly distinct without tint-only semantics |
| Night | hierarchy retained |
| Forced colors | selection/focus/error meaning structurally retained |

Browser/device/AT/human PASS requires later executable evidence.

## 14. KEEP / REWORK / REJECT after integrated audit

### KEEP
- overall first-use IA;
- explicit Zero vs Carry decision;
- single H+MM editor grammar;
- full semantic labels;
- single-column default Previous Total;
- document-order Continue;
- 24-ish production page inset family;
- 20/17/15 production-compatible text ladder as current baseline.

### REWORK
- exact selection mark and focus treatment;
- exact input rule/boundary style;
- exact max content width;
- tablet Boundary Review comparison composition;
- read-state thousands grouping;
- optional semantic chooser surface.

### REJECT
- 10–13 px helper/field-label tier for first-use;
- fixed-height rows that cannot grow with text/error;
- radio-card + nested form pattern;
- repeated rounded Material cards/filled fields as the authored visual language;
- device-name breakpoints as the reason for two-column layout;
- sticky CTA without obscuration evidence;
- truncating professional semantic labels;
- fake operational data to make Welcome feel technical.

## 15. Open product/engineering contracts

Unchanged and still OPEN:
- partial baseline policy;
- exact duration validation/minute range;
- final total-eligible semantic set;
- count/custom total grammar;
- persistence transaction/pending/failure;
- baseline reconciliation storage/linkage;
- signed-out local ownership/recovery.

## 16. Next design cycle

Rebuild the Previous Total visual state board using this contract, not the earlier small-type mock. The board must show at least default, focus/raw, normalized large total, local error, added semantic, 200% stacked reflow, IME-short-height and Boundary Review. Critique the result for generic Material leakage, visual hierarchy, state orthogonality and cross-screen continuity before extending the visual system to Welcome and Empty Home.