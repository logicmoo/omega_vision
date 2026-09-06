# Working model

- **Checked through levels 1–6:** Top hollow 6×6 symbols are the target data sequence. Solid 4×4 blocks are data; color-2 2×2 markers are empty positions.
- **Checked controls:** ACTION6 selects a solid block or hollow portal with a color-0 outline; clicking an empty marker moves it there centered as 4×4 and leaves a 2×2 vacancy. Selecting one occupied data block then another swaps colors. ACTION5 submits. ACTION7 remains assumed undo.
- **Checked recursive semantics:** Read a container left-to-right. A hollow 4×4 portal emits the entire matching-color child container recursively and does not emit itself. Loose bottom portals are movable. Multiple same-color portals can reference and repeat the same physical child; level 5 completed with two references to one child.
- **Checked HUD:** Each completed move/swap/submit consumes one y=53 cell (2→3 right-to-left); selection is free.
- **Generic solver:** `scratch/sb26.py:solve_fresh(board)` detects containers, fixed data, loose/placed portals, and sources; it assigns loose portals to markers, symbolically flattens the hierarchy (including repeated references), and constrains leaf colors to the target/source multiset. It found valid arrangements on every fresh board through level 7; solutions need not be unique (level 7 has five). Use it before acting on future levels.
- `nested_items()` reads the current flattened data/empties after portals are placed.
- **Optimization:** Every initially loose object needs one two-click move. Repair a data permutation k-cycle with k−1 occupied swaps.

# Working memory

- Level 7/8 is fresh at step 99; completed count 6. Target is `8,9,14,11,14,9,8`.
- Containers form three rows: root color8 bbox `(21,12)-(42,21)`, color9 child `(21,25)-(42,34)`, color14 child `(21,38)-(42,47)`. Bottom color14 has fixed 11 at center slot `(31,42)`.
- Loose portals: 14 centered `(48,58)` and 9 centered `(55,58)`. Sources: 8 at `(6,58),(20,58)`; 9 at `(13,58),(34,58)`; 14 at `(27,58),(41,58)`.
- Chosen solver solution (one of five): put portal14 at root left `(25,16)`, then portal9 at color14 left `(25,42)`. Fill color9 row `(25,29),(31,29),(37,29)` with `8,9,14`; fill color14 right `(37,42)` with 14; fill root middle/right `(31,16),(37,16)` with `9,8`. Recursive flattening is exactly the target.
- This requires the minimum eight object moves plus submit. Timer is fresh (64 cells), so budget is ample.
