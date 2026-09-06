# Working model

- **Checked (step 0):** The settled board is a 16×16 logical lattice rendered in 4-pixel tiles. The only likely controllable piece is a 4×4 compound at logical `(8,12)` / pixels `x=32..35,y=48..51`: black top row and color-14 lower three rows.
- **Checked (step 0):** Three identical 4×4 framed pieces occur at logical `(11,6)`, `(4,7)`, and `(8,9)` (color-4 border, color-9 2×2 center). A 12×4 framed region spans logical cells `(7..9,7)` (color-9 border, color-2 interior).
- **Checked (step 0):** Row `y=63` is a full-width color-7 strip and is probably HUD/timer rather than terrain; do not infer movement success from it.
- **Assumed, untested:** `ACTION1/2/3/4` are up/down/left/right and move the compound agent by one 4-pixel logical cell; `ACTION5` is interact. The black edge may encode facing.
- **Assumed, untested:** The framed 4×4 pieces are pushable/collectible objects and the 12×4 region is a three-cell receiver; likely objective is to bring all three pieces to it. Do not plan beyond a control probe on this yet.

# Working memory

- Level 1 of 9, fresh attempt at step 0. Agent candidate at logical `(8,12)`, facing-looking black edge on top. Objects at `(8,9)`, `(4,7)`, `(11,6)`; receiver at `(7..9,7)`.
- Next deliberate probe: `ACTION1`. Hypothesis: up movement by one logical tile, yielding black row at pixel `y=44` and color-14 body at `y=45..47`, while vacating old agent cells. This tests both ACTION1 mapping and movement stride without contacting anything.
- Ruled out: nothing yet.
