# LogMate Design Decision Register

Status: ACTIVE
Date: 2026-09-18

## D-000 — No current visual baseline

State: CONFIRMED PROCESS FACT
Reason:
Historical/recent visual families are mutually inconsistent and none has completed owner selection + canonical promotion.

Consequence:
No future design may claim to be a revision of “the LogMate UI” until a baseline is selected.

## D-001 — Portfolio is downstream of candidate selection

State: PROCESS DECISION
Reason:
Broad portfolios repeatedly invented unresolved visual decisions.

Rule:
Portfolio is assembled from selected screen/system lineages. It cannot create a new visual language.

## D-002 — Home-led candidate round is next visual decision

State: PROCESS DECISION
Reason:
Home is the medium-density hub connecting first-use, input, mature operation and View Logbook.

Requirement:
Each Home candidate must include limited transfer specimens for:
- Add Flight
- View Logbook

This tests system transfer before selection.

## D-003 — Revision inheritance

State: PROCESS DECISION
Rule:
After owner selects a candidate, revisions preserve its baseline and state only declared deltas.
Local feedback cannot trigger unrelated global restyling.

## D-004 — Canonical promotion is required for real lock

State: PROCESS DECISION
Rule:
Owner-approved product-level visual decisions must be promoted into MASTER.md.
Detailed visual/UI contracts must be promoted into the appropriate docs/specs contract.
Working design files alone cannot create production lock.

## D-005 — Scheduled research is advisory to baseline

State: PROCESS DECISION
Rule:
New research may:
- support baseline;
- propose a local change;
- propose a screen/system reopen.

It may not mutate the selected baseline automatically.

## D-006 — Fresh text-to-image is not a revision mechanism

State: PROCESS DECISION
Rule:
Once a candidate is selected, visual revision should use the selected artifact directly where possible (edit/controlled implementation), not regenerate from a blank textual description.

## Owner-selected visual decisions

None yet.


## D-007 — English-only UI

State: OWNER CONFIRMED / SYSTEM
Date: 2026-09-19

Rule:
- LogMate product UI is English-only.
- Korean UI and translated product-string variants are out of current product scope.
- Numeric date locale ordering remains a separate presentation concern and does not constitute Korean-language UI support.

Impact:
- all owner-decision visual candidates must show English UI only;
- Korean may appear only in external design documentation/annotations, never inside the app screen itself.

## D-008 — Exclude stock Flutter/Material box-card visual grammar

State: OWNER CONFIRMED / SYSTEM
Date: 2026-09-19

Rule:
- stock/default Flutter/Material card/box visual language is not acceptable as LogMate's product UI.
- repeated Card widgets, rounded section panels, generic filled fields, and equal-card dashboards must not define the visual system.
- semantic grouping remains required, but should be authored through datum/alignment, typography, spacing, restrained rules/dividers, and custom interaction primitives.
- interactive controls may retain a boundary when needed for affordance/accessibility, but not as exposed stock Material styling.

Supersedes:
- earlier Add Flight rounded section-card visual treatment;
- Home section-card treatment as a target design;
- recent portfolio/mock screens that rely on generic cards/boxes.

Does not supersede:
- confirmed semantic sections/order;
- 40px/44px/48px interaction-size requirements;
- View Logbook grid/rule geometry;
- state/focus/error/accessibility requirements.

## D-009 — Home Activity uses 28-day rolling period

State: OWNER CONFIRMED / PRODUCT-UI
Date: 2026-09-19

Decision:
- Supersede `Last 30 days` with `Last 28 days` in Home Activity quick periods.
- Current quick-period set becomes `Last 7 days / Last 28 days / Last 90 days / Custom`.
- Calendar `This Month` remains a separate current-period context and is not replaced by 28D.
- This is an aviation-aligned activity window, not a compliance/currency claim.

## D-010 — HOME-B advances to v0.3 for portfolio render

State: OWNER PREFERRED DIRECTION / NOT YET FINAL VISUAL BASELINE
Date: 2026-09-19

Decision:
- Continue with HOME-B lineage.
- Preserve hierarchy: Actions -> Search -> Current Period -> Recent -> Activity -> Totals.
- Home remains ad-free.
- Apply D-009 28D period change.
- Apply Design Studio low-chroma operational color research for the next render.
- After portfolio render, re-audit Type / Color / Layout / Interaction / Web / Content before final visual-baseline approval.

## D-011 — Current Home implementation is not a visual constraint

State: OWNER CONFIRMED / DESIGN GOVERNANCE
Date: 2026-09-19

Decision:
- The currently implemented Home and the current portfolio are reference inputs, not frozen visual authority.
- Existing Home functionality/information families should be preserved unless a separate product decision changes them.
- Specialist review may revise layout order, section emphasis, spacing, density, scroll depth, visual grouping, control presentation and Home composition.
- Existing implementation details such as section-card treatment, exact viewport packing, current hierarchy and component styling do not constrain the new visual design.
- If a proposed change alters product semantics, removes a confirmed information family, changes navigation behavior, or changes domain meaning, escalate it as a PRODUCT decision before redesign.
- HOME-B v0.4 should therefore optimize for specialist evidence rather than visual similarity to the existing Home shell.

## D-012 — HOME-B v0.4 specialist-led refinement

State: ACTIVE PREFERRED CANDIDATE / NOT FINAL BASELINE
Date: 2026-09-19

Decision:
- Continue HOME-B lineage as v0.4.
- Current implementation Home is not a visual constraint; confirmed functional families remain the product constraint.
- Allow natural vertical scrolling instead of compressing all Home families into one viewport.
- First viewport priority: Actions -> Search -> Current Period -> Recent.
- Activity and Totals may remain below fold.
- Preserve Home ad-free, 7D/28D/90D/Custom, low-chroma operational color direction, English-only UI, no stock box/card grammar.
- Derive Welcome / Previous Total / Empty Home from the same visual system rather than creating separate first-use aesthetics.

## D-013 — HOME-B v0.5 code-render candidate

State: ACTIVE PREFERRED CANDIDATE / NOT FINAL VISUAL BASELINE
Date: 2026-09-19

Decision:
- Advance HOME-B lineage from v0.4 to v0.5.
- Preserve semantic order: Header -> Actions -> Search -> Current Period -> Recent -> Activity -> Totals.
- Recompose Current Period as actual month orientation (`SEP 2026`) plus This month / This year datum values rather than a generic dashboard section.
- Recompose Recent into Home-specific two-level rows (date/flight metadata + route/duration) rather than miniature ledger rows.
- Keep Activity and Totals in natural scroll; do not compress typography to expose them above fold.
- Keep Home ad-free, English-only, 7D/28D/90D/Custom, C017 System C, and no stock card/dashboard grammar.
- Code-rendered v0.5 passes Flutter analyze, semantic contract tests, 200% text, short-height, Search+IME pressure tests, light/dark golden generation, and artifact upload in CI.
- v0.5 remains candidate-level until owner visual approval and final specialist delta review.


## D-014 — HOME-B v0.6 premium identity review candidate

State: OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL VISUAL BASELINE
Date: 2026-09-19

Decision:
- Preserve HOME-B v0.5 information architecture and semantic ordering.
- Explore a premium-brand identity layer as HOME-B v0.6 rather than restarting the Home concept.
- Working internal character is `Quiet Precision`; this is not product copy.
- Premium transfer uses essential reduction, precision, material honesty, contextual restraint and micro-detail rather than luxury ornament.
- No aviation imagery, fake metallic/glass texture, marketing slogan, card-dashboard grammar or new product feature is introduced.
- v0.6 uses the same Recent mock data as v0.5 for controlled comparison.
- v0.6 Flutter candidate passes analyze, semantic, 200% text, short-height, Search+IME, light/dark golden and artifact gates at head `997e6eee44a39191caa8e9ea468f04296299e15a`, CI run `35413129800`.
- v0.6 does not replace v0.5 or become baseline until owner visual review.


## D-015 — HOME-B v0.7 contemporary premium reset

State: OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL VISUAL BASELINE
Date: 2026-09-19

Trigger:
- Owner judged v0.6 improved but still rough and reminiscent of an older app.

Decision:
- Do not intensify the v0.6 industrial/archival visual grammar.
- Preserve the validated Home information architecture and semantic order.
- Re-encode `Quiet Precision` through contemporary native-product hierarchy:
  - whitespace over rules;
  - soft material only for controls;
  - open operational content;
  - natural-language casing;
  - familiar interaction geometry;
  - selective curvature;
  - quieter chrome.
- Remove the v0.6 uppercase search locator, underline search, metadata rail, abbreviated month hero, text Settings, ruled secondary action, dash period selection and vertical metric separators.
- Preserve Add Flight, View Logbook, Search, current-period semantics, Recent Flights, Activity, Totals and 7D/28D/90D/Custom.
- Preserve the same recent-flight mock dataset used in v0.5/v0.6.
- v0.7 passes analyze, semantic, 200% text, short-height, Search+IME and light/dark golden gates at head `796c6d3436a3ae67f281a45f7779ad2b9056e14e`, CI run `35415297386`.
- v0.7 does not replace v0.5/v0.6 or become a product baseline until explicit owner approval.


## D-016 — HOME-B v0.7.1 typography and layout calibration

State: OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL VISUAL BASELINE
Date: 2026-09-19

Trigger:
- Owner reported text instability/shaking, oversized typography and a need to re-review typography/layout together.

Decision:
- Keep the v0.7 contemporary product-language direction.
- Do not reopen Home information architecture.
- Reduce size-dominant hierarchy and tighten spatial rhythm.
- Calibrate normal Home roles to 18 identity / 24 current-period context / 22 primary current values / 16 section heading / 17 flight route-duration / 18 supporting data / 14 body-control / 12 metadata.
- Align Recent route + duration to the same alphabetic baseline.
- Align month + year through one rich-text baseline.
- Preserve 44x44 interaction targets while allowing smaller visible icon circles.
- Treat CI golden font as a review surrogate, not product typography authority.
- Final validated review harness selected Liberation Sans from installed mature fallbacks and passed all gates at head `5015ed5ec4918fb4ba9ae4a658cff02df87d8be2`, CI run `35417132625`.
- Production typeface, native rasterization and custom LogMate typography remain OPEN.
- v0.7.1 does not become product baseline until explicit owner approval.


## D-017 — HOME-B v0.9 balanced operational grid owner-review candidate

State: OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL VISUAL BASELINE
Date: 2026-09-19

Trigger:
- Owner identified that v0.8 distributed Activity/Totals poorly, visually biased the lower Home to the left, and exposed an internal first-render result before specialist re-critique.

Decision:
- Preserve the HOME-B semantic order and v0.7/v0.8 contemporary direction.
- Replace the lower Home with a coherent full-width relationship grid:
  - Current Period: 2 equal metric columns.
  - Activity periods: 4 equal full-width targets at normal text size.
  - Activity metrics: 3 equal columns.
  - Totals: 3 equal columns on one row, with label-height normalization.
- Keep DEP / arrow / ARR fixed spatial slots.
- Replace v0.8 artificial per-glyph spacing with a review-only mature mono/data role for airport codes and flight identifiers; production custom data type remains OPEN.
- Keep time/quantity values tabular.
- Normalize the large section intervals to one quieter rhythm and strengthen metadata contrast.
- At enlarged text, Activity periods recompose to Wrap and stable-data slots scale with text rather than clipping.
- Promote Design Studio I041/I042 internal-iteration/owner-gate discipline into design/README.md: first render is never an owner deliverable.
- The internally reviewed 390x844 light/dark reference render resolves the v0.8 left-bias and lower-screen distribution defect.
- Flutter Actions runs 51 and 52 ended before job steps were exposed/executed; therefore v0.9 does NOT claim Flutter analyze, semantic, 200% or golden CI PASS yet.
- v0.9 remains an owner-review visual candidate only and does not become product baseline until explicit owner approval and runtime gates execute.


## D-018 — HOME-B v0.10 precision recomposition owner-review candidate

State: OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL VISUAL BASELINE
Date: 2026-09-19

Trigger:
- Owner judged v0.9 still too basic/generic and identified specific issues in top actions, search height, month navigation mapping, Recent Flights information use, Activity period wording/alignment, and Totals hierarchy/alignment.

Research reconciliation:
- L002 supports reducing unnecessary visual/vertical density without sacrificing information or touch safety.
- Interaction 007/015 supports familiar action semantics and direct mapping; month navigation moves to symmetric previous/current/next composition.
- T017/T018/T020 support semantic geometry for DEP/ARR/time while rejecting blanket/generic monospace as the default identifier solution.
- CD002/CD004 support explicit period wording over unexplained abbreviation when brevity would reduce comprehension.
- Layout 006/L001 support full-width relationship grids and optical balance rather than mechanical right alignment.

Candidate changes:
- top actions become a compact shared command rail; Add Flight retains the stronger affordance without a stock filled button surface;
- search visible height reduced while preserving intrinsic growth;
- September 2026 sits between symmetric previous/next controls;
- Recent Flights becomes Date / Flight / Route / Block operational grid;
- Date and Flight hierarchy is strengthened;
- Activity uses 7 days / 28 days / 90 days / Custom;
- Activity and Totals summary cells center their visual mass across three equal columns;
- Totals restores full Instrument Flight Time wording and reserves equal label height so value baselines remain aligned;
- route identifiers return to proportional UI type inside fixed semantic DEP / arrow / ARR tracks.

Internal review:
- first v0.10 render was rejected internally because the two top actions still read as generic button components and Totals shortened Instrument Flight Time;
- second internal pass replaced the pair with a shared command rail + compact Add affordance, restored full terminology, added Recent column separation, and normalized Total label height;
- the resulting 390x844 light/dark code-render reference has no known owner-feedback mismatch from this cycle.

Evidence boundary:
- GitHub Actions run 53 ended as failure before usable workflow-step evidence was available.
- v0.10 therefore does not claim Flutter analyze / semantic / 200% / IME / Flutter-golden PASS.
- owner-review visual reference is code-rendered locally; native/Flutter runtime gates remain OPEN.


## D-019 — HOME-B v0.11 visual-system consolidation owner-review candidate

State: OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL VISUAL BASELINE
Date: 2026-09-19

Authorization:
- Owner approved the previously reported large-scope Home recomposition.
- Owner explicitly prohibited use of the in-progress produced/custom LogMate font for this pass.

Latest-research gate:
- Design Studio main was checked before and after implementation.
- Latest T067 / L089 / I085 / CD104 work concerns unsaved-exit/lifecycle truth and does not introduce a conflicting Home-composition requirement.
- Current Type status still does not claim T021/custom-font production PASS.
- v0.11 therefore uses only the mature inherited review UI family.

System decisions:
- consolidate typography into semantic roles rather than per-widget styling;
- order Home as Header -> Search -> Current Period -> equal-level Actions -> Recent -> Activity -> Totals;
- Add Flight and View Logbook have equal visual hierarchy and no surrounding rail/divider/filled-button shell;
- center This month / This year under the current-period context;
- use one Data Label role for current-period labels, Recent column labels, Activity labels and Totals labels;
- use Recent track proportions 20 / 22 / 38 / 20 for Date / Flight / Route / Block;
- remove Activity underline/tab cue and use a local selected surface + weight;
- move Totals Customize / Details into the section heading row;
- keep Instrument Flight Time full, one-line, and allocate Totals tracks 30 / 28 / 42.

Post-render contradiction audit:
- Light and Dark 390x844 code-render references were reviewed as whole screens.
- The top action pair no longer competes with the product header and is positioned after current-period orientation.
- Recent no longer gives Route the majority of the available width.
- same-level labels share one typographic role across sections;
- no unnecessary surrounding rules remain;
- Activity selection no longer uses an underline;
- Instrument Flight Time remains one line;
- Totals actions no longer occupy a detached bottom row.

Operational stress reference:
- WAW -> ICN / JFK -> LAX / LHR -> CDG;
- 7C1123 / SQ321 / KE28;
- 12+40 / 999+59 / 1+05.
At the 390px static reference, screen and row scroll widths remain equal to their client widths; no horizontal overflow was observed.

Evidence boundary:
- GitHub Actions run 56 still completed as failure before this response could obtain usable runtime-gate evidence.
- Therefore v0.11 does NOT claim Flutter analyze, semantic, 200%, IME, native raster or Flutter-golden PASS.
- Static code-render/research contradiction review is complete; runtime gates remain OPEN.

v0.11 is not a final visual baseline until explicit owner selection and canonical promotion.


### D-019 refinement — 2026-09-19

Owner-approved refinement scope:
- reduce Search -> Current Period spacing;
- reduce current-period title scale;
- reduce visible Search field height while keeping a larger hit/focus target;
- preserve equal hierarchy for Add Flight and View Logbook while improving grouping clarity;
- remove default accent-green treatment from View all / Details / Customize unless semantic color evidence requires it;
- rebalance Recent Date / Flight / Route / Block tracks;
- align Recent row information hierarchy;
- add a thin visual separation between carrier code and flight number for display;
- validate Block alignment only through the owner-defined maximum of 7+59.

Research reconciliation:
- Color 008 / current COLOR_STATUS do not justify using brand/accent color as a generic utility-link default. Utility actions therefore use the neutral secondary role; accent remains reserved for focus/selection or other explicit semantics.
- Type 009 supports the reduced current-period context scale and same-role Recent hierarchy.
- Layout L001/L002 support tighter Search -> context grouping and rebalanced Recent tracks.
- No new Design Studio main change appeared after implementation; latest main remained the T067/L089/I085/CD104 lifecycle family and introduced no conflicting Home-static requirement.

Result:
- current-period context scale reduced from 22sp to 19sp;
- Search visual surface reduced to 34px inside a 40px interaction target;
- Search -> current-period gap reduced from 18px to 10px;
- top actions remain equal-level and now use the same neutral leading-glyph grammar;
- utility actions use neutral secondary color instead of accent green;
- Recent row values now share the same operational hierarchy;
- Recent tracks changed from 20/22/38/20 to 21/23/34/22;
- display flight identifiers use a thin space, e.g. 7C 1123 and KE 28;
- Block remains right aligned with tabular figures.
- static stress at WAW -> ICN / 7C 1123 / 7+59 preserved 390px screen width and 342px row width without horizontal overflow.

This refinement does not change D-019's owner-review-candidate status or promote a final visual baseline.


### D-019 refinement B — Home Activity / layout consolidation

State remains OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL.

Approved implementation:
- restore Header -> Actions -> Search -> Current Period -> Recent -> Activity -> Totals;
- place Add Flight at left edge and View Logbook at right edge with equal hierarchy;
- rebalance Recent to 23 / 25 / 30 / 22;
- preserve 7 / 28 / 90 / Custom and Legs / Block / TO/LD;
- give the four Activity periods equal full-width interaction zones;
- separate Current Period primary numerics from quieter Activity/Totals summary numerics;
- use `Inst` for Home compact Instrument Flight Time;
- validate the existing three Totals slots with `99,999+59` in all slots before any slot-count decision.

Measured static 390px reference shows no horizontal overflow for the owner-defined Recent stress `7C 1123A / WAW -> ICN / 7+59` and no overflow in three equal 114px Totals columns containing `99,999+59`.


### D-019 refinement C — Section destinations and Totals Customize

State remains OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL.

Owner-approved candidate refinement:
- Home Recent uses `View all ›`;
- Home Activity uses `Details ›`;
- Home Totals uses `Details ›`;
- remove `Customize` from the Home Totals heading row;
- plan to expose `Customize` directly inside Totals Detail because configuration is expected to be low-frequency after setup.

This refinement changes Home presentation/navigation exposure only. It does not finalize Totals category selection, persistence, or the Totals Detail composition.


### D-019 refinement D — Recent alignment and Search/Settings candidate

State remains OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL.

Candidate refinement:
- Recent semantic columns use centered outer value components for Date / Flight / Route / Block;
- Flight keeps its internally zoned carrier + number/suffix structure;
- Block reserves `00+00` capacity in a centered fixed numeric box;
- Settings keeps the outlined gear semantic and 40x40 target, with optical glyph-right adjustment only;
- Home Search placeholder candidate becomes `Search logbook`.

Search interaction itself is governed by `docs/specs/search-interaction-spec.md`; autocomplete/suggestion behavior remains SEARCH-001 OPEN and is not implied by the placeholder.


### D-019 refinement E — Operational identifier stability — SUPERSEDED TRIAL

**Status: SUPERSEDED by refinement F.** Equal per-character cells were rendered and rejected because they created unacceptable letter/number spacing. The owner direction to eliminate identifier jitter and retain the current Flight presentation remains valid; only the fixed-cell implementation principle below is superseded.

Owner direction:
- retain the current Home Recent Flight presentation grammar;
- reject intrinsic whole-string centering as the replacement Flight treatment;
- require a stable solution for alphabetic code jitter in DEP/ARR and comparable operational identifiers.

Candidate implementation principle:
- equal per-character layout cells using the existing product font for fixed-format operational codes;
- numeric tabular features remain for numeric readouts;
- do not use letter-spacing as a substitute for equal character origins;
- do not apply a global monospace face merely to repair these code fields.

Rendered/native proof is still required before this candidate becomes a production typography/layout contract.


### D-019 refinement F — Current Home typography and semantic consolidation

State remains **OWNER REVIEW CANDIDATE / NOT SELECTED / NOT FINAL**.

Owner-confirmed semantic:
- Home Current Period `This month` / `This year` values represent **Block Time**.

Current Home candidate:
- order = Header -> Actions -> Search -> Current Period -> Recent -> Activity -> Totals;
- Current Period primary values = Block Time;
- Recent tracks = 23 / 25 / 30 / 22 for Date / Flight / Route / Block;
- Recent Date = selective monospace candidate, 13.5px / w400 / letterSpacing 0;
- Recent DEP/ARR = selective monospace candidate, 13.5px / w400 / letterSpacing 0;
- Recent Flight retains the existing internally zoned carrier + number/suffix presentation;
- Recent Block retains proportional operational typography with tabular figures and a centered 52px value box sized for at least `00+00`;
- rejected equal-per-character-cell treatment must not be restored;
- Home Search placeholder candidate = `Search logbook`; Search suggestions/autocomplete remain SEARCH-001 OPEN;
- Settings retains outlined gear semantics, 40x40 hit target, and right-edge optical glyph adjustment;
- Activity = 7 days / 28 days / 90 days / Custom with Legs / Block / TO / LD summary;
- Totals = Block / Night / Inst with three equal current candidate slots;
- Home section destinations = Recent `View all ›`, Activity `Details ›`, Totals `Details ›`; Totals Customize is not exposed on Home.

Implementation/evidence boundary:
- selective monospace is visually accepted only as a current Home candidate; production mono family and native iOS/Android rendering are not yet fixed;
- this refinement does not automatically apply Date/DEP/ARR typography to Activity Detail, View Logbook, Add Flight, or the whole app;
- static Light/Dark review is evidence only; native Flutter/runtime/physical-device and representative-human validation remain OPEN.

Current implementation reference is `design/HOME_CURRENT_SNAPSHOT.md`. Earlier D-019 values remain historical chronology and must not be used to reconstruct the current Home.
