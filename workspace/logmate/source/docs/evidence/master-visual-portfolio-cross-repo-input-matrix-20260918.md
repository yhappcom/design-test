# LogMate Master Visual Portfolio — Cross-Repository Input Matrix

Status: **PORTFOLIO PREPARATION / CROSS-REPO RECONCILIATION**
Date: 2026-09-18
Scope: Design Studio + LogMate product/code + Software Engineering Studio + Web Manager + Marketing Manager

## 1. Purpose

The Master Visual Portfolio must be visually authored by Design Studio, but it must not ignore product/engineering/runtime/marketing evidence that changes:
- truthful state representation;
- first-value path;
- offline/PWA behavior;
- owner/auth boundaries;
- trust messaging;
- onboarding interruption policy;
- Store/product continuity;
- recovery/degraded-state requirements.

This file defines what each repository may contribute to the portfolio and what it must **not** decide.

---

## 2. Authority boundary

### Design Studio
Owns:
- visual hierarchy;
- typography;
- color;
- layout;
- interaction presentation;
- responsive/reflow behavior;
- content/UX-writing formulation;
- design critique and authored visual language.

Does not own:
- persistence truth;
- Sync semantics;
- platform capability facts;
- release/install guarantees;
- activation/business claims.

### LogMate product/code
Owns:
- product semantics;
- domain entities;
- current interaction contracts;
- actual implementation evidence;
- product-specific technical state.

### Software Engineering Studio
Contributes:
- state ownership;
- persistence/sync/recovery correctness models;
- validation/evidence boundaries;
- native/PWA capability distinctions;
- implementation-risk diagnostics.

Does not dictate visual style.

### Web Manager
Contributes:
- browser/PWA/iPad runtime reality;
- service worker/update/storage/offline constraints;
- install/platform distinctions;
- degraded/recovery states;
- web-specific validation requirements.

Does not define native/product domain semantics.

### Marketing Manager
Contributes:
- first-value definition;
- Store promise → onboarding → activation continuity;
- trust-surface parity;
- specialist proof hierarchy;
- protected user-intent/advertising boundaries.

Does not dictate UI composition or visual styling.

---

## 3. Software Engineering Studio — portfolio-relevant transfers

### A. State ownership must be visible truthfully

Relevant canonical research:
- A002 state ownership;
- D004 cache/offline ownership;
- D005 recovery;
- D006 sync/idempotency/conflict;
- Q006 recovery oracle;
- M006 native/PWA boundaries.

Key transfer:
`local save != sync pending != remote acknowledged != reconciled != backup`

Portfolio implication:
- never use one generic “Saved” visual state to imply all layers;
- future Home/Settings/Sync surfaces need separable local/sync/recovery states;
- first-use portfolio should not imply cloud dependence when local-first is the product direction.

### B. Pending local work must not look disposable

D004 demonstrates the failure of treating pending local user intent as replaceable cache.

Portfolio implication:
- user-entered Flight work should visually belong to durable/product state, not transient web/cache state;
- refresh/update/reconnect UX must not imply remote data may simply replace local intent.

### C. Recovery status needs semantic oracles, not generic success/error

Q006:
- an operation can return after retry and still be semantically wrong;
- success is terminal-state correctness, not merely absence of an exception.

Portfolio implication:
- recovery UI should avoid generic “Recovered”/“Synced” states unless the underlying product contract can prove them;
- ambiguous/review-required states need room in the visual system.

### D. Native and PWA are semantically equivalent targets only where proven

M006:
- similar UI does not mean equal lifecycle/storage/background/install behavior;
- Home Screen installable != offline capable;
- offline capable != durable/recoverable;
- background event capability != continuous background sync.

Portfolio implication:
- native and EFB/PWA may share the same visual language;
- platform-specific degraded/update/install/recovery surfaces may differ;
- the portfolio must not visually promise native-style background behavior on PWA.

### Evidence caveat

Software Engineering Studio remains Foundation-level and explicitly separates model/fixture evidence from direct Flutter/mobile product PASS.

Use the mechanisms and failure boundaries, not its PASS vocabulary as product validation.

---

## 4. Web Manager — portfolio-relevant transfers

### A. PWA is not one binary capability

Relevant:
- 073 PWA foundations;
- 074 durability/sync;
- 084 iOS/iPadOS change watch;
- 088 offline navigation/update/recovery;
- 093 session revocation/offline authorization;
- 130 graceful degradation;
- 131 split-brain reconciliation.

Portfolio implication:
Do not create one badge/state such as:
`PWA ready` or `Offline ready`.

User-visible states may eventually need to distinguish:
- locally available;
- possibly stale;
- queued;
- syncing;
- synced/acknowledged;
- conflict/review;
- failed;
- update available;
- update required;
- storage/recovery risk.

Only implemented states should be rendered as product UI; the portfolio should reserve a coherent grammar for them.

### B. Update UX is a data-integrity workflow

073:
A new Service Worker can wait while the current client is active; forced activation can mix app versions.

Portfolio implication:
- avoid treating an update as a generic promotional modal;
- update/reload states belong to the same calm operational/recovery language as the rest of LogMate;
- if unsynced/local work exists, update UI must prioritize work preservation over “latest version” urgency.

### C. Browser storage is not backup

073/074:
- IndexedDB/origin storage can support structured local state;
- persistence request/grant is not a backup;
- storage can be cleared/evicted.

Portfolio implication:
- Settings/backup/offline trust UI must not equate “stored on this device” with “backed up”;
- Store/Welcome copy must not imply permanent durability without the verified backup model.

### D. iPad Home Screen/PWA install is platform-specific

073/M006:
- current iOS/iPadOS Home Screen web-app behavior differs from Chromium/Android;
- managed EFB policy is still a real acceptance dependency.

Portfolio implication:
- do not put a generic universal `Install app` onboarding step into core LogMate UI;
- installation/help belongs to platform-specific entry/support context, not the fundamental ledger onboarding architecture.

### E. Graceful degradation matters more than binary online/offline

130/131 direction:
- application available != every capability available;
- online != sync authorized;
- network restored != convergence;
- queue empty != reconciled.

Portfolio implication:
- future Home status cannot collapse all health into one green cloud icon;
- degraded states should preserve core local task availability where product truth allows it;
- state copy and hierarchy must be calm and specific, not alarmist.

---

## 5. Marketing Manager — portfolio-relevant transfers

### A. First value is a durable user job, not a screen visit

Research 031:
For LogMate, the candidate first-value boundary is:
- at least one valid personal FlightRecord durably committed to the canonical local ledger;
- normal-path retrieval/view may be required for stronger proof.

Not first value:
- opening the app;
- authentication;
- visiting Home;
- Customize;
- mock totals;
- merely starting Import.

Current engineering update:
`feature/data001-domain` now has substantial canonical persistence/application foundations, but actual Add Flight Save UI and normal View binding are still not fully product-wired.

Portfolio implication:
- Welcome and onboarding should get out of the way of the first real Flight;
- Previous Total may be required, but should not become a feature-tour/configuration maze;
- auth/sync should not be visually presented as the value itself.

### B. Store promise must match first-session reality

Research 051:
`Store promise → prerequisite → first action → first value → return reason`

Known hazard:
A Store page can show a populated mature dashboard while a fresh user encounters a long empty/configuration workflow.

Portfolio implication:
The Master Visual Portfolio should deliberately show both:
1. first-use/empty path;
2. mature populated operational state.

This allows later Store creative to be truthful about the path between them.

### C. Specialist proof should come from real UI, not generic marketing art

Research 043:
Store Proof Stack:
- recognition;
- outcome;
- specialist competence;
- workflow;
- trust/control;
- breadth;
- return value.

Portfolio implication:
- LogMate identity should remain strong when actual UI is shown;
- avoid an onboarding visual language that only works as a brand poster;
- operational Home/View Logbook must be visually credible enough to become Store proof later.

Marketing does **not** prescribe the visual layout; it supplies the uncertainty each future proof asset must resolve.

### D. First launch/onboarding is protected intent

Research 087:
App Open/interstitial advertising should not hijack:
- first launch;
- onboarding;
- consent;
- migration;
- import continuation;
- save/restore/recovery.

Portfolio implication:
- no ad slot should be designed into Welcome/Previous Total/onboarding;
- no visual space should be reserved for monetization on these critical first-value surfaces;
- later Home monetization must not interrupt protected actions.

This aligns with the owner's existing dislike of intrusive ads.

### E. Trust claims must match shipped behavior

Research 092:
Privacy, accessibility, support, backup/offline/sync and data-safety claims are product claims.

Portfolio implication:
- visual copy such as `Private`, `Secure`, `Works offline`, `Synced`, `Backed up` must be evidence-gated;
- native/PWA differences may require different support/help language;
- portfolio should favor demonstrable behavior over trust-superlative slogans.

### F. Intent continuity may later bypass generic Home, but not required setup

Research 100:
External intent may route to an exact safe product destination only when prerequisites are satisfied.

Portfolio implication:
- onboarding architecture should be able to preserve an incoming job after required first-use/setup;
- Welcome/Previous Total must not permanently destroy external intent context;
- deep linking is not a launch prerequisite and should not complicate the base portfolio now.

---

## 6. What this changes in the Master Visual Portfolio

The portfolio should no longer be only a visual sequence.

It must demonstrate five cross-functional properties.

### P1 — Identity
Can LogMate be recognized without fake data, aviation cosplay, or generic Material identity?

### P2 — First-value continuity
Can a new pilot move:
`Welcome → required baseline decision → first Flight → real record`
without unnecessary configuration or auth friction?

### P3 — State truth
Does the system have a coherent visual grammar for:
- local;
- pending;
- unresolved;
- review;
- error/recovery;
without using unsupported cloud/offline claims?

### P4 — Native/PWA continuity
Does the visual system survive phone native and EFB PWA while permitting platform-specific install/update/degraded states?

### P5 — Mature-state proof
Can populated Home and View Logbook act as credible specialist-product proof while clearly belonging to the same product as first-use?

---

## 7. Portfolio frames now required

Core portfolio should include:

1. Welcome — first launch, no data, no ads.
2. Previous Total — explicit zero/carry decision.
3. Previous Total — real entry state.
4. Empty Home — first-value actions.
5. Add First Flight — path to actual value.
6. Populated Home — first real record reflected.
7. View Logbook — dense professional state.
8. Settings / trust-control excerpt — local/backup/sync wording only where current truth supports it.
9. EFB/PWA wide adaptation — same visual identity, no unsupported background/install claims.
10. One degraded/recovery specimen — not necessarily a production screen, but enough to prove the visual language handles unresolved state without collapsing into generic error UI.

Secondary/appendix:
- Sign in / owner-locked recovery;
- import-first branch;
- update/reload-safe state;
- 200%/large text;
- night/forced-color evidence when ready.

---

## 8. What these other teams must NOT force into the portfolio

Do not let Engineering/Web/Marketing force:
- cloud/status badges everywhere;
- verbose technical state labels on every screen;
- Store-style headline copy inside the product;
- PWA install prompts in core onboarding;
- backup/sync claims before verification;
- deep-link architecture into first-use IA prematurely;
- telemetry or ad placement into first-value screens;
- visual design based on internal system terminology.

Their role is to protect truth, continuity, resilience and product readiness.

Design Studio still authors the UI.

---

## 9. Current cross-repo contradictions / freshness notes

### Marketing 031 freshness
Marketing's LogMate first-value research was based on a substantially earlier product state where canonical persistence was not implemented.

Current `feature/data001-domain` has since added major persistence/domain/application foundations.

Therefore:
- its **semantic conclusion** remains useful;
- its implementation-readiness statement is stale and must be re-audited before launch metrics are frozen.

### Software Engineering product-transfer freshness
Some Studio transfer notes also cite old `main b551ce4`.

Use their general engineering mechanism evidence, but reconcile product-specific claims against the current LogMate feature branch before portfolio decisions.

### Web Manager freshness
Web Manager PWA evidence is current/generic and highly relevant, but managed-EFB production acceptance remains OPEN.

---

## 10. Recommended portfolio input stack

Before drawing:

1. LogMate current product contracts;
2. LogMate `feature/data001-domain` current engineering reality;
3. Design Studio latest specialist constraints;
4. this cross-repo matrix;
5. reconciled KEEP/REWORK/REJECT visual evidence;
6. current first-use state/composition contracts.

This is sufficient to build the Master Visual Portfolio without another broad research phase.

Further research should now be triggered by a concrete portfolio conflict, screen-lock blocker, platform change or implementation contradiction.
