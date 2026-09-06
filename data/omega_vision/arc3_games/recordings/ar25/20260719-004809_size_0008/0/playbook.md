# Working model

- **Checked (step 0):** The 63x63 playfield has color-9 background, a 3-cell-wide vertical divider at x=30..32, and edge strips at y=63 (color 5) and x=63 (color 11; these may be HUD/budget bars rather than walls).
- **Checked (step 0):** A marked color-5 V-pentomino occupies macro-cells `(6,5),(7,5),(8,5),(8,6),(8,7)` (pixel bbox x=18..26,y=15..23); each occupied 3x3 tile has a color-0 center.
- **Checked (step 0):** A solid color-4 V-pentomino at x=36..44,y=15..23 is the exact horizontal reflection of the marked piece across x=31. A solid color-11 goal at x=51..59,y=45..53 has the same orientation/shape as the reflected color-4 piece.
- **Assumed, high-confidence visual hypothesis (not action-tested):** The marked left piece is controlled and the color-4 piece is its horizontally mirrored counterpart; directional moves translate both by one 3-pixel macro-cell, with opposite horizontal motion and equal vertical motion. Objective is likely to overlap the color-4 counterpart with the color-11 goal. If so, shortest displacement is 5 left + 10 down from the start (order arbitrary).
- **Assumed control convention (not tested):** ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right; ACTION5 is interact/other, ACTION6 click, ACTION7 undo.

# Working memory

- Level 1/8, fresh attempt at step 0. Marked piece bbox x=18..26,y=15..23; reflected piece x=36..44,y=15..23; goal x=51..59,y=45..53.
- Next deliberate probe: ACTION3. Prediction under the mirror-motion model: marked piece shifts left to x=15..23 and color-4 counterpart shifts right to x=39..47, both staying at y=15..23. This is also one shortest-path move toward the goal.
- No controls or dynamic mechanics have yet been action-tested.
