# Candidate 17 — Discipline Review R5

Exact candidate source reviewed: `4ae6eb917cbc8f0509797194755f814e734f054a`
Frozen structural source: `79fd5c43ca6b09ea5b773c77319709139f1b8089`
Authority snapshot: `design-studio@74dcb12d278c110dd682ac0ff8c4988aceaba28b`
Prior runtime evidence: run 35676351817 succeeded but is visually rejected due tofu/Ahem glyph defects.

- **Type — KEEP.** Inter remains the explicit proportional UI family and Roboto Mono the bounded operational mono. Flight-header DefaultTextStyle now explicitly resolves C17Sans, eliminating the Ahem ambiguity without altering type metrics or grid geometry.
- **Color — KEEP.** Non-pastel cool-white/blue-black grounds, cobalt functional primary and bounded lime micro-signal are unchanged. State redundancy remains fill/weight/semantics and focus boundary thickness/color.
- **Layout/Spatial — KEEP.** Original Home geometry remains intact. CustomPaint replacements occupy the same 16/18 px icon bounds and do not affect page inset, section positions, action/search/month/flight/activity/totals geometry or 23/25/30/22 flight grid.
- **Interaction — KEEP.** Settings and Search remain the same semantic/hit controls; only their visual glyph renderer changed. No destination, focus authority, hit target or state transition changed.
- **Content/UX Writing — KEEP.** All baseline labels and fixtures are unchanged; flight-header labels are now correctly rendered rather than blocked.
- **Web/runtime — KEEP TO RENDER.** The prior successful run proved compilation/layout execution, while manual inspection identified deterministic glyph defects. Font-independent icon rendering and explicit header font binding are now in exact source; a clean rerender is the required gate.
- **Accessibility/Human Factors — KEEP (source gate).** Existing semantic labels remain authoritative for settings/search; vector glyph replacement does not remove accessible names. Selected/focus redundancy remains intact. AT/device/human PASS remains open.
- **Brand/Identity — KEEP.** Split Signal's visual code is strengthened by deterministic line-drawn utility glyphs while preserving the original layout and avoiding platform-icon-font dependency, aviation ornament or copied external-app assets.
- **External-reference integrity — KEEP.** External apps remain principle-only references. The repaired custom glyphs are independently drawn primitives and do not reproduce third-party icon assets.

**Coordinator verdict: UNANIMOUS KEEP / Web KEEP TO RENDER. Render gate OPEN.**
Final acceptance still requires opening both new PNGs and passing glyph/font, clipping/overflow, alignment, spacing, boundaries, contrast, state-expression and whole-screen integrity inspection.
