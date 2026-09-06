# Working model

- **[Checked]** Six levels. Controls: ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right; ACTION6 clicks a board coordinate.
- **[Checked]** A blue/cyan split cursor moves over gray track. Its dark half points in the commanded direction. A blocked command reorients it without moving; a valid move shifts by the cursor's current width/height (4 cells at size 4, 2 cells at size 2).
- **[Checked]** The framed cyan block at a track end is the goal. After resizing to fit the narrow stem, moving the cursor into cyan goal cells completed level 1.
- **[Checked]** The lower-left colored-pip panel is a hint/help target, not separate directional buttons. Clicking it animates the corresponding black holes of the lower-right 3x3 green. Clicking irrelevant gameplay objects gives a color-8 error flash.
- **[Checked on L1; carry cautiously]** The lower-right 3x3 is a resize puzzle. Clicking each black 3x3 slot turns it green; when all holes were filled, the grid settled gray and the 4x4 cursor shrank to 2x2, automatically aligning with the narrow track while preserving orientation. Fill only initially black slots indicated by the hint; already-gray slots need no click.
- **[Checked HUD]** x=62..63 is a decreasing action/time budget and resets each level. Minimize probes and use larger-cursor moves before shrinking when safe.

# Working memory

- Level 2, 1/6 complete, fresh full budget. Main route is vertical. A 4x4 cursor at x=31..34,y=35..38 faces up; cyan goal is at top x=31..34,y=11..14. One safe 4-cell up move reaches y=31..34. Above it, a yellow-bordered gate has only a 2-wide gray center x=32..33, so resize before crossing.
- Lower-right 3x3 centers (x=25,30,35; y=50,55,60) have black holes at (25,50), (30,50), (30,55); all other slots are gray. Plan: take the one safe 4x4 up move, then click those three holes. Inspect the post-resize 2x2 anchor before committing the vertical route.
- Purple/color-11 pixels embedded around the upper track and yellow/color-4 gate are treated as non-gray barriers until evidence says otherwise.
