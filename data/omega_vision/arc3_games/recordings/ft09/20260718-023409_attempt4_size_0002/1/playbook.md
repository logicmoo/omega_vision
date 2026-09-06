# Working model
- **Confirmed through levels 1–3:** The board uses ordinary 6×6 tiles on an 8-cell pitch plus clue tiles. A clue contains a 3×3 array of 2×2 micro-cells. For each of its eight neighbors, micro-color 0 requires the neighbor to equal the clue’s center-core color; micro-color 2 requires it to differ from that core. With a two-color palette, “different” uniquely selects the other color.
- **Confirmed overlap method:** Decode every clue into equality/inequality constraints at absolute lattice positions and merge them. Level 2 had two overlaps; level 3 had four clues with both possible core colors and all merged constraints agreed. Clicking all mismatches solved both.
- **Confirmed control for two-color levels:** ACTION6 inside an ordinary tile advances it from the initial palette color to the other color. Never click clue centers. Top-right swatches list the level palette.
- **Strongly retrodicted for 3+ colors:** Swatches are in click-cycle order. Prior transitions followed their order: 9→12 on level 2 and 8→12 on level 3; level 4 displays [9,8,12], predicting 9→8→12 on repeated clicks.
- **Confirmed HUD:** The y=63 strip is a click budget, not gameplay. Fresh levels provide ample capacity (about 32 actions).

# Working memory
- Level 4, 3/6 completed; only ACTION6 available. Palette [9,8,12], all ordinary tiles initially 9. Three clue centers on a T-shaped lattice are at (col,row) (1,1) core12, (3,1) core9, and (2,3) core12, using x origins [12,20,28,36,44], y origins [14,22,30,38,46].
- **Hypothesis to discriminate:** Micro-2 means an inequality, so in a 3-color palette any allowed unequal color is valid. Choose each tile independently to minimize forward cycle clicks. A stricter alternative is that all micro-2 cells must share exact color8. Static constraints cannot distinguish these; first try the inequality solution because it saves five actions and fallback still fits the budget.
- Minimum inequality solution from initial 9 takes 16 clicks: target12 (two clicks each) at (22,16),(22,32),(22,48),(30,48),(38,48); target8 (one click each) at (30,16),(46,16),(30,24),(46,24),(30,32),(38,32). All other constrained ordinary tiles may stay9.
- First probe repeated clicking at (22,16), an equality-to-12 tile: predict first 9→8, second 8→12. If confirmed, batch the remaining 14 minimum-solution clicks.
- If the minimum configuration does not complete, exact-color fallback is five extra 9→8 clicks at (14,16),(14,24),(14,32),(22,40),(38,40); do not alter equality-to-9 tiles (38,16),(46,32).
