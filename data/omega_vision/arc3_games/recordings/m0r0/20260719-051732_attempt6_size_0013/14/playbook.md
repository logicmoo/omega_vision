# Working model

- **Confirmed objective (L1–L4):** two cyan pieces move synchronously by one lattice tile; a level completes when both finish an input on the same tile and merge.
- **Confirmed normal controls:** ACTION1=up, ACTION2=down. Horizontal mapping varies: L1–L4 used ACTION3 outward/ACTION4 inward; **L5 uses ACTION3 inward/ACTION4 outward**. Each piece is blocked independently. Re-identify horizontal mapping on new levels if contradicted.
- Gray 5 is floor; solid side-colored tiles are walls. Gray/azure 5+8 checkerboard is a confirmed soft-reset hazard for players.
- **Movable markers (confirmed L3–L4):** ACTION6 selects maroon 9 (selected 11, players inactive 1); arrows move it literally; ACTION6 on player/floor deselects. ACTION5 did nothing.
- **Pressure plates (confirmed L5):** a singleton non-structural color tile is a plate. A player standing on it makes every matching 3-tile door gray/passable; leaving restores both the plate and all matching doors immediately. This was retrodicted exactly: plate15 `(3,12)` toggled 96 cells of two doors; plate14 `(8,6)` toggled its 48-cell door only while occupied; plate12 `(14,6)` likewise. Do not treat them as permanently consumed keys. Singleton structural color6 `(3,11)` is an ordinary wall.
- Timer is the advancing top/bottom border, about one cell per two actions.

# Working memory

- Level 5, 4/6 complete. Origin `(2,2)`, tile size 4, 15×15. L5 horizontal inputs: `I`=ACTION3, `O`=ACTION4. Current players after the falsified permanent-key plan are left `(5,6)`, right `(12,6)`; no plate is occupied, so all doors are closed. Timer has about 12 cells spent.
- Structural layout: divider `x=7` blocks rows 5–14; upper area rows1–4 connects both sides. Plates/doors: 14 plate `(8,6)` → left upper door `(3..5,5)`; 12 plate `(14,6)` → left lower `(2..4,9)` (left has already passed above this); 15 plates `(3,12),(3,1)` → right doors `(10..12,9)` and `(10..12,5)` (right has passed the lower but not upper).
- A pressure-state BFS found a safe 30-action recovery that never releases a plate while the other player occupies its door: `D, O×5, U, I×5` puts right on plate14 while left reaches `(5,6)`; `U×5` sends left through and above door14; `I, O×3` puts left on top plate15 while right remains below its upper door; `U×5` sends right fully through; `I×4` merges at `(7,1)`. Exact states are expectation-guarded in the next plan.
- Ruled out: permanent key consumption. The prior mismatch happened because plate14 and plate12 doors reclosed as soon as right stepped off their plates.