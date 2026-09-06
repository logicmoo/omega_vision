# Working model

- **Checked through levels 1–5:** Top hollow 6×6 symbols are the target data sequence. Solid 4×4 blocks are data; color-2 2×2 markers are empty positions.
- **Checked controls:** ACTION6 selects a solid block or hollow portal with a color-0 outline; clicking an empty marker moves it there centered as 4×4 and leaves a 2×2 vacancy. Selecting one occupied data block then another swaps colors. ACTION5 submits. ACTION7 remains assumed undo.
- **Checked recursive semantics:** Read a container left-to-right. A hollow 4×4 portal emits the entire matching-color child container recursively and does not emit itself. Loose bottom portals are movable. Multiple same-color portals can reference and repeat the same physical child; level 5 completed with two references to one child.
- **Checked HUD:** Each move/swap/submit consumes one y=53 cell (2→3 right-to-left); selection is free.
- **Generic solver:** `scratch/sb26.py:solve_fresh(board)` detects containers, fixed data, loose/placed portals, and sources; it exhaustively assigns loose portals to markers, symbolically flattens the hierarchy (including repeated references), and constrains leaf colors to the target/source multiset. It returns exactly one solution for every fresh board from levels 1–6, reproducing all earlier solved arrangements. Use it before acting on future levels.
- `nested_items()` reads the current flattened data/empties after portals are placed.
- **Optimization:** Every initially loose object needs one two-click move. Repair a data permutation k-cycle with k−1 occupied swaps.

# Working memory

- Level 6/8, fresh after step 80; completed count 5.
- Target: `9,11,11,12,15,15,14,6,6`.
- Four containers: root color8 at upper-left with three markers `(12,22),(18,22),(24,22)`; children are color9 lower-left `[fixed9,(18,36),(24,36)]`, color12 lower-right `[fixed12,(44,36),(50,36)]`, and color14 upper-right `[fixed14,(44,22),(50,22)]`.
- Loose portals: color14 bbox `(44,57)-(47,60)`, color9 `(51,57)-(54,60)`, color12 `(58,57)-(61,60)`. Six sources: 11 at `(3,58),(24,58)`; 6 at `(10,58),(31,58)`; 15 at `(17,58),(38,58)`.
- Solver found one solution: root portals left-to-right are `9,12,14`; child9 blanks=`11,11`; child12 blanks=`15,15`; child14 blanks=`6,6`. This flattens exactly to target.
- Current batch: move portals 9→`(12,22)`, 12→`(18,22)`, 14→`(24,22)`, then move one 11 source `(3,58)` to child9 marker `(18,36)`. Later fill the other five data blanks and submit.
- Budget fresh and ample.
