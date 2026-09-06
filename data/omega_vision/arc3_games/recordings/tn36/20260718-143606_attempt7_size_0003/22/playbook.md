# Working model

- **[Checked]** Seven levels; only `ACTION6(x,y)`. The top color-9 edge line is a per-attempt programming-click budget/HUD, not gameplay.
- **[Checked]** Route/transform a colored plug into its complementary socket. Six command columns execute left-to-right when the color-9 disk at `(57,58)` is clicked. Segment clicks toggle `1<->5`; an unsuccessful launch restores the plug to its last checkpoint/start and preserves the program bits.
- **[Checked codes]** For each column's six bits `(top horizontal, top vertical, middle horizontal, middle vertical, bottom horizontal, bottom vertical)`: NOP=`000000`; LEFT=`100000`; DOWN=`110000`; RIGHT=`010000`; UP=`100001`; SHRINK=`100100`; GROW=`000100`; ROTATE-clockwise=`101000`; RECOLOR-to-swatch=`111111` (0 means color 1, 1 means color 5).
- **[Checked]** SHRINK halves the plug's dimensions while preserving top-left (observed 8x8 -> 4x4); GROW reverses it. Repeated 4x4 -> 2x2 -> 1x1 is strongly inferred but not yet live-checked.
- **[Checked checkpoint mechanic]** A 4x4 half-plug-color checker is a safe endpoint: a program ending there leaves the plug there (including transformed state) instead of resetting. The checker reappears after departure. Level 6 used three checkpoints before its socket.
- **[Checked level-7 hazard]** The facing multicolor structures at tiles `(1,3)` and `(6,3)` form a horizontal laser, not ordinary clear terrain/portals. A full 4x4 plug entering `(2,3)` at step 123 was dissolved, energized colors 12/13 across the corridor, and reset. The beam occupies pixel rows `y=17,18`; it also energizes any occupied plug pixels outside those rows.
- **[Checked history]** Level 5 solution was `DOWN,DOWN,DOWN,ROTATE,RECOLOR,GROW`. Level 6 completed at step 112 after checkpointing at `(5,6)`, `(4,4)`, `(5,0)` and then entering its socket.

# Working memory

- Final level 7 remains `6/7` after failed launch step 123. Movable color-11 4x4 plug is reset at tile `(2,6)`; socket is `(2,1)` and wants its current orientation/size. Current program is `UP,UP,UP,UP,UP,NOP`.
- Full color-6 blockers: `(1,0),(2,0),(3,0),(1,1),(3,1),(0,3),(4,5),(4,6)`. Checkpoints: `(5,5),(5,1),(0,2)`. Laser spans row 3 from the facing structures.
- **Ruled out:** five direct UPs do reach the laser corridor geometrically but the full-size plug is destroyed at `(2,3)`; checkers are not merely decorative shortcuts here.
- **Strong inferred intended route (do not skip validation):** `(2,6)` -> checkpoint `(5,5)` with six moves; shrink twice while going up through the beam (a 1x1 top-left pixel at `y=16` avoids beam rows 17-18) -> checkpoint `(5,1)`; move to checkpoint `(0,2)`; grow twice and enter socket `(2,1)`. This exactly explains all three checkpoints and the six-command limit.
- **Next plan:** change current program to `UP,UP,RIGHT,RIGHT,RIGHT,DOWN` and launch. Predicted path `(2,6)->(2,5)->(2,4)->(3,4)->(4,4)->(5,4)->(5,5)` is clear and should checkpoint with destination cell `(53,25)=11`. After confirmation, use `SHRINK,UP,SHRINK,UP,UP,UP` (chosen to minimize reprogramming clicks while shrinking to 1x1 before the second UP/laser entry).
