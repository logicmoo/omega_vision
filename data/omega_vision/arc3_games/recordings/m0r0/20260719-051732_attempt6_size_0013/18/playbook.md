# Working model

- **Confirmed objective (L1–L5):** two cyan pieces move synchronously; a level completes when both finish an input on the same tile and merge.
- ACTION1=up, ACTION2=down. Horizontal mapping varies: L1–L4 used ACTION3 outward/ACTION4 inward; L5 used ACTION3 inward/ACTION4 outward. Each piece is blocked independently; re-identify the mapping on each new level if needed.
- Gray 5 is floor; solid side-colored tiles are walls. Players landing on gray/azure 5+8 checkerboard hazards blink and soft-reset both players while timer use remains.
- **Movable markers:** ACTION6 selects maroon 9 (selected 11, players inactive blue1); arrows move the marker literally (A1 up/A2 down/A3 left/A4 right); ACTION6 on player/floor deselects. Walls, markers, and players block it.
- **Pressure plates:** while a player occupies a singleton non-structural color tile, all matching 3-tile doors are gray/passable; leaving restores the plate and doors. Player recoloring during marker mode is assumed not to stop plate occupancy, but L6 will directly check this.
- Timer is the advancing top/bottom border, about one cell per two actions.

# Working memory

- Level 6 (final), 5/6 complete, fresh board. Origin `(6,6)`, tile size4, 13×13. Players start left `(3,4)`, right `(9,4)`. Marker `(6,9)`. Hazard surrounds the outer boundary, divider `x=6` except marker opening at row9, and barrier row6 except doors.
- Tile map (`.` floor, `x` hazard, `c`=12, `e`=14): `xxxxxxxxxxxxx / x.....x.....x / x..c..x..e..x / x.....x.....x / x..P..x..P..x / x.....x.....x / xxeeexxxcccxx / x.....x.....x / x.....x.....x / x..e..9.....x / x.....x.....x / x.....x.....x / xxxxxxxxxxxxx`.
- Plates/doors: left upper plate12 `(3,2)` opens right row6 door `(8..10,6)`; right upper plate14 `(9,2)` and lower-left plate14 `(3,9)` open left row6 door `(2..4,6)`.
- **Unconfirmed but structurally necessary:** selected markers can move over checkerboard without resetting. A combined BFS allowing marker-on-hazard found a 43-action solution; no solution exists with the marker restricted to gray lower-floor positions. Immediate setup/probe: `U,U` puts both players on plates/opening both doors; select marker `(31,43)`; marker `U` should move from `(6,9)` onto hazard `(6,8)` while players remain blue on active plates.
- If that probe succeeds, BFS continuation: marker `U×5,L×3` to `(3,3)`, deselect; player `D×4` (left held on plate12 by marker, right enters its door); select marker and `D,D,R` to `(4,5)`, deselect; player `D×3`; use the L6 inward horizontal key six times so marker blocks left while right crosses to lower-left plate14; select marker, `D×5,L` to park `(3,10)`, deselect; player `D×4` merges at `(3,9)`. Determine which normal horizontal key is inward at the first such move with an expectation.