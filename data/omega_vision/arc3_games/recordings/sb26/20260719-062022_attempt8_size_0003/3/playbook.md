# Working model

- **Checked through levels 1–7:** Top hollow 6×6 symbols are the target data sequence. Solid 4×4 blocks are data; color-2 2×2 markers are empty positions.
- **Checked controls:** ACTION6 selects a solid block or hollow portal with a color-0 outline; clicking an empty marker moves it there centered as 4×4 and leaves a 2×2 vacancy. Selecting one occupied data block then another swaps colors. ACTION5 submits. ACTION7 remains assumed undo.
- **Checked recursive semantics:** Read the color-8 root left-to-right. A hollow 4×4 portal emits the entire matching-color child container recursively and does not emit itself. Loose bottom portals are movable. Multiple same-color sibling portals can repeat one physical child (level 5).
- **Checked HUD:** Each completed move/swap/submit consumes one y=53 cell (2→3 right-to-left); selection is free.
- **Generic solver:** `scratch/sb26.py:solve_fresh(board)` handles acyclic levels through level 7 by assigning portals and flattening the hierarchy. Solutions need not be unique. `nested_items()` reads a placed acyclic hierarchy.
- **Level-8 inference, not yet submit-checked:** A portal back to a container already active on the recursion stack must terminate/emit nothing, while sibling repeats remain allowed. The final board strongly forces this: its eight slots, six data, and reciprocal portals 8/9 cannot form an acyclic hierarchy; this is the natural next mechanic after the earlier recursion curriculum.
- **Optimization:** Every initially loose object needs one two-click move. Repair a data permutation k-cycle with k−1 occupied swaps.

# Working memory

- Final level 8/8 is fresh at step 116; completed count 7. Target is `8,11,12,9,14,15`; timer is fresh.
- Root color8 bbox `(18,22)-(45,31)` has markers `(22,26),(28,26),(34,26),(40,26)`. Child color9 bbox `(18,36)-(45,45)` has markers `(22,40),(28,40),(34,40),(40,40)`.
- Loose portals: 8 bbox `(47,57)-(50,60)`, 9 bbox `(54,57)-(57,60)`. Sources: 15 `(6,58)`, 11 `(13,58)`, 12 `(20,58)`, 8 `(27,58)`, 9 `(34,58)`, 14 `(41,58)`.
- Natural cycle solution: root row `[8,11,12,portal9]`; child row `[9,14,15,portal8]`. Root expands child, whose back-edge to active root terminates, yielding exactly the target. All eight objects move once, then submit.
- Immediate probe/committed useful work: place portal9 at `(40,26)` and portal8 at `(40,40)`. If reciprocal placement is accepted, fill the six data cells in the next batch and submit.
