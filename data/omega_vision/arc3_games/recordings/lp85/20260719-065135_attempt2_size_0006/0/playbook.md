# Working model

- **[Checked through level 1]** Only `ACTION6(x,y)` is used. Colored arrow-shaped buttons rotate the adjacent closed track by one slot. On a clockwise-enumerated rectangular track, clicking its left arrow shifted every tile one index counterclockwise; the symmetric right arrow is expected to shift one index clockwise.
- **[Checked, level 1 completion]** The objective is to put every color-11 tile into a slot marked by four color-11 corner pixels. Level 1 completed exactly when its sole color-11 tile reached its sole marked slot. Markers remain fixed while tracks rotate.
- **[Checked]** The full-height strip at `x=0` is the action budget: each non-completing click changes five more cells from color 14 to 5. It resets on a new level, giving roughly 12–13 actions. Ignore it for gameplay.
- **[Checked after level 1]** The eight short marks at the top are level progress: one is now color 14 and seven remain color 5, matching 1/8 complete.
- **[Strong structural hypothesis for level 2]** Tracks may intersect and share slots. Rotating one track permutes all tiles on that track, including shared intersections; this allows a target tile to transfer between tracks. Re-verify this with the first level-2 action before committing.

# Working memory

- Level 2, 1/8 complete, fresh board at step 5. Tile/slot scale is now 2x2. There are two color-11 tiles at `(32,17)` and `(23,38)`, and marked target slots at `(35,26)` and `(35,35)`.
- Inferred tracks:
  - `O`: 26-slot outer rectangle, clockwise from `(23,17)` across its top to `(35,17)`, down the right edge to `(35,44)`, left across the bottom to `(23,44)`, then up the left edge. Top arrows centered near `(20,18)` / `(39,18)` rotate it.
  - `M`: 10-slot row `x=17..44 step 3, y=26`, controlled at `(14,27)` / `(48,27)`.
  - `B`: 10-slot row `x=17..44 step 3, y=35`, controlled at `(14,36)` / `(48,36)`.
  - `M` and `B` share their `x=23,35` slots with `O`.
- A BFS over the two color-11 token positions under these three ±1 cyclic permutations found a unique 8-action optimum: `O+ B+ O+ O+ O+ B+ B+ B+`, where `+` is clockwise on `O` and rightward on `B`. No middle-row action is needed. Intended token route: first `O+` puts tokens at `(35,17)` and `(23,35)`; one `B+` stores the latter at `(26,35)`; three more `O+` put the former at upper target `(35,26)`; three more `B+` put the stored token at lower target `(35,35)`.
- Next deliberate probe: click top-right arrow `(39,18)`. Prediction: outer track advances clockwise, moving color 11 from `(32,17)→(35,17)` and `(23,38)→(23,35)`. If exact, commit the remaining seven optimal actions.
- Ruled out: the level-1 side objects were not static start/goal blobs; the left one rotated its ring, and matching marker/tile completed the level.
