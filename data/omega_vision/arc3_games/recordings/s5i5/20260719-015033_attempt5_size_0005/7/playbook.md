# Working model

- **[Checked, levels 1–4]** `ACTION6` clicks paired color-matched controls for 3-cell-thick actuators. The second/right glyph extends by one 3×3 unit away from the gray cap; the first/left glyph retracts one unit toward it. Extension inserts body color, and either operation translates every recursively downstream touching object by 3.
- **[Checked, levels 1–4]** A single magenta/color-13 center marks an active head. A hollow four-arm magenta cross has a background center and is a target. Docking fills the center to make a solid plus; all active heads docked completes the level. **[Strong level-5 inference]** A solid plus present initially is an already-docked active and should be left in place.
- **[Checked, level 3]** Color-1 blocks move when downstream of an actuator; color-15 blocks are fixed barriers. Merely side-adjacent objects do not couple when they are not downstream along the motion axis.
- **[Checked, level 4]** One control color can drive several actuators simultaneously. A collision in any branch rejects the entire action. Actuator occupancy blocks motion even when colors match, and two synchronized fronts cannot request the same empty 3×3.
- **[Checked, level 4 steps 112–113]** Gameplay can pass through control-panel/UI cells without collision; the UI remains visually overlaid rather than being overwritten. Bottom row is the action-budget HUD.

# Working memory

- Level 5/8 began at step 113. Controls are four bottom panels: color9 retract/extend `(6,57)/(12,57)`, color12 `(21,57)/(27,57)`, color14 `(36,57)/(42,57)`, color10 `(51,57)/(57,57)`.
- The undocked red/color14 active center is `(10,10)`. Its west-capped horizontal actuator moves it east under color14; the whole red actuator is downstream of a north-capped color12 support, which moves it south. The hollow target is centered `(22,37)`, requiring net color14 `+4` and color12 `+9` extensions.
- A teal/color10 active is already docked as the solid plus centered `(37,25)`; do not touch color10.
- Shared-action constraints:
  - Color12 also extends a duplicate southward shaft at `x=42..44`, initially `y=7..8`.
  - Color14 also extends northward the color9 bar/wall network: bar `x=33..56,y=30..32`, movable color-1 wall `x=30..32,y=30..47`.
  - Color9 retraction shifts that wall right by 3 and shortens the bar from its west end.
- Fixed barriers are `x=15..17,y=9..17`, `x=15..17,y=21..26`, and `x=36..38,y=36..38`. Thus red may extend east while at the three-row gap `y=18..20`, but must be shortened back to net color14 `+1` before its support carries it through the lower barrier.
- **[Occupancy-simulated route, no live probes yet]** Shortest known route is 24 actions:
  1. color12 extend ×3: red `(10,10)→(10,19)`, duplicate shaft ends at y17.
  2. color14 extend ×4: red crosses the gap to `(22,19)` while the bar/wall rises to y18..20/y18..35.
  3. color9 retract ×5: wall reaches x45..47 and clears the duplicate shaft; raising it first avoids the fixed block at x36..38,y36..38.
  4. color14 retract ×3: red shortens to center x13 and bar descends to y27..29.
  5. color12 extend ×3: short red passes the lower barrier to center y28.
  6. color14 extend ×3: red reaches x22 below the barrier.
  7. color12 extend ×3: red docks at `(22,37)`.
- Current next batch: phases 1–2 (3 color12 extensions, then 4 color14 extensions). Exact rectangle checks show these seven actions are disjoint; the final bar lies immediately below the duplicate shaft.