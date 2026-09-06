# Working model

- **Checked:** 16×16 logical lattice, 4×4 pixels/tile. `ACTION1/2/3/4` = up/down/left/right; `ACTION5` = grab/release.
- **Checked:** Unladen color-0 edge is facing. Directional input turns and translates if clear; against occupied cargo it turns in place. A free ring-4/color-9-core cargo highlights `4→3` only on the facing side.
- **Checked:** Player grab changes cargo `3→0`. While carrying, all movement translates the rigid agent+cargo pair without rotating/changing offset. Release is `0→3`; moving/facing away restores ring 4. Cargo can be grabbed from any side.
- **Checked:** Cargo/agents are solid, but held cargo can overlay a color-9/color-2 target and vacated target pixels restore. Releasing all cargo in target completes the level.
- **Checked (level 2):** Solid color-12 is an autonomous helper carrier taking one action per player action. It pathfinds to free cargo, can grab from any side (`4→5`), rigidly carries it, chooses an open target slot, and spends a separate release turn (`5→4`). It ignores deposited cargo.
- **Checked (level 2):** Player and helper are mutually solid. A simultaneous head-on swap blocked the player and made the helper reroute; the deadline still advanced. Avoid intersecting routes.
- **Checked:** Bottom row is a hard deadline bar, usually consuming one right-to-left `7→4` segment per player action. Level 2 required player/helper parallelism and completed with substantial margin.

# Working memory

- Level 3 of 9, fresh at step 76. Player `(4,9)` facing up. Helper `(12,3)`. Five cargo: wall/right-transfer pieces `(8,3)` and `(8,8)`, plus left-side pieces `(2,4)`, `(5,5)`, `(3,11)`. Target is 2×4 at `x=13..14,y=6..9`. Deadline reset to 64.
- **Checked geometry:** Logical column `x=8` is filled top-to-bottom by a repeating color-2/background-1 patterned divider, except where cargo overlays it at `(8,3)` and `(8,8)`. Player and three cargo are left; helper and target are right.
- **Strong hypothesis, not yet live-tested:** The divider is impassable to agents, while held cargo may overlay it as a transfer point. Helper will collect cargo presented at `x=8` from the right. Thus player must feed the three left cargo onto the divider while helper delivers all five to the right-side target.
- Predicted helper opening: left ×3 from `(12,3)` to `(9,3)`, grab wall cargo `(8,3)` on its left on turn 4, then carry it to nearest target slot (likely `(13,6)`) and release around turn 13.
- Productive first batch: player up ×4 to `(4,5)`, turn right against cargo `(5,5)`, grab, then carry right ×2 to agent `(6,5)` / cargo `(7,5)`. This is 8 turns and lets us verify helper opening before the deliberate divider-overlay test. Intended transfer is cargo `(8,6)` via one more right, down, release.
