# Working model

- **[Checked]** Six levels. Controls: ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right; ACTION6 clicks a board coordinate.
- **[Checked]** The blue/cyan split cursor moves only over a fully fitting gray track region. Its dark half points in the commanded direction; a blocked directional command leaves its position unchanged but reorients it. At size 4x4, horizontal moves shift 4 cells.
- **[Checked]** The lower-left purple panel is a hint/help target, not four distinct controls. Clicking anywhere on its purple pads animates the black cardinal holes of the lower-right 3x3 green. Clicking irrelevant top objects gives a whole-grid color-8 error flash.
- **[Checked]** The lower-right 3x3 is an interactive resize puzzle. Clicking a black 3x3 slot persistently turns it green. Filling all four black cardinal slots caused the whole 3x3 to settle gray and shrank the movable cursor from 4x4 to 2x2 while preserving its orientation. This lets it enter the 2-cell-high gray stem. Later levels may use analogous fill/resize stages.
- **[Strongly supported]** The framed cyan block at the far end of the gray track is the destination; navigate the resized cursor into it. Goal entry is likely allowed even though destination cells are cyan rather than gray.
- **[Checked HUD]** x=62..63 is a decreasing action/time budget, not a goal. It is currently about half spent; avoid unnecessary probes.

# Working memory

- Level 1, 0/6 complete. After filling the four lower-right holes, the cursor is now 2x2 at x=23..24,y=19..20, oriented down (cyan top row, dark bottom row). The narrow gray stem continues left through 2x2 cells x=21..22, 19..20, 17..18; cyan goal interior is at x=13..16.
- Next plan: ACTION3 left through the three verified gray 2x2 cells, then one more left into goal cells x=15..16; predict level 1 completion.
- Ruled out for level 1: reaching the 4x4 track endpoint alone; all endpoint orientations; abstract N-W-E-S sequence; clicking top objects; trying to enter a track narrower than the cursor before resizing.
