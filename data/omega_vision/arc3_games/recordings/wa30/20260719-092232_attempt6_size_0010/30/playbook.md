# Working model

- **Checked:** The board is a 16×16 logical lattice of 4×4-pixel tiles. `ACTION1/2/3/4` are up/down/left/right; `ACTION5` grabs or releases.
- **Checked:** The player's color-0 edge indicates facing. Unladen directional input faces that way and translates if clear; against cargo/agents it turns in place. Adjacent faced cargo highlights ring `4→3`.
- **Checked:** Player grab changes cargo ring to 0; carrying rigidly translates player+cargo without rotating their offset. Player release gives ring 3, later restoring to 4. Cargo may be grabbed from any side.
- **Checked:** Cargo, player, and helpers are solid. Held cargo can overlay targets and patterned color-2 tiles; full color-5 barriers are solid. Releasing every cargo into a target completes a level; surplus targets may remain.
- **Checked (levels 2–5):** A color-12 helper takes one autonomous action per player action when it has a route, grabs free cargo (`4→5`), rigidly carries it to an open target, and spends a separate release turn (`5→4`). Player deposits are ignored thereafter.
- **Checked (step 238):** Player update precedes helper job selection: the player won a simultaneous grab race.
- **Checked (steps 244–251):** Helpers require a complete current path, not merely a locally clear next move. The vertical helper pair waited seven turns at `(13,12)/(13,13)` while the player's horizontal pair sealed the two-row passage, then resumed exactly when player/cargo reached `(3,8)/(4,8)` and a route around them opened. Avoid head-on chokepoints; moving away can unblock helpers.
- **Checked:** Bottom deadline bar changes about one pixel per two actions on level 5. Current evidence implies roughly 128 actions to fill, despite an earlier overly-tight 96-action estimate.

# Working memory

- Level 5/9 (4 completed). Passage is rows `y=7..8`. Targets are `x=2..3,y=6..9`. Deposits: `(3,7),(3,9),(2,7)`. Free top cargo `(12,1),(14,2)`. One helper holds the last bottom cargo.
- **Current after step 255:** player `(1,7)`, facing/adjacent state unimportant; deposit `(2,7)` has ring 3. Helper `(10,10)` holds cargo `(10,11)` south (ring 5), now past the chokepoint. Timer 27/64 after about 52 level actions.
- **Confirmed shortest coordination next:** helper can finish bottom cargo at `(3,6)` in 12 moves + release: `UUULLLLLUULLG` from current. Player must yield the two-lane passage. A time-expanded BFS found a 24-action collision-free route to west of top cargo `(14,2)`: `UUUDDRRRD[R-blocked]RRRRRRUUUUURRR`; at the bracketed right input player stays `(4,7)` because helper cargo occupies `(5,7)`, while helper shifts up. This is one action shorter than the earlier hand detour.
- **Immediate phase (+13):** execute `UUUDDRRRDRRRR`; player ends `(7,7)`, helper ends `(3,5)` after releasing cargo at `(3,6)`. Then continue `RRRUUUUURRR,G` to take `(14,2)`, provided helper's observed top route matches prediction.
- **Provisional allocation:** player takes `(14,2)`, helper takes `(12,1)`. Helper should start from `(3,5)` toward `(12,1)`, likely approaching from below because of its horizontal-first tie. Player can potentially force the useful west-side grab by occupying `(12,2)` when helper tries to enter it; recompute exact timing after bottom release rather than relying on the obsolete pre-delay schedule.