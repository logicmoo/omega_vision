# Working model

- **Checked through level 5:** A level completes only when every 3x3 color-4 marker center is simultaneously covered by shape geometry of the marker center's required color. Same-color shapes may cover markers collectively; visible target-colored center pixels alone are insufficient.
- **Checked controls:** ACTION1 up 3, ACTION2 down 3, ACTION3 left 3, ACTION4 right 3. ACTION5 cycles shapes in generation order, restores the old reference point's transported underlay, and blackens the new shape's reference point.
- **Checked movement/layers:** Shapes translate rigidly in 3-cell strides, overlap markers/frames/other shapes, restore underlays when uncovered, and clip at edges. Persistent object z-order can hide a selected black anchor.
- **Checked anchor nuance:** Reference-point restoration is transported state, not simply the initial center pixel. Paint contact repaints the selected reference underlay too.
- **Checked completion:** A successful final translation immediately loads the next level; omit old-board expectations on it and use `expect_levels`.
- **Checked paint stations (levels 4-5):** Any selected-shape pixel touching any part of a framed 6x6 station (including color2 frame) repaints the whole selected shape. Simultaneous-contact priority is not spatially predictable; avoid multi-station contacts.
- **HUD:** Bottom edge is a non-terrain action/deadline bar; ignore it spatially.

# Working memory

- **Level 6, 5/8 complete; fresh at raw step 219.** Selected color11 hollow-square perimeter (radius9, 72 cells) is centered at (15,48). Unselected color9 plus (radius12, 49 cells) is centered at (48,15). Central special object is a color1 8x8 corner-layer pattern at x/y=28..35. No paint stations.
- **Markers:** target9 at (12,6),(9,9),(30,9),(12,27); target11 at (45,30),(54,30),(45,57),(54,57).
- **Strong inference, not yet checked:** No single legal placement of either current geometry can cover its four same-color markers (exhaustively enumerated). Exactly two copies suffice for each: two pluses cover the vertical and horizontal target9 pairs; two squares cover the top and bottom target11 pairs. Therefore the central color1 device is probably a one-use-per-shape duplicator; its layered-square icon also supports this. Do not plan the final placements until its exact trigger/selection behavior is observed.
- **Current probe:** Move selected square R2,U2 from (15,48) to (21,42). Exact geometry enumeration shows the first three endpoints do not touch color1; at (21,42), its top/right perimeter first intersects device cells (28,33),(29,33),(30,34),(30,35). Hypothesis: first contact duplicates the square (likely with an animation and additional movable object) rather than blocking it. Stop immediately after this contact and analyze all frames/components/cycle order.
- Ruled out from prior levels: one-cell strides, marker obstacles, one-touch collection as the base objective, shape locking, blocked clipping. Never double RESET.
