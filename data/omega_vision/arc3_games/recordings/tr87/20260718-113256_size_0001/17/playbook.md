# Working model

- **Checked (level 1 board):** Six cyan→pink training pairs are shown at the top (numbered row-major 0..5). The lower task has five fixed cyan glyphs above five editable pink glyphs, with a white bracket cursor selecting one lower column. Glyph interiors are 5x5 black masks inside 7x7 tiles.
- **Checked computationally:** A lower cyan is identified by exact shape up to D4 rotation/reflection. On level 1 the lower cyan IDs are `[3,4,0,1,2]`.
- **Strongly supported, pending first completion:** For each lower cyan, look up its paired top pink example and copy the **number of black cells**, not the pink shape. Pink shape geometry is incidental. This explains why three top pink examples can all encode 15, why lower pink position 3 matches no top shape, and every observed edit transition.
- **Checked controls:** ACTION4 moves the cursor one column right (+7 x). ACTION1 increases the selected lower pink black-cell count by 1; ACTION2 decreases it by 1; values cycle through 14,15,16,17,18,19 (wrap 19↔14). Observed at one column: ACTION1 15→16; ACTION2 16→15→14→19. Each count can be rendered by a substantially different glyph, so count with numpy rather than shape-match. ACTION3 is strongly supported as left (inverse of ACTION4), though its first use is next.
- **Objective hypothesis:** Set all five lower pink counts to the counts of the training pinks paired with the five lower cyan IDs. Completion should be automatic once all five match. Re-derive if level completion fails; do not rescue this model with extra rules.
- **Checked HUD:** y=63 fills color 4 from right to left by one cell every two actions; it is a ~128-action timer, not gameplay.

# Working memory

- Level 1/6, after step 5. Cursor is at lower column 1. Top pink counts by pair ID are `[16,15,14,15,19,15]`.
- Lower cyan IDs `[3,4,0,1,2]` therefore request counts `[15,19,16,15,14]`. Current lower pink counts are `[14,19,19,17,16]`; column 1 is already correct.
- Computed shortest edits: col0 ACTION1×1; col2 ACTION1×3 (19→14→15→16; either direction costs 3); col3 ACTION2×2; col4 ACTION2×2. From cursor col1, shortest known navigation is left to col0 then sweep right to col4 (5 cursor moves), for 13 actions total.
- Next committed plan: `A3, A1, A4, A4, A1×3, A4, A2×2, A4, A2×2`; expect level count to become 1. Cursor expectations guard navigation; exact edited masks are intentionally not predicted because only their checked counts are semantic.
- Ruled out: ACTION1 as rotation; cycling in training-pair order; matching lower pink by exact/D4 shape; fixed geometric cyan→pink transform.
