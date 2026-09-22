# Candidate 17 — Revision / Blocker Record

## R0 render blocker
Workflow run 35668522319 failed before rendering because `test/candidate17_render_test.dart` imported a nonexistent package path (`package:logmate_design_test/home_candidate_17.dart`). No PNG artifact was produced. This is NON-EXECUTION evidence, not negative visual evidence.

## R1 review invalidation
R1 reviewed a wrapper implementation that applied an outer Theme while `HomeV011` immediately rebuilt its own fixed internal palette. The claimed candidate color transfer therefore was not actually present in the exact runtime source. R1 is retained for audit history but is superseded and must not be used as the render gate.

## Repair
Candidate 17 was rebuilt directly from frozen baseline commit `79fd5c43ca6b09ea5b773c77319709139f1b8089`, copying the Home structure and fixtures exactly into `lib/home_candidate_17.dart` and changing only visual tokens/treatments permitted by the candidate contract. Layout dimensions, section order, spacers, page padding, action placement, month controls, metric grids, flight grid flexes 23/25/30/22, Activity placement, Totals placement, semantics and fixture values remain baseline-derived.

The renderer import was corrected to the branch source. Inter and Roboto Mono were bundled and registered for deterministic UI/operational rendering.

External-app research is principle-only (Flighty salience, Linear compact workflow/state clarity, Things reduced chrome); no external layout, screenshot, asset, icon system, branded motif or palette is copied.
