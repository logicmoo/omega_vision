# Working model

- **[Checked through level 2]** The core game is orthogonal peg solitaire on 6-pixel-spaced tile cells. Color-14 crosses are pegs. A jump moves a peg over one orthogonally adjacent peg into an empty playable cell two lattice steps away, removes the jumped peg, and leaves the source empty.
- **[Checked]** A jump uses `ACTION6` on source then destination. A selectable source gets a color-3 outline and legal destinations get color-2 rings. Clicking elsewhere cancels a selection; a peg with no legal jump only shakes.
- **[Checked, level 2]** Color-11/12 blocks are movable shuttle cells on color-5 rails. A shuttle at a board dock participates as an ordinary playable cell: a peg can jump into it, the shuttle then carries that peg while moving, and its peg can later jump back onto a board.
- **[Checked]** Direction controls are `ACTION1` up, `ACTION2` down, `ACTION3` left, `ACTION4` right. A valid rail move shifts a shuttle one lattice step (6 pixels); a blocked direction changes no gameplay cells.
- **[Checked, step 39]** `ACTION7` undoes the last jump, including restoring its pre-jump selection state. Prefer it to RESET. A terminal position with multiple stranded pegs recolors survivors 14→2 and raises a color-15 reset icon; clicking that icon restarts the level.
- **[Checked levels 1–2]** Finishing with one peg completed each prior level. Level 2 required combining initially separate tile boards via a shuttle: load at one dock, carry around the rail, and unload with a final jump.
- **[Checked]** Row 0 is a 64-action timer/bar, advancing one cell per action and resetting on level transition. Treat it as HUD, not play space.
- **[Assumed for level 3; must test]** If multiple shuttles are present, a direction input may move every shuttle for which that direction is legal.

# Working memory

- Level 3 just began at 2/10 after step 61; timer is 0/64 and all six actions plus undo are available.
- The upper/main polyomino uses lattice centers `x=7.5+6c`, `y=7.5+6r`, with cells by row: `r0:{0,1,3,4}`, `r1:{0,1,3,4}`, `r2:{0,1,2,3}`, `r3:{0,1,2,3}`. Its pegs are `(1,1),(4,1),(1,2),(3,2),(2,3)`. A separate clipped tile at `(9,1)` has one peg. Initial ordinary moves within the main polyomino are only `(1,2)->(1,0)` or `(1,1)->(1,3)`.
- Upper empty shuttle is at `(43.5,13.5)` = lattice `(c6,r1)`. Its horizontal rail appears to have positions `c5..c8`; `c5` docks immediately right of main cell `(4,1)`, and `c8` docks immediately left of the separate `(9,1)` peg.
- Lower board has top-row cells `c0..3` at `y=49.5`, bottom-row cells `c0..2` at `y=55.5`, and pegs at top `(c1,c3)`. It has no initial ordinary jump. Lower empty shuttle is at `(37.5,49.5)` (`c5`); moving left to `c4` should dock it beside the board. Its rail also extends right into a rectangular loop, purpose not yet known.
- **Next deliberate probe:** `ACTION3` left. Geometry predicts upper shuttle `43.5→37.5` and lower shuttle `37.5→31.5`. This distinguishes synchronized multi-shuttle movement while usefully docking both. Do not assume linked payloads, rail wrapping, or how the isolated upper peg/lower immobile pair interact until observed.
