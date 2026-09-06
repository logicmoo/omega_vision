# Working model

- **Checked through level 2:** ACTION1/2/3/4 are up/down/left/right. The controlled color-14 shell/core moves one logical tile = 3 board cells per arrow and restores exact static terrain under its old footprint. Color 1 is floor; color 2 and color 15 block direct movement.
- **Checked through level 2:** For multiple green pieces, core 0 is selected; ACTION6 on another piece's core selects it (all its core cells become 0, old selected core becomes 4). Initial inactive cores may be 5. Shell clicks are inert.
- **Checked through level 2:** Color-4 outlined frames are goals. Their interiors match piece bounding dimensions. A level completes automatically when every piece is in a matching frame; placements do not individually lock.
- **Checked through level 2:** Pushing an inactive piece from an adjacent occupied edge launches it exactly five logical tiles (15 board cells) in the push direction while the selected pusher stays put; launched pieces can phase through color-15. This worked for 3x3, 3x6, and 6x6 pieces and preserved inactive core state.
- **Checked level 2:** Larger selected green pieces still move one logical tile per arrow. A pusher may contact any overlapping portion of a larger piece; exact full-width alignment is unnecessary.
- **HUD:** color-4 row y=63 is a time/action budget, resetting each level and decreasing irregularly. Avoid no-ops. Near goals, vacated cells restore the underlying frame color4, not generic floor1.

# Working memory

- Level 3 of 7, fresh at step 75; budget 64. One open floor room x=5..58,y=5..58. Selected 3x3 green pusher is centered at (45,15).
- Two passive color-11 plus pentominoes (each five logical 3x3 tiles, bbox9x9): A centered (54,24), bbox50..58,20..28; B centered (24,39), bbox20..28,35..43. Two 11x11 color-4 frames have 9x9 interiors centered (24,24) and (39,39). Small 5x5 frame has 3x3 interior centered (36,30), for the green pusher.
- **Strong but untested level-3 extension:** colliding with a passive color-11 plus should launch it five tiles just like inactive green pieces. Sparse plus corners make apparently wall-trapped A pushable: stand at (57,21), immediately right of A's top arm centered (54,21), then press left.
- Efficient proposed assignment if passive launch confirms: launch A left twice, center 54,24 ->39,24 ->24,24 (first large goal). Then approach B's top arm from its left at (21,36) and launch right, center24,39 ->39,39 (second goal). Finally move green to small goal (36,30). This is shorter than sending A left then down.
- Current probe plan: from green (45,15), move right4/down2 to (57,21), then ACTION3. Predict A shifts exactly15 left to bbox35..43,y20..28 and green remains (57,21). Inspect before committing the second launch.
