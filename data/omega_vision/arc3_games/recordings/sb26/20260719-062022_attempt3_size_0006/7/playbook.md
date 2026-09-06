# Working model

- **Checked through levels 1–2:** Top hollow symbols are the target sequence. Bottom solid 4×4 blocks are movable sources. Middle color-2 2×2 markers are empty destination centers.
- **Checked controls:** ACTION6 on a block selects it with a 1-cell color-0 outline. ACTION6 on an empty marker moves it there as a centered 4×4 block and leaves a 2×2 marker at its old location. Selecting one occupied block and clicking another swaps their colors directly. ACTION5 submits; the last placement does not auto-submit. ACTION7 is still assumed to undo.
- **Checked hierarchy rule (level 2 success):** Read each container left-to-right. A central 4×4 hollow colored marker is a portal to the large container outlined in that same color; recursively emit all of the child container’s slots at the portal’s position, then continue in the parent. Global row-major order is false. A failed-submit animation’s scan path exposed this rule, and arranging level 2 by recursive order completed it.
- **Checked HUD:** Every placement, occupied swap, or submit consumes one y=53 budget cell, changing color 2→3 from right to left. Source selection is free. Do not treat the strip as pieces.
- **Retrodicted parser:** `scratch/sb26.py:nested_slot_order()` detects container rectangles and colored portals. It reproduces level 1 order, the corrected level 2 order, and the current level 3 hierarchy. Use it on each fresh board rather than guessing visually.
- **Optimization:** Initially every target block needs one move (two clicks). For repairs, resolve a permutation k-cycle with k−1 direct occupied swaps.

# Working memory

- Level 3/8, fresh after step 33; completed count 2.
- Target: `8,14,15,11,6,9,12`.
- Bottom source centers: `12:(10,58), 14:(17,58), 15:(24,58), 11:(31,58), 9:(38,58), 6:(45,58), 8:(52,58)`.
- Parsed recursive destination order (2×2 marker top-left coordinates): `(19,23),(19,35),(25,35),(31,23),(37,35),(43,35),(43,23)`. Structure is outer slot, left child’s two slots, outer center slot, right child’s two slots, outer right slot.
- Current batch: place target prefix `8,14,15,11` into the first four parsed destinations. Then place suffix `6,9,12` and submit.
- Budget fresh and ample.
