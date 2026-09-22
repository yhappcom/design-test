# Candidate 17 — Revision / Blocker Record

## R0 render blocker
Workflow run 35668522319 failed before rendering because `test/candidate17_render_test.dart` imported a nonexistent package path (`package:logmate_design_test/home_candidate_17.dart`). No PNG artifact was produced. This is NON-EXECUTION evidence, not negative visual evidence.

## R1 review invalidation
R1 reviewed a wrapper implementation that applied an outer Theme while `HomeV011` immediately rebuilt its own fixed internal palette. The claimed candidate color transfer therefore was not actually present in the exact runtime source. R1 is retained for audit history but is superseded and must not be used as the render gate.

## Repair
Candidate 17 was rebuilt directly from frozen baseline commit `79fd5c43ca6b09ea5b773c77319709139f1b8089`, copying the Home structure and fixtures exactly into `lib/home_candidate_17.dart` and changing only visual tokens/treatments permitted by the candidate contract. Layout dimensions, section order, spacers, page padding, action placement, month controls, metric grids, flight grid flexes 23/25/30/22, Activity placement, Totals placement, semantics and fixture values remain baseline-derived.

The renderer import was corrected to the branch source. Inter and Roboto Mono were bundled and registered for deterministic UI/operational rendering.

External-app research is principle-only (Flighty salience, Linear compact workflow/state clarity, Things reduced chrome); no external layout, screenshot, asset, icon system, branded motif or palette is copied.


## R2 compile blocker
Workflow run 35675974168 reached the relevant Flutter test but compilation stopped on a defect inherited from the frozen baseline: `SizedBox(minHeight: 30)` is not a valid Flutter constructor argument. This again produced no render artifact and is classified as NON-EXECUTION rather than visual evidence.

Repair: replace that single baseline expression with `ConstrainedBox(constraints: BoxConstraints(minHeight: 30))`. The intended minimum-height geometry remains 30 px; section placement, spacing, sizing and content are unchanged.

Because exact source changed, R2 is superseded for the render gate and all discipline passes are rerun as R3.


## R3 runtime-layout blocker
Workflow run 35676170577 compiled but failed during layout because the frozen baseline's action item placed a `Flexible` text child inside a Row receiving unbounded horizontal constraints from the parent action Row. This is an inherited runtime defect, not Candidate 17's visual concept.

Repair: remove only the unnecessary inner `Flexible` wrapper around the short fixed action label. The parent action Row, action positions, hit geometry, labels, spacing and vertical geometry remain unchanged. R3 is superseded and all discipline passes are rerun as R4.


## R4 visual-inspection defect
Workflow run 35676351817 produced valid Light/Dark PNGs, but manual open inspection found two deterministic-render defects:
1. Material settings/search icon glyphs rendered as square tofu blocks.
2. Recent Flights header labels rendered as Ahem-like blocks because the DefaultTextStyle path did not resolve the intended candidate font.

Repair:
- replace settings/search font icons with font-independent CustomPainter vector glyphs at the same visual bounds and positions;
- bind C17Sans explicitly to the flight-header DefaultTextStyle.

No section, spacing, action location, grid geometry, data fixture or semantic destination changed. Because exact visual source changed, R4 is superseded and all discipline passes are rerun as R5.
