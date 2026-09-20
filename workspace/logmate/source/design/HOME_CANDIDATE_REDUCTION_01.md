# LogMate Home Candidate Reduction 01

Status: NON-CANONICAL — COORDINATOR SYNTHESIS
Date: 2026-09-19
Baseline: NONE SELECTED
Affected lineage: HOME-A/B/C v0.1

## Recommendation

Carry only **HOME-A v0.1** and **HOME-B v0.1** into the decision-grade visual specimen round.

Keep **HOME-A v0.1** as coordinator recommendation.

Withdraw **HOME-C v0.1** from the active owner-choice set. This is candidate pruning, not a product/UI lock and not an owner rejection.

## Why C is pruned before rendering

The current Home layout synthesis defines Home as a medium-density operational hub and gives the whole-product question order priority to immediate work before passive context. It also requires Empty Home and populated Home to share the same shell and warns against visual structures that exist only because data is present.

HOME-C places Recent before the work band. That creates two already-documented structural costs:

1. **Empty-state discontinuity** — when no accepted record exists, the first major region disappears and the screen's leading hierarchy changes.
2. **Add Flight handoff inversion** — Home begins with passive resume/verification, then the next screen becomes task-dominant after Add Flight is chosen. This is a larger hierarchy jump than A or B.

C's principal advantage is stronger resume prominence. Current product authority and Home synthesis do not establish resume/verification as a stronger Home job than direct operational action. Keeping C would therefore spend owner attention and rendering effort on an alternative whose benefit depends on an unsupported priority change.

No-reset governance favors pruning a weaker alternative over inventing a replacement candidate.

## Active decision candidates

### HOME-A v0.1 — Action → Recent → Retrieval

Order:
Header → Work band → Recent → Search → Activity → Totals

Strengths:
- strongest Empty → first-populated → mature structural continuity;
- direct operational action remains the first user job;
- Recent confirms/resumes work before retrieval;
- Add Flight handoff requires the least hierarchy change.

Known cost:
- Search is one region later than B for retrieval-heavy returning users.

Impact classification: **SUPPORTS CURRENT DIRECTION**.

### HOME-B v0.1 — Action → Retrieval → Recent

Order:
Header → Work band → Search → Recent → Activity → Totals

Strengths:
- direct operational action remains first;
- retrieval is faster and more visible for users frequently searching crew/route/flight history;
- Empty Home remains structurally stable because Work band and Search survive without records.

Known cost:
- Search gains upper-screen interaction authority and keyboard/focus pressure;
- focused Search can make Home behave more like a retrieval screen if geometry is not tightly controlled.

Impact classification: **SUPPORTS CURRENT DIRECTION / valid alternative**.

## HOME-C v0.1 status

State: **WITHDRAWN FROM ACTIVE CANDIDATE ROUND — REFERENCE ONLY**.

This does not prohibit future reconsideration. Re-entry requires one of:
- owner preference for resume-first Home;
- product/task evidence showing Recent verification outranks direct action/retrieval;
- transfer evidence showing A/B fail while C succeeds.

New styling research alone is not sufficient.

## Visual specimen consequence

The next visual decision package should render only A and B, under `HOME_VISUAL_SPECIMEN_CONTRACT_01.md` shared grammar.

Both must use identical:
- representative data;
- typography roles;
- luminance/color roles;
- action treatment;
- row grammar;
- Search component;
- spacing/datum system;
- Add Flight transfer strip;
- View Logbook transfer strip.

The owner decision should therefore be about **Recent-before-Search vs Search-before-Recent**, not about unrelated styling.

Required pressure states remain:
- Empty Home;
- first-populated ad-free Home;
- mature Home with reserved ad geometry;
- 200% text/reflow;
- primary action focus;
- Search focus + keyboard pressure;
- Add Flight transfer;
- View Logbook transfer.

## New cross-repo delta reviewed

### Product authority
`logmate@main` remains `b551ce43`: no product-authority change.

### Design Studio
Latest observed status advanced to T057 / C088 / L079-I075 / W088 / CD094. The delta is centered on state/recovery/Undo continuity rather than normal Home hierarchy. Impact on HOME-A/B normal composition: **NO IMPACT**. Apply later to recovery-state specimens; do not add recovery chrome to normal Home.

### Software Engineering Studio
Latest observed D005 short-write progress boundary does not establish new Home product semantics or visual state. Impact: **NO IMPACT**.

### Web Manager
Latest observed checkpoint crypto-agility governance strengthens evidence/provenance discipline but does not change normal Home composition. Impact: **NO IMPACT**; later recovery/trust surfaces must remain evidence-gated.

### Marketing Manager
Latest observed research through 105 does not change the protected first-value/ad policy or establish resume-first Home priority. Impact: **NO IMPACT**.

## Governance

- No owner-selected visual baseline exists.
- No Portfolio Approval, Direction Lock, Visual Lock or Implementation Lock is created here.
- HOME-A remains a coordinator recommendation only.
- HOME-B remains a complete decision alternative.
- HOME-C remains historical candidate evidence, not a rejected product direction.
