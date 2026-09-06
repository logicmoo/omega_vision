# Working model

- **Checked through levels 1–4:** Top hollow 6×6 symbols are the target data sequence. Solid 4×4 blocks are data; color-2 2×2 markers are empty positions.
- **Checked controls:** ACTION6 selects a solid block or hollow portal with a 1-cell color-0 outline; clicking an empty marker moves it there centered as 4×4 and leaves a 2×2 vacancy. Selecting one occupied data block then another swaps colors. ACTION5 submits. ACTION7 remains assumed undo.
- **Checked hierarchy:** Read each container left-to-right. A hollow 4×4 portal expands the large container outlined in its color at that position; recursively emit child contents, and do not emit the portal itself. Global row-major is false.
- **Checked loose portals (level 4):** Hollow portals below the divider are movable. Determine their parent positions by matching their child’s fixed/possible flattened sequence to a contiguous target segment. Level 4 completed with a moved portal around a child containing one fixed data block.
- **Checked HUD:** Each move/swap/submit consumes one y=53 cell (2→3 right-to-left); selection is free.
- **Helpers:** `scratch/sb26.py` detects targets, sources, containers and portals. `nested_slot_order()` handles placed portals; `nested_items()` also includes prefilled solid data. Both retrodict solved structures.
- **Optimization:** Each initially loose object needs one two-click move. A data permutation k-cycle can be repaired with k−1 occupied swaps.
- **Strongly inferred for level 5, uniquely forced by counts:** Multiple same-color portals may reference and emit the same child sequence repeatedly. This will be completion-tested on level 5.

# Working memory

- Level 5/8, fresh after step 63; completed count 4.
- Target: `6,14,8,8,14,8,8,11,15` (length 9).
- Outer color-8 container: five markers `(19,22),(25,22),(31,22),(37,22),(43,22)`. Child color-9 container: three markers `(25,36),(31,36),(37,36)`.
- Bottom has six solid data sources: `15:(6,58), 6:(13,58), 8:(20,58), 8:(27,58), 11:(34,58), 14:(41,58)`, plus two hollow color-9 portals at bboxes `(47,57)-(50,60)` and `(54,57)-(57,60)`.
- Length equation: with r portals, flattened length is `(5-r)+3r=5+2r`; target length 9 forces r=2. Exhaustive placement/decomposition gives exactly one solution: portals at outer indices 2 and 3 (markers `(25,22),(31,22)`), shared child sequence `14,8,8`, and direct outer data `6,11,15`. Final outer structure: `6,[portal9],[portal9],11,15`.
- Current batch: move both portals to `(25,22),(31,22)`, then put `14,8` in first two child markers. Next batch fills final child 8 and direct outer `6,11,15`, then submits.
- Budget fresh and ample.
