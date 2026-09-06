# Working model

- **[Checked through level 1]** This is orthogonal peg solitaire on the displayed 4×4 tile cells. Color-14 crosses are pegs. A legal move jumps an adjacent peg horizontally or vertically into an empty playable cell exactly two tile steps away, removing source and jumped peg and occupying the destination.
- **[Checked through level 1]** Use `ACTION6` twice per jump: click the source peg, then its destination. A selected source gets a color-3 outline and each legal destination a color-2 ring; clicking a ring executes the jump and clears the indicators after animation.
- **[Checked, step 9]** Reducing level 1 to one peg completed the level (counter 0→1), confirming the ordinary one-peg objective at least for a connected board.
- **[Checked, step 1]** Clicking an irrelevant empty tile makes no gameplay change (only timer advances) and may pulse a canonical solvable source as a hint.
- **[Checked]** Every action so far adds one filled cell to the row-0 timer; likely 64-action budget. `ACTION1`–`ACTION4` remain unused/unknown. **[Assumed]** `ACTION7` is undo.
- **[Method validated]** Extract playable tile centers and pegs in Python, enumerate legal jumps, and search incrementally for a minimum-peg solution before acting. Do not assume later special-looking cells or disconnected regions use ordinary topology until tested.

# Working memory

- Level 2, 1/10 complete, fresh board after step 9.
- Ordinary tiles share pixel lattice origin `(7,9)` with step 6. Main component is a full 7×3 rectangle `(c=0..6,r=0..2)` with pegs `(1,1),(2,1),(4,1),(6,1)`. A separate visible 2×2 tile block at global `(c=6..7,r=6..7)` has one peg `(6,7)`.
- There is also a special 6×6 color-11/12 block centered at global lattice coordinate `(4,4)`, joined to board outlines by long color-5 conduits. Its function and whether the disconnected regions interact are unknown; do not plan across that assumption yet.
- Searching ordinary jumps in the main 7×3 component gives exactly one one-peg chain: `(1,1)->(3,1)`, `(3,1)->(5,1)`, `(6,1)->(4,1)`. The lower 2×2 peg is isolated under ordinary topology, so completion may mean one peg per component or may introduce conduit/special-cell behavior.
- Next deliberate probe: click canonical main source `(1,1)` at pixel `(14,16)`. Predict the familiar color-3 source outline and color-2 ring at destination `(3,1)` (pixel block starts `(25,15)`).
