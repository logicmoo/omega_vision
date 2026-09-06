# Working model

- **[Checked]** Seven levels; only `ACTION6(x,y)`. The top color-9 edge line is a per-attempt click budget, not gameplay.
- **[Checked]** Route/transform a colored 14-cell plug into its complementary socket. The six command columns execute left-to-right when the color-9 disk at `(57,58)` is clicked. Each cap/stem segment toggles `1<->5`. An ordinary unsuccessful program restores the plug to its last safe start while preserving program bits; socket success advances the level.
- **[Checked codes]** For each column's top/middle/bottom pairs: NO-OP=`[(1,1),(1,1),(1,1)]`; LEFT=`[(5,1),(1,1),(1,1)]`; DOWN=`[(5,5),(1,1),(1,1)]`; RIGHT=`[(1,5),(1,1),(1,1)]`; UP=`[(5,1),(1,1),(1,5)]`; SHRINK=`[(5,1),(1,5),(1,1)]`; GROW=`[(1,1),(1,5),(1,1)]`; ROTATE-clockwise=`[(5,1),(5,1),(1,1)]`; RECOLOR-to-swatch=`[(5,5),(5,5),(5,5)]`. Scale changes preserve top-left.
- **[Checked UI]** Yellow patch position identifies cardinal demonstrations; a center dot demonstrated SHRINK. Selector demonstrations run a locked color-4 example and expose a repeated full-column code.
- **[Checked checkpoint mechanic]** A 4x4 half-plug-color checker is a safe landing point: if a program ends there, the plug remains there rather than resetting. When the plug later leaves, the checker pattern reappears, so it is not visibly consumed. Level 6 used all three and completed, but the log does **not** distinguish whether such checkers are mandatory waypoints or merely optional save points.
- **[Checked history]** Level 5 was `DOWN,DOWN,DOWN,ROTATE,RECOLOR,GROW`. Level 6 completed at step 112 after checkpointing at `(5,6)`, `(4,4)`, `(5,0)` and then entering its socket.

# Working memory

- Final level 7 is at counter `6/7`, fresh at step 112; all six columns `x=[34,39,44,49,54,59]` are NO-OP.
- Tile coordinates use top-left `(33+4c,4+4r)`. Movable color-11 plug is at `(2,6)` (`x41..44,y28..31`), missing its top-middle cells. Its exact complementary socket accepts that orientation at `(2,1)` (`x41..44,y8..11`).
- Full color-6 blockers are `(1,0),(2,0),(3,0),(1,1),(3,1),(0,3),(4,5),(4,6)`. Checkers are `(5,5),(5,1),(0,2)`. New paired multicolor gate-like tiles are `(1,3)` and `(6,3)`; portal behavior is still assumed, not tested.
- **[Checked geometry]** Contrary to the decorative checkpoint/gate route, five ordinary UP moves from `(2,6)` pass through clear tiles `(2,5),(2,4),(2,3),(2,2)` and fit the socket at `(2,1)`. Thus the cheapest test of the only unresolved objective rule is `UP,UP,UP,UP,UP,NO-OP`.
- **Current deliberate probe:** encode that direct route and launch. Hypothesis A (checkers optional safe points) predicts immediate final completion/WIN. Hypothesis B (waypoints required) predicts no completion/reset, after which the intended all-checker route and new gate can be investigated. This is safer and potentially much shorter than assuming hidden mandatory waypoints.
