> **SUPERSEDED FOR GOVERNANCE** — active design-process authority has moved to `design/README.md`, `design/DECISIONS.md`, `design/VISUAL_BASELINE.md`, and `design/ROOT_CAUSE_AUDIT_20260918.md`. This file remains historical design evidence only and does not create product/UI lock.

# LogMate UI Lock Register

Status: **ACTIVE**
Date: 2026-09-18
Portfolio reference: `docs/evidence/master-visual-portfolio-v0.2-detailed-contract.md`
Governance authority: `docs/evidence/portfolio-governance-contract-20260918.md`

## Lock authority

A portfolio image or portfolio approval does not create Visual Lock. DIRECTION LOCK and VISUAL LOCK require a dedicated screen-family review; VISUAL LOCK additionally requires explicit owner approval. IMPLEMENTATION LOCK requires matching runtime evidence.

## Lock vocabulary

- **OPEN** — materially unresolved.
- **KEEP** — current product structure remains unless product authority changes.
- **PORTFOLIO-APPROVED** — overall portfolio direction accepted; zero screen-lock authority by itself.
- **DIRECTION LOCKED** — product/design direction is fixed enough for downstream work; visual detail may still change.
- **VISUAL LOCKED** — screen-family visual grammar explicitly owner-approved after dedicated review.
- **IMPLEMENTATION LOCKED** — actual implementation/runtime evidence accepted.
- **REOPEN REQUIRED** — new evidence contradicts a locked decision; requires explicit review.

## Current register

| ID | Item | State | Reason / boundary |
| --- | --- | --- | --- |
| W-01 | Welcome contains no fake operational data | DIRECTION LOCKED | first-time user has no ledger; identity must not depend on fabricated records |
| W-02 | Welcome primary = Start a new logbook | DIRECTION LOCKED | new-user intent |
| W-03 | Welcome secondary = Sign in | DIRECTION LOCKED | existing-user path |
| W-04 | Returning/restored users normally bypass Welcome | DIRECTION LOCKED | Welcome is not a recurring marketing surface |
| W-05 | Welcome exact typography/composition | OPEN | dedicated family review + explicit owner Visual Lock approval pending |
| PT-01 | Previous Total before first manual Flight | DIRECTION LOCKED | owner/product decision |
| PT-02 | PreviousTotalBaseline != OpeningBalance | DIRECTION LOCKED | domain distinction |
| PT-03 | Explicit Start from zero vs Carry forward | DIRECTION LOCKED | baseline truth decision |
| PT-04 | Blank != zero | DIRECTION LOCKED | sparse baseline direction; forward domain evidence now explicitly preserves absence |
| PT-05 | One H+MM editor per duration semantic | DIRECTION LOCKED | duration grammar + forward aggregate metadata |
| PT-06 | Split hour/minute boxes | REJECTED | unnecessary focus/paste/geometry cost |
| PT-07 | Previous Total exact field prioritization | OPEN | eligible metadata is stronger, but first-use prioritization remains product/UX decision |
| PT-08 | Previous Total selection/input visual | OPEN | dedicated family review + explicit owner Visual Lock approval pending |
| PT-09 | Semantic metadata chooses aggregate/editor family | KEEP | forward DATA-001 defines duration/count kinds and formatters; do not let user configure value type; main adoption pending |
| PT-10 | Previous Total rows owned by stable semantic identity, not row index/label | DIRECTION LOCKED | cross-screen integrity + Design Studio focus/recovery evidence |
| PT-11 | Removing a focused optional total uses deterministic semantic focus fallback | KEEP / CANDIDATE | next semantic → previous semantic → Add total trigger; runtime/AT validation pending |
| PT-12 | UI computes Page/Previous/New totals itself | REJECTED | aggregation belongs to engine/domain; current forward page read model explicitly does not aggregate |
| PT-13 | Undo restoration does not automatically restore focus to the restored total | KEEP / CANDIDATE | Design Studio I071/L075 separates configuration restoration from focus restoration; preserve current recovery/fallback locus unless an explicit interaction reason justifies return; runtime/AT validation pending |
| EH-01 | Empty Home is true empty state | DIRECTION LOCKED | no fake dashboard |
| EH-02 | Add Flight primary, Import optional | DIRECTION LOCKED | Manual-first / Import-optional |
| EH-03 | Empty Home exact composition | OPEN | dedicated family review pending |
| AF-01 | Existing Add Flight semantic structure | KEEP | confirmed product structure |
| AF-02 | Visual transfer from first-use system | OPEN | dedicated screen-family work pending |
| FH-01 | First populated Home bridge state | OPEN | must be designed before Home lock |
| H-01 | Existing Home information families | KEEP | Add/View/Search/Recent/Activity/Totals/Settings |
| H-02 | Card-heavy current presentation | REWORK | not future identity by default |
| H-03 | Career/lifetime hero | REJECTED / HOLD | semantics unresolved |
| VL-01 | View Logbook ledger geometry/continuous page model | KEEP | strongest current product contract |
| VL-02 | Page/Previous/New semantic distinction | KEEP | product contract; production aggregation still open |
| VL-03 | Final visual tokens | OPEN | needs master portfolio transfer |
| VL-04 | Hide/reorder changes projection, not semantic total identity | DIRECTION LOCKED | product policy + semantic-keyed forward evidence |
| S-01 | Settings must distinguish local/sync/backup/recovery truth | DIRECTION LOCKED | cross-repo engineering/web evidence |
| S-02 | Settings exact structure | OPEN | implementation maturity varies |
| PWA-01 | Native/PWA same product identity | DIRECTION LOCKED | first-class targets |
| PWA-02 | Native/PWA runtime equivalence | REJECTED | platform research contradicts |
| PWA-03 | Generic install step in core onboarding | REJECTED | platform-specific capability |
| PWA-04 | Update/recovery/degraded visual grammar | OPEN | needs product/runtime state implementation |
| ADS-01 | No ads in Welcome/onboarding/first-value-critical flow | DIRECTION LOCKED | protected intent |
| DS-01 | Macro Calm / Micro Precision | DIRECTION LOCKED | integrated design principle |
| DS-02 | Datum Before Container | DIRECTION LOCKED | hierarchy principle |
| DS-03 | No aviation cosplay | DIRECTION LOCKED | identity exclusion |
| DS-04 | 20/17/15 first-use scale baseline | KEEP / CANDIDATE | usable working contract, not final production token |
| DS-05 | Final font | OPEN | Type gate not closed |
| DS-06 | Final palette/HEX | OPEN | visual lock + runtime evidence pending |
| DS-07 | Exact radii/strokes | OPEN | portfolio/system work pending |

## Reopen rule

A locked item may only reopen when:
- product authority changes;
- new engineering truth makes the state impossible or false;
- new platform evidence invalidates the contract;
- a transfer test shows the visual rule fails another core screen;
- owner explicitly requests reconsideration.

New research by itself is not sufficient reason to churn a locked item.
