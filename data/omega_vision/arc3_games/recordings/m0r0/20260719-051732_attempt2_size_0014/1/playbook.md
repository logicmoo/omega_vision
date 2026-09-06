# Working model

- **Confirmed on level 1 (steps 1–19):** Two cyan pieces move synchronously by one lattice tile. Each piece moves only if its own destination is traversable gray (5); a blocked piece stays independently. Entering the same tile merges the pieces and immediately completes the level (step 19 had one merged cyan square in the intermediate frame, then loaded level 2).
- **Confirmed controls:** ACTION1 moves both pieces up. ACTION3 is mirrored **outward**: the left-origin piece moves left while the right-origin piece moves right. ACTION4 is mirrored **inward**: left-origin moves right while right-origin moves left. **Likely but not yet directly checked:** ACTION2 moves both down. ACTION5/ACTION6 have not been needed.
- **Confirmed:** Solid side colors are walls. Tile size and side colors can change by level (5×5 with walls 11/12 on L1; 4×4 with walls 6/15 on L2).
- **Strongly inferred on L2:** Gray+azure checkerboard tiles are hazards/blocked terrain, not floor. Their barrier arrangement has deliberate solid-gray openings and a safe meeting route; do not enter them without contrary evidence.
- **Timer:** Top and bottom edge bars advance from opposite ends every two actions; they are HUD/deadline, not gameplay. Shortest routes are well within the observed budget.

# Working memory

- Level 2, 1/6 complete, fresh board after L1 collision. Lattice origin `(x,y)=(6,6)`, tile size 4, dimensions 13×13. Cyan bboxes `(22,10)-(25,13)` and `(38,10)-(41,13)`, tile states `(4,1)` and `(8,1)`.
- Tile categories by row (`.`=solid gray/passable, `X`=checker hazard, `#/?`=wall): `......#...... / ......#...... / ......#...... / ..####?####.. / ..#.##?####.. / .....X?...... / .....X?...... / .....X?...... / XXX.XX?.XXXXX / ......?...... / ............. / ............. / XXXXXXXXXXXXX`.
- Treating only solid gray as passable, BFS under mirrored controls gives a 20-input collision route: `DOOODDDDDIIDDIIDDDDI`, ending with both at tile `(6,11)`. (`D`=ACTION2 if confirmed, `O`=ACTION3, `I`=ACTION4.)
- Next step is a single route-aligned ACTION2 probe. Predicted down move: both pieces shift 4 cells to tile row 2, bboxes y14–17. If confirmed, commit the remaining suffix `OOODDDDDIIDDIIDDDDI` with computed expectations.
- Ruled out on L1: one-pixel/sliding movement, all-or-nothing blocking, and absolute shared horizontal controls.
