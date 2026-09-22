# Candidate 21 Runtime Evidence

Status: INCOMPLETE — RESUME SAME CANDIDATE. Do not open Candidate 22.

GitHub Actions render attempts:
- Run 35753409715: failed compile in initial compact source; superseded.
- Run 35753525581: failed compile in compact revision; superseded.
- Run 35753660077: structured source compiled, but render harness lacked Material ancestor and exposed flight-zone overflow.
- Run 35753783048: Material harness corrected; source compiles. Remaining deterministic 390×844 defect: Flight carrier+number content overflows frozen 62px flight zone by ~2.3px (short values) and ~15px (`7C 1123`) in both Light/Dark.

This is not a baseline blocker. Required next action is same-candidate typography treatment inside the frozen 62px operational zone (do not widen/change operational geometry), followed by full discipline re-review because typography implementation changes, then rerender/open/inspect both PNGs.

Current review state: R3 unanimous KEEP / Web runtime KEEP TO RENDER before runtime evidence. Runtime evidence now changes Web/runtime to REVISE and therefore overall gate is NOT KEEP.
