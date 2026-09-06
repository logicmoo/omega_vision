# Working model

- **Checked (levels 1–2):** Logical movement centers are 6 pixels apart. ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right. A legal move has a 7-frame animation. Color 5 is track; the active avatar is a color-9 5x5 ring with a color-5 center; entering the matching color-9 frame/dot goal completes a level.
- **Checked (levels 1–2):** ACTION5 rewinds the active timeline to the level start, stores its input sequence as a color-2 clone, and advances the top-left HUD slot. Every subsequent directional input advances all clones by one stored input; a clone whose sequence ends holds its endpoint forever. Multiple clones work concurrently. Use at most `HUD slots - 1` rewinds.
- **Checked (levels 1–2):** A color-8 system has a 3x3 pressure pad, thin wire/rail, and notched 5x5 blocker. Occupying the pad moves the blocker one logical tile off its blocked node; leaving restores it. A completed clone can hold the pad.
- **Checked (levels 1–2):** The changing color-9 bottom border is a generous action-budget bar, not terrain.
- **Safety:** RESET restarts this level; never RESET twice consecutively. ACTION5 consumes a timeline slot and is not ordinary undo.

# Working memory

- **Level 3, step 58; 2/7 complete.** Start/current `(10,22)`, goal `(22,22)`, three timeline slots, full 64-cell timer. The apparent direct route is disconnected; goal is reachable only upward through blocker `(22,34)`.
- **Checked geometry (Python):** Color-8 switch B `(40,34)` controls blocker B `(40,52)`. Color-8 switch A `(22,52)` controls blocker A `(22,34)`. A new color-11 3x3 control `(34,22)` is wired horizontally to a solid 5x5 blocker at `(52,22)`, which bars the only route to the right/bottom loop.
- **Assumed, not yet usable for commitment:** Color 11 likely differs from pressure color 8 by latching after activation. Three gates but only two clones make a latched control necessary. Cheapest useful probe is the required route `up×2,right×4,down×2` to `(34,22)`; predict its linked blocker center `(52,22)` clears. Then leave once to test whether it stays clear.
- **Conditional solution if color 11 latches (graph and timing checked):** T1 `U2,R4,D4,R` ends on B at tick 11 after latching color 11 at tick 8. T2 `U2,R7,D7,L5` ends on A at tick 21; clone 1 opens color-11 gate before tick 11 and B before tick 18. T3 `U2,R7,D7,L7,U3,R2,U2` reaches goal at tick 30; clone 2 holds A from tick 21.
- **Next:** Execute only the 8-move route to color-11 control and inspect its activation before relying on the conditional schedule.
- **Ruled out on level 3:** nothing yet.
