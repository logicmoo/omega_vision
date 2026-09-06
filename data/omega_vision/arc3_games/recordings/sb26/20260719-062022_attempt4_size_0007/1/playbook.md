# Working model

- **Checked through levels 1–3:** Top hollow 6×6 symbols give the target sequence. Solid 4×4 blocks are data. Color-2 2×2 markers are empty positions.
- **Checked controls:** ACTION6 on a block selects it with a 1-cell color-0 outline; clicking an empty marker moves it there as a centered 4×4 and leaves a 2×2 vacancy. Selecting one occupied data block and clicking another swaps their colors. ACTION5 submits; the last placement does not auto-submit. ACTION7 is still assumed undo.
- **Checked hierarchy rule (levels 2–3):** Read a container left-to-right. A hollow 4×4 colored portal inside it recursively expands the large child container outlined in the same color at that position. Level 3, with two sibling portals, completed under this rule. Global row-major ordering is false.
- **Checked HUD:** Every placement, occupied swap, or submit consumes one y=53 cell (2→3, right-to-left); selection is free.
- **Parser:** `scratch/sb26.py:nested_slot_order()` correctly retrodicts levels 1–3 when portals are already inside parents. Current level 4 has an unplaced portal, so its expected two-root error is informative rather than a hierarchy contradiction.
- **Optimization:** Initially each movable object requires one two-click move. Repair a data permutation k-cycle in k−1 occupied swaps.
- **Strongly inferred, next probe tests:** A hollow 4×4 portal below the divider is movable like a data block. Place it into the parent slot where its child’s flattened subsequence belongs; it should then recursively expand that child rather than count as a target color itself.

# Working memory

- Level 4/8, fresh after step 48; completed count 3.
- Target: `11,8,14,9,6,12,15`.
- Outer color-8 container has five empty markers left-to-right: `(19,22),(25,22),(31,22),(37,22),(43,22)`.
- Child color-14 container has sequence positions: fixed solid `14` centered at (25,36), then empty markers `(31,36),(37,36)`. Thus its only target-compatible length-3 subsequence is `14,9,6` at target positions 3–5.
- Bottom movable solid sources: `11:(10,58), 6:(17,58), 12:(24,58), 8:(31,58), 15:(38,58), 9:(45,58)`. Bottom also has a hollow color-14 portal at bbox x=51–54,y=57–60.
- Predicted final structure: outer positions are `11,8,[portal14],12,15`; child positions are fixed `14`, then `9,6`, flattening to the target.
- Next deliberate probe: select the bottom hollow portal via rim cell (51,57), then put it in outer third marker (31,22). Predict hollow color-14 bbox x=30–33,y=21–24, gray source vacancy x=52–53,y=58–59, and one budget cell used.
