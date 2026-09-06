# Working model

- **Checked:** The board is a 16×16 logical lattice of 4×4-pixel tiles. `ACTION1/2/3/4` are up/down/left/right; `ACTION5` grabs or releases.
- **Checked:** The player's color-0 edge indicates facing. Unladen directional input faces that way and translates if clear; against cargo it turns in place. Adjacent faced cargo highlights ring `4→3` on that side.
- **Checked:** Grabbing changes cargo outer ring to 0. While carrying, directional movement rigidly translates player+cargo without rotating their offset. Release gives ring 3; moving/facing away restores ring 4. Cargo may be grabbed from any side.
- **Checked:** Cargo and agents are solid. Held cargo can overlay targets and the repeating patterned color-2 wall tile; the underlying tile restores when vacated. Releasing all cargo into target slots completes a level.
- **Checked (levels 2–3):** A solid color-12 helper takes one autonomous action per player action, pathfinds around solid objects, grabs free cargo (`4→5`) from any side, rigidly carries it to a nearest open target slot, and uses a separate release turn (`5→4`). It recognizes player-released wall/divider cargo and ignores deposited cargo. Obstacle-aware shortest-path tie choices can differ from naive axis-first routes.
- **Checked:** Player and helper are mutually solid. A blocked/rerouted action still advances the deadline. Bottom row is a hard deadline bar, consuming right-to-left `7→4` pixels over time.

# Working memory

- Level 4 of 9 began after step 156; timer is fresh. Player `(7,8)` faces up inside a color-2 enclosure: interior `x=6..9,y=6..10`, walls at `x=5,10` / `y=5,11`. Six interior cargo are `(6,6),(8,6),(9,6),(8,9),(6,10),(9,10)`; a seventh exterior cargo is `(6,1)`.
- Three helpers start at `(2,3),(14,1),(6,14)`. Seven targets are left `(1,6),(1,7),(2,9)`, right `(14,5),(13,7)`, and bottom `(9,14),(10,14)`. Full color-5 tiles form a vertical upper partition and two lower diagonals.
- **Strong layout inference, not yet live-checked:** Color-5 partitions create three helper compartments. The left helper already has exterior cargo plus needs two player transfers; right and bottom helpers each need two. Player should release two cargo through left/top-left wall cells, two through right/top-right, and two through the bottom wall.
- **Computed:** An A* search over the checked player/cargo rules found a 31-action minimum transfer sequence (treating distinct wall releases as removed): `R U G U G | L G L G | R R G R G | D D D G D G | U L G L L L G | D G D G`. It uses distinct exits `(8,5)` right, `(5,6)` left, `(10,6)` right, `(9,11)` bottom, `(5,9)` left, `(6,11)` bottom, avoiding pickup-delay blockage.
- Next batch executes the first 14 actions through the first three releases. It tests the inferred right/left handoffs while all player geometry uses the exact same patterned wall tile already checked in level 3. Expected player endpoint: `(9,6)` after releasing at `(10,6)`; earlier releases at `(8,5)` and `(5,6)` should be free/helper-bound.
