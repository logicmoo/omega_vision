# Working model

- **Checked:** The board is a 16×16 logical lattice of 4×4-pixel tiles. `ACTION1/2/3/4` are up/down/left/right; `ACTION5` grabs or releases.
- **Checked:** The player's color-0 edge indicates facing. Unladen directional input faces that way and translates if clear; against cargo/agents it turns in place. Adjacent faced cargo highlights ring `4→3`.
- **Checked:** Player grab changes cargo ring to 0; carrying rigidly translates player+cargo without rotating their offset. Player release gives ring 3, later restoring to 4. Cargo may be grabbed from any side.
- **Checked:** Cargo, player, and helpers are solid. Held cargo can overlay targets and patterned color-2 tiles; full color-5 barriers are solid. Releasing every cargo into a target completes a level; surplus targets may remain.
- **Checked (levels 2–5):** A color-12 helper takes one autonomous action per player action when it has a complete route, grabs free cargo (`4→5`), rigidly carries it to the nearest feasible open target, and spends a separate release turn (`5→4`). Player updates happen first; deposited cargo is ignored.
- **Checked:** Helpers recompute from post-player occupancy every turn and wait if no complete route exists. On equal shortest routes they favor a goalward horizontal move over a vertical one (steps 242, 282, 284, 288). They do not remain committed to an earlier approach.
- **Checked (level 5):** Player and helper releases can occur on the same turn and immediately complete a level.
- **Checked (level 5):** The bottom deadline bar changed about one pixel per two actions and allowed roughly 128 actions.

# Working memory

- Level 6/9 (5 completed), fresh after step 308. Player is `(5,13)`, facing up. Cargoes with ring 4 are `(7,4)` and `(14,7)`. A new full color-15 tile/agent is `(4,4)`; its mechanics are unknown.
- Full color-5 barrier is two columns `x=11..12`, with its only gap at `y=6`. Color-2 target regions are 2×2 blocks `x=7..8,y=3..4` and `x=13..14,y=6..7`; each currently contains one cargo, so the old positional completion model alone cannot explain why the level remains active.
- **Unknown hypotheses for color 15:** stationary special tile, synchronously controlled clone, or autonomous agent. A single useful upward move is the cheapest discriminator: player should move to `(5,12)`; primary null prediction is that color 15 remains `(4,4)` (same-control/opposite/autonomous alternatives would move it differently).
- No level-6 multi-step plan is justified until that one-step behavior is observed.
