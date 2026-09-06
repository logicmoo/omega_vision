# Working model

- **Checked through level 3 and reinforced by level-4 failure:** A level completes only when every 3x3 color-4 marker center is simultaneously covered by shape geometry of the required visible color. Same-color shapes may cover their shared markers collectively. Merely placing a differently colored shape on every marker is insufficient: level 4 did not complete with all six centers geometrically covered by colors6/10 instead of 12/14.
- **Checked controls:** ACTION1 up 3, ACTION2 down 3, ACTION3 left 3, ACTION4 right 3. ACTION5 cycles shapes in generation order, restores the old reference point's transported underlay, and blackens the new shape's reference point.
- **Checked movement/layers:** Shapes translate rigidly in 3-cell strides, may overlap frames/other shapes, and restore underlays when uncovered. Rendering has persistent object z-order rather than always putting the selected shape on top; a higher X hid the selected plus's black anchor at level-4 cell (15,30). Thus a selected anchor can be invisible. Edge clipping is allowed.
- **Checked anchor nuance:** Do not infer a moved anchor's restoration solely from its initial center pixel; retrodict the transported pattern. Level 3's X initially showed its color at center but later restored background5 there.
- **Checked completion:** A successful final translation immediately replaces the settled board with the next level. Omit old-board cell expectations on such an action and use `expect_levels`.
- **HUD:** Bottom row color15 is a non-terrain action/deadline bar, filling right-to-left on many but not all actions and resetting each level.
- **Level-4 paint-station hypothesis (not yet checked):** Six 4x4 colored interiors inside color2 frames are not a passive compatibility legend. Since correct geometry with wrong colors failed, they are most likely paint stations that recolor a touching selected shape. Interiors: top colors10,12,13 at x=5..8,29..32,53..56/y=5..8; bottom colors11,6,14 at the same x ranges/y=55..58. Whether any shape pixel or specifically the anchor must enter is unresolved; test useful desired-color contact first.

# Working memory

- **Level 4, 3/8 complete; HUD 8/64.** Markers: color12 at (15,18),(27,30),(15,43); color14 at (48,21),(33,24),(30,39).
- **Geometry is solved but colors are wrong:** plus radius13 is at unique center (15,30), covering all color12 markers while still color6. X radius10 is selected at unique center/anchor (39,30), covering all color14 markers while still color10. Board visibly shows marker cells as 6 and 10; level did not complete, falsifying the passive compatibility-key model.
- Required correction is strongly inferred to be repainting plus 6->12 and X 10->14, then returning each to these same target centers. No reset/undo is available or needed.
- **Current deliberate probe:** From selected X (39,30), move D5,R2 to center (45,45). This is a useful monotone route toward the color14 station. No X pixel touches its frame through D5; at R1 one endpoint touches only color2 border (52,55); at R2 endpoint (55,55) first enters the color14 interior. Predict any-pixel contact recolors the whole X to14, checked at remote X cell (35,35).
- If contact recolors: return X L2,U5 to (39,30), switch to plus, and similarly seek first contact with color12. If it does not: continue toward reachable anchor cell (54,57), R3,D4, and probe anchor-entry recoloring there.
- Ruled out from earlier levels: one-cell strides, solid marker obstacles, one-touch collection, automatic per-shape locking, and blocked clipping. Never double RESET.
