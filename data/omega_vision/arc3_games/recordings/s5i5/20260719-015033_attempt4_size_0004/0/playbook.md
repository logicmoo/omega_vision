# Working model

- **[Checked, levels 1–3]** `ACTION6` clicks paired color-matched controls for 3-cell-thick actuators. The second/right (or lower) glyph extends by one 3×3 unit away from the gray cap; the first/opposite glyph retracts one existing unit toward the cap. Extension inserts body color; retraction erases the far slice. Both translate every recursively downstream touching link/object by 3.
- **[Checked, levels 1–3]** Active magenta centers move with their head. Goal is to put every active center in a hollow magenta-cross center. Contact complements the four cross arms into a solid plus; all centers docked transitions the level.
- **[Checked, level 3]** Color-1 blocks are movable downstream walls and can be routed by linked actuators; color-15 blocks act as fixed barriers. Side-adjacent walls do not couple when they are not downstream along the moving axis.
- **[Checked]** Bottom row is an action-budget HUD, not gameplay.
- **[Strong level-4 inference, awaiting probe]** One control color can correspond to several gameplay actuators at once. A click should extend every actuator of that color simultaneously, each in its own cap-defined direction. Level 4 has five yellow actuators but one yellow panel and geometry consistent with simultaneous growth.

# Working memory

- Level 4/8 began at global step 77. Only one hollow target, center (31,10), and one active yellow/color-11 head, center (31,43), with south gray cap y=44; eleven northward 3-cell extensions reach the target.
- Five paired horizontal control panels are present: color14 at left/top, color9 at right/top, color11 at center, color12 at left/bottom, color8 at right/bottom. Yellow's right/extend glyph has a safe colored click at (34,53).
- Besides the active yellow vertical head, four ordinary yellow actuators share color 11:
  - x=51..53,y=12..14, east gray cap x=53, so extends west;
  - x=9..11,y=15..17, west cap x=9, so extends east;
  - x=45..47,y=18..20, east cap x=47, so extends west;
  - x=18..20,y=24..26, west cap x=18, so extends east.
  Each is attached downstream of a unique vertical actuator (colors 9,14,8,12 respectively). Those unique controls may reposition the horizontal yellow bars if simultaneous growth would otherwise collide, but static paths for eleven yellow extensions appear deliberately staggered and may require no adjustment.
- Next deliberate probe (also one required goal move): click yellow right at (34,53). Under the parallel-actuation model, active center moves (31,43)→(31,40), and 3×3 yellow units appear simultaneously at x48..50/y12..14, x12..14/y15..17, x42..44/y18..20, and x21..23/y24..26. If only the active head moves or a collision occurs, re-derive from exact diff before repeating.
