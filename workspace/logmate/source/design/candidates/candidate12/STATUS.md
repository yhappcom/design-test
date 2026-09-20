# Candidate 12 — Night Flight Paper

State: BLOCKED_IN_REVIEW

- Structural baseline: `checkpoint/home-structural-baseline-20260919` / `f992d62a98193629d19346a022a64deef824570c`
- Working branch: `candidate12-independent-20260921`
- Initial implementation: `20dbf9016169dc3fb29b14a7df3d4460f5a31d37`
- R1 gate record: `design/candidates/candidate12/REVIEW_GATE_20260921.md`
- Design Studio snapshot: `main` tree `1d0ebf27e498091ec926bbfb61165acbf1ed1760`
- R1 verdicts: Type REVISE; Color REVISE; Layout KEEP; Interaction KEEP; Content KEEP; Web/Runtime REVISE; cross-cutting accessibility static KEEP.
- Render: NOT PERMITTED (unanimous KEEP not reached)
- Renderer commit/run: none
- PNG evidence: none
- Visual inspection: not started
- Owner state: not eligible for display

Blocker: the initial outer-theme concept is shadowed by the baseline Home's nested `_V11Theme` and private color tokens. The candidate must be reimplemented as an exact structural clone with candidate-local visual tokens (or an equivalent non-structural token injection) before full R2 review. This run preserved the failed gate rather than manufacturing KEEP or rendering misleading baseline output.

Next run must resume Candidate 12 before opening Candidate 13.
