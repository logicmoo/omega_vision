# Working model

- **Checked through levels 1-2:** Color-5 patterned shapes are sources; each produces a solid color-4 reflection across a color-10 mirror line. Logical cells are 3x3 pixels and one arrow action moves the selected entity by one logical cell. The goal condition requires exact full-footprint alignment with matching color-11 silhouettes; partial overlaps do not complete.
- **Checked:** Black color-0 centers mark the selected controllable entity. ACTION5 transfers/cycles selection between a mirror line and source shapes. Selected source tile centers are black; unselected source centers are background color 9. Selected mirror centers are periodically black; unselected mirror center slots are background 9.
- **Checked controls:** ACTION1 is inferred up from the verified inverse pair; ACTION2=down, ACTION3=left, ACTION4=right, ACTION5=next selection, ACTION7=undo. Undo restores gameplay geometry but does not refund the timer cell. ACTION6 remains untested.
- **Checked reflection dynamics:** Moving a source by `(dx,dy)` moves its reflection according to the mirror: for a vertical mirror, `(-dx,+dy)`; for a horizontal mirror, `(+dx,-dy)`. Moving the mirror by one cell moves reflections by two cells in that same axis while sources stay fixed. Level 2 directly verified the vertical-mirror case; level 1 verified source movement.
- **Checked HUD:** y=63 color 5 and x=63 color 11/5 are HUD. Each ordinary move or selection consumes one right-edge timer cell from the top; ACTION7 itself does not add/refund one. Roughly 64 actions are available per level.
- **Hold loosely:** Levels can change mirror orientation and include multiple sources and paired goals. Recompute normalized footprints, source/goal assignments, and a common mirror axis rather than assuming one target.

# Working memory

- Level 3/8 started at step 29 with a selected horizontal mirror at y=48..50 (axis y=49). No color-4 reflections are visible because they initially fall below the playfield.
- Source A (7-tile L, unselected) bbox x=12..23,y=21..32. Same-orientation goal A is x=33..44,y=42..53; its vertically flipped matching goal is x=33..44,y=3..14.
- Source B (6-tile bar/middle, unselected) bbox x=45..56,y=27..32. Same-orientation goal B is x=9..20,y=42..47; its vertically flipped matching goal is x=9..20,y=9..14.
- **Strongly supported objective model:** Each source must occupy its same-orientation lower goal while its reflection simultaneously occupies the vertically flipped upper goal. Both goal pairs imply the same final horizontal mirror axis y=28. Thus mirror must move up 21 pixels = 7x ACTION1. Then A needs +7 right/+7 down; B needs -12 left/+5 down. Total expected solution from fresh level is 40 actions including two ACTION5 selections, within budget.
- Next deliberate probe: one ACTION1 on selected mirror. Predict mirror y=45..47 with centers y=46, sources fixed, and first clipped color-4 reflections appearing at y=60..62 (A across x12..23; B across x48..53). If confirmed, commit the remaining six mirror-up moves, then test ACTION5 cycle identity before moving a source.
