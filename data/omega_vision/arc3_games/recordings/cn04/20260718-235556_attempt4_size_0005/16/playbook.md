# Working model

- **Checked through levels 1-2:** Gameplay uses a 3x3-pixel logical-cell lattice. ACTION1/2/3/4 move the selected piece one logical cell up/down/left/right. ACTION5 rotates it 90° clockwise, preserving its top-left anchor and swapping matrix dimensions. Movement/rotation affects only the selected individual piece, never a temporarily connected group.
- **Checked through levels 1-2:** Color-8 blocks are ports. When a moving color-8 port exactly overlays a stationary color-8 port, that block displays color 3; even one lone overlap does so (level 2 step 43). Moving away restores both underlying pieces/ports. Edge adjacency does not count. A level completes when the intended simultaneous arrangement matches all ports.
- **Checked on level 2:** Pieces may pass through/overwrite other bodies and ports while moving; vacated cells restore the stationary layer. Temporary color-3 connections do not lock pieces. Solve by placing each piece independently and then not disturbing it.
- **Checked on level 2:** ACTION6 on a body selects that piece. Its body becomes active color 0; the formerly selected body restores its own inactive color. Ports and existing matches remain unchanged. Some levels begin with a color-0 piece already selected; level 3 does not.
- **Checked:** The 32-cell color-4 strip at `(16..47,0)` is deadline HUD, not gameplay. It fills color 0 irregularly and resets per level. Never use HUD cells in expectations.

# Working memory

- Level 3 of 6, freshly loaded at step 45; background color12, HUD reset, and no body is currently color0/selected.
- A likely selectable color-14 piece at origin `(8,14)` has 13 body blocks plus two color-8 ports at relative `(4,0),(4,6)`, absolute `(20,14),(20,32)`. Logical matrix: `..GGR / ..G.. / GGG.. / G.... / GGG.. / ..G.. / ..GGR`.
- Two disconnected fixed color-4 components are on the right: top component has cells `(47,11)` and row `x=32..47,y=14`; bottom irregular component spans logical blocks in `x=29..47,y=29..47`.
- **Hypothesis to test, not yet assumed:** The movable two-port piece may bridge the two color-4 components by putting one port on each ordinary color-4 body. Translating it right 4 cells to origin `(20,14)` puts ports at `(32,14)` (top component) and `(32,32)` (bottom component), though one body block also overlaps bottom color4. No color-8 target ports exist, so level 3 may add port-to-body attachment or a different objective.
- Cheapest useful probe: ACTION6 on green body `(15,18)` should select it (14→0), then move right only 3 times to origin `(17,14)`. At that point the bottom port lands on color4 `(29,32)` while the top port remains color8 at `(29,14)`, and no body block overlaps color4. Stop there to see whether a port-on-body overlap displays color3 before attempting the fourth right.
