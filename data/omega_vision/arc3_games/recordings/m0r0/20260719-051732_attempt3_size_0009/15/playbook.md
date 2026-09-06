# Working model

- **Confirmed objective (L1–L2):** Two cyan pieces move synchronously by one lattice tile. When both enter the same tile they merge and the level completes.
- **Confirmed controls:** ACTION1=up and ACTION2=down for both. ACTION3 is mirrored **outward** (left-origin piece left, right-origin piece right). ACTION4 is mirrored **inward** (left-origin right, right-origin left). A piece whose destination is a solid side-color wall stays independently. ACTION5/ACTION6 have not been needed.
- **Confirmed level variation:** Tile scale and wall colors vary (5×5 on L1; 4×4 on L2–L3). Gray (5) is ordinary floor.
- **Confirmed hazard from L2 step 31:** A gray+azure checkerboard tile is entered rather than blocking; if either piece lands on one, that piece blinks and then both pieces soft-reset to their level-start positions while the timer remains spent. Avoid every input that lands either piece on checkerboard. L2 was completed via a route using solid walls—not hazards—for desynchronization.
- **Timer:** Top and bottom edge bars advance from opposite ends roughly every two successful actions; they are HUD/deadline, not gameplay.

# Working memory

- Level 3, 2/6 complete, fresh board. Lattice origin `(6,10)`, tile size 4, 12 columns × 11 rows. Cyan starts: left tile `(4,9)`, bbox `(22,46)-(25,49)`; right tile `(8,9)`, bbox `(38,46)-(41,49)`.
- Floor/wall map (`.` gray, `#/?` wall, `9` a centered 2×2 maroon marker embedded in an otherwise-gray tile): `##.###?..... / #...#.9.###. / #9#.#.?##.#. / #.#.#.?..... / #.#...?.#### / #.####?.9... / ......?###.. / #####.?..#.# / ##....?..... / ##....?..... / ##....?.....`.
- Maroon markers are at tiles `(6,1)`, `(1,2)`, `(8,5)`. **Mechanic unknown.** Static BFS shows every marker is unavoidable for any collision route (forbidding any one makes collision unreachable), so they must be traversed and deliberately probed rather than assumed hazardous or ordinary.
- Assuming marker tiles can be entered without changing movement topology, a shortest collision route is `UOOUUUIIIUUOOOOUUUUUIIIIDIIDDDI` (31 inputs). Its first marker contact is the right piece entering `(8,5)` on input 8.
- Execute the confirmed safe prefix `UOOUUUI` now, ending at states `(3,8),(9,5)`, with the marker at `(8,5)` immediately inward of the right piece. Then take one ACTION4 probe with an explicit prediction after inspecting the prefix.
