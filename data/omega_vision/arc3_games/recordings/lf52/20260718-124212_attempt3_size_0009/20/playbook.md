# Working model

- **[Checked through level 3]** The core game is orthogonal peg solitaire on 6-pixel-spaced cells. Color-14 crosses are pegs. A jump moves a peg over one orthogonally adjacent occupied peg into an empty playable cell two lattice steps away, removes the jumped peg, and empties the source.
- **[Checked]** Jumps use `ACTION6` on source then destination. Selection outlines the source in color 3 and marks legal destinations with color-2 rings. Clicking elsewhere cancels selection; a peg with no move only shakes.
- **[Checked through level 3]** Color-11/12 shuttles move on color-5 rails and are controlled simultaneously by `ACTION1` up, `ACTION2` down, `ACTION3` left, `ACTION4` right. A valid input moves each independently legal shuttle one lattice step; blocked shuttles do not move. A shuttle dock is a playable cell: a peg may jump into it, ride with it, and jump out later.
- **[Checked]** `ACTION7` undoes the last jump (including its prior selection state). A dead position with multiple pegs recolors survivors 14→2 and shows a color-15 reset icon. Prefer undo; never double-RESET.
- **[Checked levels 1–3]** A level completes when exactly one ordinary peg remains, including one carried by a shuttle. Levels 2 and 3 required combining disconnected boards by transporting a reduced component on a shuttle.
- **[Checked level 3]** Multiple shuttles respond to one direction input independently. The camera can scroll to follow a leading shuttle; screen coordinates then differ from world coordinates, while directions and lattice spacing remain unchanged.
- **[Checked]** Row 0 is a 64-action deadline bar, advancing one cell per action and resetting at a level transition. Its changes are HUD only.

# Working memory

- Level 4 began at `3/10` on step 108; all controls plus undo are available and the timer is 0/64. Camera appears reset.
- Upper board is a 7-by-3 rectangle with centers `x=7.5+6c`, `c=0..6`, and rows `y=19.5,25.5,31.5`. Ordinary pegs are at middle-row `c1=(13.5,25.5)` and `c6=(43.5,25.5)`. Middle-row `c2` and `c4` contain new identical color-15 outlined/color-7 interior pieces; all other cells are empty.
- An empty shuttle is at `(55.5,25.5)`, apparently one rail step right of the upper dock at lattice `c7=(49.5,25.5)`. Its rail exits to the right and bends down offscreen. A clipped lower 3-cell board at `y=61.5`, `x=31.5,37.5,43.5` has a peg in its middle cell; a rail approaches from the right. Total ordinary pegs: 3.
- **[Hypothesis to test, not yet assumed]** The new square pieces are fixed occupied pegs that an ordinary peg can jump over (likely removing them). If so, selecting upper peg `c1` should mark `c3=(25.5,25.5)` as legal; then `c1→c3→c5→upper dock c7` would reduce the upper row before shuttle transport to the lower peg.
- Next action is the useful source click at `(13,25)`: it both begins that candidate jump and discriminates whether the color-15/7 piece counts as jumpable occupancy. Expected legal-destination ring sample is screen cell `(25,24)=2`; if absent, re-derive the new mechanic from the resulting frames rather than forcing the hypothesis.
