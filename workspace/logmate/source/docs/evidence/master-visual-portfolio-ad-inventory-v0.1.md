# LogMate Master Visual Portfolio — Ad Inventory & Placement Policy v0.1

Status: **PORTFOLIO MONETIZATION INPUT — DESIGN/PRODUCT DISCUSSION**
Date: 2026-09-18
Branch: `design/first-use-baseline-20260918`
Production implementation: NOT AUTHORIZED

## 1. Objective

Define advertising as part of the LogMate layout system before screen Visual Lock so later ad SDK integration does not force structural redesign.

The objective is not maximum inventory.

Company/product objective:
> preserve specialist task continuity and first value, then monetize only legitimately passive or unavoidable waiting boundaries.

Marketing research principles:
- Monetize waiting, not intent.
- Reward surplus, never ransom normal utility.
- Reserve banner geometry; never make normal interaction pay for it.
- Measure money at the impression; judge monetization at retained utility.

## 2. Global ad rules

### LOCK CANDIDATE — no ads in protected first-value/task-critical states

No advertising in:
- Welcome;
- Previous Total;
- Empty Home before first value;
- Add First Flight;
- first successful Flight save transition;
- Import setup/preview/reconciliation/commit;
- restore/recovery;
- migration;
- owner lock / sign-in recovery;
- error recovery;
- any active text-entry state;
- any operation where user intent has already begun and an ad would delay completion.

### Rewarded ads

Current inventory: **ZERO**.

Do not gate:
- logbook entry;
- search;
- totals;
- View Logbook;
- backup/restore;
- import;
- sync/reconciliation;
- data integrity/recovery;
- configuration required for normal use.

A rewarded format may be reconsidered only if a future genuine additive, non-essential benefit exists independently of advertising.

### Collapsible banner

Default: **REJECT / HOLD**.

Reason:
- temporary overlay semantics;
- high risk around specialist controls;
- unnecessary before stable passive banner evidence exists.

### Interstitial / popup

Default: **HOLD / NOT PART OF V0.1 INVENTORY**.

No interstitial may appear:
- after a user taps Add/Edit/Search/View/Import/Save;
- before requested content appears;
- on first launch/onboarding;
- during protected continuation.

The historical concept of a popup around period queries must not be treated as current direction without a new explicit product decision and task-continuity evidence.

### App Open

Default: **HOLD, NOT ENABLED BY DESIGN**.

May become eligible only when:
- user has completed first value and several prior uses;
- a genuine unavoidable loading/wait boundary exists;
- product content is not already actionable;
- no pending deep link/import/file-picker/save/recovery intent exists;
- ad loading does not extend the wait.

If normal LogMate launch is fast, legitimate App Open inventory may be zero.

## 3. Screen-by-screen inventory

| Surface | Ad status v0.1 | Candidate format | Rationale |
| --- | --- | --- | --- |
| Welcome | NO ADS — Direction Lock candidate | none | product identity + first intent |
| Previous Total | NO ADS — Direction Lock candidate | none | required ledger truth entry |
| Empty Home before first Flight | NO ADS — Direction Lock candidate | none | first-value path |
| Add Flight | NO ADS — Direction Lock candidate | none | high-interaction data entry |
| First save / first populated transition | NO ADS | none | first-value completion must remain uninterrupted |
| Import / Review / Reconcile | NO ADS | none | data-integrity workflow |
| Restore / Recovery / Migration | NO ADS | none | recovery/protected intent |
| Sign in / owner unlock | NO ADS | none | access/recovery state |
| View Logbook | NO ADS by default | none | dense ledger, scrolling, frequent reading/navigation, accidental-click risk |
| View Logbook Customize | NO ADS | none | frequent switches/reorder/actions |
| Search input/results | NO ADS initially | none | active query/result selection; interaction-heavy |
| Settings | generally NO ADS | none | trust/control surface |
| Backup / Sync / Offline status | NO ADS | none | trust/control/recovery semantics |
| Mature Home | CANDIDATE | anchored adaptive bottom banner | passive region can be structurally reserved if separated from actions |
| Activity / Totals read-only detail | CANDIDATE AFTER GEOMETRY VALIDATION | anchored bottom or carefully justified inline adaptive | lower-interaction viewing state may support inventory |
| Recent flight list | HOLD | possibly inline adaptive only if long scrolling list and interaction separation proven | row taps create adjacency risk |
| Help / informational long-form content | CANDIDATE | inline adaptive | only if not recovery/support-critical and scroll context supports it |
| EFB PWA | SEPARATE DECISION | web-specific ad stack only | native mobile ad SDK assumptions do not transfer to PWA |

## 4. Primary launch monetization candidate

### Mature Home — anchored adaptive bottom banner

This is the strongest v0.1 candidate, but only for a **returning user after first value**.

Required composition:

```
[ Home content / actions / summaries ]

[ breathing / separation region ]

────────────────────────
[ reserved ad region    ]
[ anchored adaptive     ]
────────────────────────
[ safe area             ]
```

Rules:
- ad region height is reserved before ad response;
- no post-load layout jump;
- no Add Flight / View Logbook / Search / Settings control immediately adjacent;
- no banner underneath keyboard or modal sheet;
- no ad refresh may move a product target;
- no-fill state preserves predictable geometry or uses an explicitly designed collapse strategy that cannot later move a target under the user's finger;
- ad has a distinct visual boundary and cannot imitate LogMate content.

Exact dp separation is not frozen; actual device geometry must be validated.

## 5. Home layout implication for the Master Visual Portfolio

The Home portfolio must show two legitimate composition variants:

### H0 — no-ad / ineligible state
Used for:
- first-use;
- first-value session;
- protected intent;
- ad unavailable/no-fill according to final layout policy;
- platforms where the chosen ad stack is unavailable.

### H1 — mature eligible ad state
Used only when:
- returning user;
- no active protected intent;
- Home is in a passive/normal viewing state;
- reserved geometry is already part of layout.

The two states must share the same core content hierarchy. Ad eligibility must not produce a materially different Home architecture.

## 6. First Populated Home

First Populated Home remains **ad-free**.

Reason:
- this is the user's first visible proof that LogMate has captured personal value;
- inserting monetization at that exact state would conflate first value with ad inventory;
- Marketing's first-value contract treats activation as durable user-recognizable core-job completion.

A mature Home session may become ad-eligible later.

## 7. View Logbook

Current decision direction: **no banner in the ledger surface**.

Reasons:
- horizontally dense professional content;
- page/year/customize controls;
- frequent scrolling/panning;
- row interaction may be added later;
- landscape phone geometry is scarce;
- banner proximity increases accidental-click and reading-space risk;
- View Logbook is a signature specialist proof surface and should remain visually clean.

This may be revisited only with actual geometry/revenue evidence, not because inventory is desired.

## 8. Activity / Totals

These are the best secondary banner candidates after Home.

Eligibility conditions:
- read-only viewing state;
- no keyboard;
- no active picker/filter overlay;
- no primary action adjacent to the ad;
- reserved layout;
- no interaction shift on load/refresh;
- long enough dwell/usefulness to justify inventory.

If the detail screen is primarily a configuration/action screen rather than passive analysis, it is ineligible.

## 9. Search / Recent

### Search
Initial status: NO ADS.

Reason:
- query typing;
- keyboard;
- result taps;
- possible filters;
- high target density.

### Recent
HOLD.

An inline adaptive banner could be explored only if:
- the final product has a genuinely long scroll list;
- it appears between stable content groups rather than between tightly packed interactive rows;
- row selection/task completion remains unaffected.

Do not design Recent around an assumed inline ad before real data/list behavior exists.

## 10. Settings / trust surfaces

No advertising in:
- privacy;
- backup;
- sync;
- account;
- restore;
- export;
- offline/storage status;
- support/recovery paths.

Reason:
these surfaces exist to reduce professional/data risk. Advertising would visually weaken the trust/control boundary and may complicate support/recovery intent.

## 11. Native vs EFB/PWA

Do not reserve the same ad slot merely for visual parity.

Native:
- AdMob/other mobile SDK may support anchored adaptive banner.

PWA:
- requires a web-specific ad product, policy, CSP/privacy/runtime review and managed-EFB acceptance;
- native App Open/rewarded/banner implementation does not transfer automatically.

Therefore:
- the **content composition** should tolerate an optional reserved monetization region;
- actual PWA ad support remains a separate Web/Product decision.

The EFB may legitimately remain ad-free even if native Home carries a banner.

## 12. Portfolio visual language for ad regions

Ads are not LogMate components.

LogMate should provide:
- reserved neutral region;
- adequate separation;
- stable geometry;
- safe-area ownership;
- no decorative container that makes ad creative look like first-party content.

Do not:
- recolor ad surroundings to mimic the ad;
- wrap ad in a LogMate data card;
- place LogMate section labels such as `Recommended`;
- use product icons/arrows to point at the ad;
- optimize layout for accidental tap proximity.

## 13. Measurement gate

A placement does not graduate because it earns revenue.

Minimum later evidence:
- placement ID;
- screen/context;
- eligibility state;
- request/match/impression;
- impression-level paid value, currency and precision;
- task completion;
- rapid exit;
- useful return;
- accidental-click / Confirmed Click signals;
- support complaints;
- device/orientation geometry.

Primary company metric direction:
`cumulative ad revenue / retained useful user`

CTR is not a success metric for passive utility-app placements.

## 14. Lock proposal

### Direction Lock now
- no ads in Welcome/onboarding/Previous Total/Empty-before-first-value/Add Flight/first-save/import/restore/recovery/sign-in owner recovery;
- no rewarded inventory in normal LogMate utility;
- no default collapsible banner;
- no default interstitial;
- View Logbook ad-free by default;
- first populated Home ad-free;
- Settings trust/control surfaces ad-free.

### Portfolio candidate, not locked
- mature returning-user Home bottom anchored adaptive banner;
- read-only Activity/Totals secondary banner;
- long-form non-critical Help inline banner.

### Hold
- App Open;
- Recent inline;
- PWA advertising;
- any interstitial;
- any rewarded format.

## 15. Design consequence

The Master Visual Portfolio must render at least:
1. Mature Home without ad.
2. Mature Home with reserved anchored banner.
3. First Populated Home without ad.
4. View Logbook ad-free.
5. one Activity/Totals read-only candidate with ad region, if that surface is developed enough.

This makes ad geometry part of portfolio approval without allowing advertising to define the app's visual language.
