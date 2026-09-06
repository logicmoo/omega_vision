# Working model

- **Checked (step 0):** Board is 64x64; level count is 0/9, state NOT_FINISHED, and only ACTION1-ACTION4 are available.
- **Checked:** The playfield is an 11x11 coarse lattice of 3x3 patches, centered at `(16+3*i, 16+3*j)`. Color 5 is the surrounding/wall field. The non-wall lattice cells form a maze of alternating color-0 node patches and color-2 connector patches. Start sprite occupies lattice `(0,0)` / pixels x15..17,y15..17; its eight color-9 cells surround a color-4 facing pip at `(17,16)` (east). Color-14 3x3 goal is lattice `(10,10)` / pixels x45..47,y45..47.
- **Checked:** Treating colors 0 and 2 as traversable yields a route from start to goal; treating either alone as traversable does not. The node-to-node maze route found by BFS is `R D D R U R D D L L D R R D R U R D` (18 logical edges), equivalently 36 adjacent 3x3-patch steps if movement enters each connector and node separately.
- **Assumed, testing now:** ACTION1/2/3/4 are Up/Down/Left/Right. A directional action moves the sprite one 3x3 patch when that next patch is non-wall, preserving its facing pip on the movement side. Reaching color 14 completes the level.
- **Likely HUD, not gameplay:** Color 6 fills bottom row y=63 and may be a step/deadline bar. Initial length is 64; track its per-action decay.

# Working memory

- Level 1, fresh attempt, player at coarse `(0,0)` (pixel center `(16,16)`), facing east. Goal coarse `(10,10)`.
- Deliberate first probe: ACTION4, predicted Right, entering the color-2 connector at coarse `(1,0)` (center `(19,16)`); sprite should shift +3 px and old patch restore to color 0. This distinguishes one-patch movement from node-jumping and tests the action mapping.
- If confirmed, follow the computed adjacent-patch route (remaining directions each duplicated appropriately): `R, D,D,D,D, R,R, U,U, R,R, D,D,D,D, L,L,L,L, D,D, R,R,R,R, D,D, R,R, U,U, R,R, D,D`.
- Ruled out from initial geometry: a model in which only color 0 or only color 2 is traversable (start-goal disconnected).
