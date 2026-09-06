# Working model

- **Checked:** The board is a 16×16 logical lattice of 4×4-pixel tiles. `ACTION1/2/3/4` are up/down/left/right; `ACTION5` grabs or releases.
- **Checked:** The player's color-0 edge indicates facing. Unladen directional input faces that way and translates if clear; collision turns in place. A faced adjacent cargo highlights `4→3`; `ACTION5` changes it to held ring 0. Carrying rigidly translates player+cargo without rotating their offset; release gives ring 3, later restoring to 4.
- **Checked:** Cargo, player, and agents are solid. Held cargo can overlay color-2 terrain/targets; full color-5 barriers are solid. True targets are color-2 interiors enclosed by color 9; unframed color-2 shapes are destinations for reverse agents. Completion occurs when all cargo is released in framed targets; surplus target cells may remain.
- **Checked (levels 2–5):** Color-12 helpers take one autonomous action after each player action when a complete route exists, grab free cargo (`4→5`), carry it rigidly to a feasible framed target, and use a separate release turn (`5→4`). They recompute from post-player occupancy and wait without a complete route.
- **Checked (levels 6–7):** Color 15 is a reverse helper carrying cargo (`ring 5`) to unframed color-2 targets. Facing it changes solid 15 to border 11/core 15, and `ACTION5` removes it permanently, but selection does not freeze a mobile agent. First make it unable to complete a route, then select and delete on consecutive actions. Deleting a loaded agent drops held cargo as free ring 4.
- **Checked:** An agent regards cargo already on its own target as deposited and does not move it (level 6 reverse agent ignored cargo initially on its unframed target). **Still assumed:** an agent may regard cargo on the opposite type of target as available; no prior combined helper/reverse-agent level has tested this.
- **Checked:** The changing bottom raw-pixel edge is a deadline bar; its conversion rate varies by level and is not always one pixel/action.

# Working memory

- **Level 8/9 began at step 412 (7 completed), no action yet in the new level.** Player `(1,8)` faces up in a middle strip. Top chamber connects through wall-row-6 gaps `x=4,5`; bottom chamber through wall-row-9 gaps `x=9,10`.
- Top: helper12 `(7,1)`, reverse15 `(8,4)`; cargo at `(1,2),(2,2),(7,2),(9,2),(1,3),(2,3),(6,3),(8,3)` (8 total). Framed target is `x=11..14,y=2..3` (8 cells). The visible unframed cells plus the four cargo at `(1..2,2..3)` form an assumed full 3×3 target `x=1..3,y=2..4`.
- Bottom: helper12 `(9,11)`, reverse15 `(8,14)`; cargo `(6,11),(9,12),(7,13),(8,13),(10,13)` (5). Framed target is `x=12..14,y=12..14` (9 cells); unframed target is `x=3..5,y=12..14` (9 cells).
- **Next deliberate probe:** move right toward the nearer/top chamber. Each of the four agents has exactly one adjacent cargo, so predict all four grab in parallel: top helper `(7,2)`, top reverse `(8,3)`, bottom helper `(9,12)`, bottom reverse `(8,13)` all change ring `4→5`. This tests combined-level scheduling while advancing the route.
- Strategic aim remains tentative: observe exact races/routes, then immobilize and delete both reverse agents while allowing helpers to fill framed targets. Do not commit beyond the probe until checking whether helpers consider cargo on unframed targets available.
