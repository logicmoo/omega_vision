# Working model

- **Checked:** The board is a 16×16 logical lattice of 4×4-pixel tiles. `ACTION1/2/3/4` are up/down/left/right; `ACTION5` grabs or releases.
- **Checked:** The player's color-0 edge indicates facing. Unladen directional input faces that way and translates if clear; against cargo it turns in place. Adjacent faced cargo highlights ring `4→3` on that side.
- **Checked:** Grabbing changes cargo outer ring to 0. While carrying, directional movement rigidly translates player+cargo without rotating their offset. Release gives ring 3; moving/facing away restores ring 4. Cargo may be grabbed from any side.
- **Checked:** Cargo and agents are solid. Held cargo can overlay targets and the repeating patterned color-2 wall tile; underlying tiles restore when vacated. Full color-5 tiles have behaved as solid compartment barriers (cargo overlay not tested). Releasing every cargo into target slots completes a level.
- **Checked (levels 2–4):** A color-12 helper normally takes one autonomous action per player action, pathfinds around solids, grabs free cargo (`4→5`), rigidly carries it to a nearest open target, and spends a separate release turn (`5→4`). It recognizes player-released wall cargo and ignores deposits. Path tie choices are obstacle-aware and not always axis-first.
- **Checked (level 4):** With multiple helpers, grabs skip helpers later in upper-to-lower processing order; releases do not appear to. Player/helper are mutually solid, and blocked/rerouted turns still consume deadline.
- **Checked:** Bottom row is a hard deadline bar consuming right-to-left `7→4` pixels, roughly 64 pixels per ~96 actions in recent levels.

# Working memory

- Level 5 of 9 began after step 203. One helper `(5,7)` and eight targets `x=2..3,y=6..9` lie left of a full-color-5 barrier. The only central passage is the two-row corridor `y=7..8` through `x=6..9`. Player `(11,9)` faces up on the right.
- Six cargo: doorway `(11,7)`, top `(12,1),(14,2)`, bottom `(13,12),(15,13),(11,14)`. **Strong intended allocation:** helper takes doorway + two top cargo while player directly delivers the three bottom cargo in parallel. Grabbing doorway cargo ourselves would create a head-on two-lane bottleneck, so let helper take it.
- **Computed under checked movement and predicted helper target use:** Treating helper deposits as `(3,7),(3,6),(2,6)`, a macro BFS gives a 90-action minimum player route for the three bottom cargo, targeting `(3,9),(2,7),(3,8)`:
  `DDDDG UUUUUU LLLLLL D LL G | RRRRRRR DDDD RR G UUUU LLLLLLLLLLL U G | D RRRRRRRRR DDDDD RRRR G UUUUU LLLLLLLLLLLLL G`
  (exact machine string: `DDDDGUUUUUULLLLLLDLLGRRRRRRRDDDDRRGUUUULLLLLLLLLLLUGDRRRRRRRRRDDDDDRRRRGUUUUULLLLLLLLLLLLG`, length 90). This is tight but should leave ~4 timer pixels; do not add exploratory detours.
- Helper-target reservations are still a prediction, not checked on this level. First batch is only `down×4, grab` on bottom cargo `(11,14)`. Predicted simultaneous helper path `(5,7)→(10,7)`, adjacent to doorway cargo but not yet grabbed. Next, if confirmed, carry up ×6, left ×6, down, left ×2, release first player cargo at `(3,9)`.
