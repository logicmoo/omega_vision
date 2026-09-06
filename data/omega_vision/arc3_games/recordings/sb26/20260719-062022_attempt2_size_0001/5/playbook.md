# Working model

- **Checked through level 1:** Top hollow colored symbols give the target sequence. Bottom solid 4×4 blocks are movable sources. Color-2 2×2 markers in the middle are empty destination centers.
- **Checked:** ACTION6 on a source adds a 1-cell color-0 selection outline. ACTION6 on a gray destination then moves that source into a 4×4 block centered on the marker, leaves a 2×2 color-2 vacancy at the source, and clears selection. A source click alone does not move anything.
- **Checked (level 1 completion):** Filling the four middle slots left-to-right with the top sequence `9,14,11,15` and then using ACTION5 completed the level. Filling the last slot did not auto-complete, so ACTION5 is submit.
- **Checked:** Each completed placement changes one cell of the y=53 border bar from color 2 to 3, advancing right-to-left (x=63,62,...). Selection does not advance it. This is a placement budget/HUD, not a destination.
- **Assumed:** ACTION7 undoes. Use it rather than RESET if a placement is wrong.
- **Strong extension from level 1, not yet submission-tested on multiple rows:** When there are multiple destination rows, map the target to gray markers in reading order (top-to-bottom, left-to-right), skipping colored obstacles/non-gray structures.

# Working memory

- Level 2/8, fresh board after step 9; level count is 1.
- Top target: `12,15,8,9,14,11,6`.
- Bottom sources (center coordinates): `8:(10,58), 15:(17,58), 14:(24,58), 12:(31,58), 6:(38,58), 9:(45,58), 11:(52,58)`.
- Seven gray destinations in assumed reading order: `(22,22),(28,22),(40,22),(22,36),(28,36),(34,36),(40,36)`. The color-14 structure occupying the would-be upper `(34,22)` position is an obstacle/non-destination.
- Current short commit: fill the three upper gray markers left-to-right with target prefix `12,15,8`. This follows the level-1-checked left-to-right rule without yet relying on the row transition. Then reassess before filling the lower row `9,14,11,6` and submitting.
- Budget bar is fresh (64 color-2 cells), ample for seven placements.
