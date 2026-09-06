# Working model

## Checked against log
- Logical cell scale/offset varies. L4 used width20, scale3, origin `(2,2)`; L5 uses a 19x19 interior, scale3, origin `(5,5)`. Always derive it anew.
- ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right by one logical cell; ACTION5 starts flow; ACTION6 selects a clicked movable entity and deselects the old one.
- Selected movable material is color9; inactive is color8. Entity identity is not simply a visible component: L4's `8884888` row was one composite whose two wings and central color4 moved together, while touching bars on different rows remained independently selectable.
- On ACTION5, color6 grows one logical cell/frame away from adjacent color4 and leaves a trail. Retrodicted rule: frontier advances forward if open; if forward is blocked, it spreads left/right on its current row. Old trail is not an obstacle. `scratch/flow.py::grow_grid` implements this exact 2-D rule.
- A separated horizontal interval hit by streams replaces hit columns with its outside columns. Adjacent obstacles/cups can block or redirect lateral exits, so final layouts must be checked in the exact 2-D model rather than only the stream-set model.
- Side-board exits can be suppressed. A U cup captures flow entering its opening when the other directions are obstacle or old trail.
- Completed: L1 split, L2 cascade, L3 multi-source/edge suppression, L4 composite-bar cascade. L4's exact simulation (including central movable color4 as solid) was confirmed by live success at step64.

## Assumed / to test
- L5 color15 L-triomino is a fixed solid obstacle. The planned routes and movement paths miss it, so the solution does not depend on testing selection/collision with it.

# Working memory
- Level5 at step64, progress4/6, full 64-cell bottom timer. Logical `(X,Y)` maps to physical center `(6+3X,6+3Y)`.
- Flow is upward from seeds `(5,17),(13,17)`. Cups open at top `(5,1),(11,1),(15,1)` and sideways at `(1,11)`. Static color15 occupies `(9,12),(10,12),(10,13)`.
- Current bars: A inactive length4 `(L8,Y5)`; B inactive length3 `(L5,Y9)`; C selected length5 `(L12,Y9)`.
- Exhaustive exact simulation over all placements with a side-capturing bar found minimum Manhattan movement 22, and all successes move all three bars. Minimum-action candidate: A `(L2,Y10)`, B `(L7,Y2)`, C `(L10,Y9)`; starting with C selected gives 22 moves + 2 selections + ACTION5 = 25 actions.
- Candidate mechanism: A at row10 is hit by source5 and spreads left into side cup while its right exit becomes column6; C turns source13 into columns9 and15; B/cup-wall interactions near row2 convert columns6/9 into top openings5/11, while15 enters directly. Exact simulation fills precisely all four openings without boundary leakage.
- Collision-free movement order: C left2; select B, up7 at L5 (passes just left of A), then right2; select A, left6 then down5; ACTION5. Paths avoid color15 and other bars.
- Ruled out: treating L4 G as separate bars; L5's superficially simple final A-side/B12/C6 costs more (25 moves) than the exact cup-assisted row2 solution.