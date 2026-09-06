# Working model

- **[Checked through level 5]** The base game is orthogonal peg solitaire on a 6-pixel lattice. Color-14 crosses are ordinary pegs. A jump moves a peg two orthogonal lattice steps into an empty playable cell; an ordinary midpoint peg is removed. Levels 1–5 completed when exactly one ordinary peg remained across the full world, including a peg carried by a shuttle. Later levels can add or alter the goal.
- **[Checked]** `ACTION6` selects source then destination. Selection outlines the source in color3 and marks legal destinations with color2. `ACTION7` undoes the last jump. Color-11/12 shuttles move on color-5 rails under `ACTION1/2/3/4 = U/D/L/R`; every independently legal shuttle moves, blocked ones stay. A shuttle is a playable source/destination and can carry a peg.
- **[Checked through level 5]** Color-15/7 squares are permanent hurdles: they enable a jump but remain. They can ride a shuttle; hurdle-only/empty shuttle movement does not invoke survivor-camera following. Level 5 required repeatedly routing one mobile hurdle between disconnected boards.
- **[Checked]** Levels can be staged offscreen. Scripted pans and survivor-cart camera following alter screen coordinates but not world geometry; large full-board diffs are usually camera motion.
- **[Checked through step228]** Row0 is a multi-cycle action counter, not a 64-action deadline: action64 completed normally, and later actions advanced cells from color1 to color2.
- Prefer undo to reset; never issue two RESETs consecutively.

# Working memory

- Level 5 completed at step246 exactly when its final ordinary jump left one global peg. Level 6 is now `5/10`, row0 reset to zero, all direction/click/undo controls available.
- **[Checked current board]** Ordinary pegs are `(19.5,25.5)`, `(13.5,49.5)`, `(25.5,55.5)`. A new color-8 cross occupies/marks `(19.5,19.5)`. Two adjacent empty shuttles are `(49.5,43.5)` and `(55.5,43.5)`. No color-15 hurdles are visible.
- Main playable shape: a 4x4 block at x`13.5,19.5,25.5,31.5`, y`13.5,19.5,25.5,31.5`; lower rows y`37.5,43.5,49.5` extend through x43.5, with the two carts continuing the middle row; a bottom spur contains peg `(25.5,55.5)`.
- **[Unresolved new mechanic; do not plan on it]** Most likely color8 is a goal/marked hole rather than occupancy: its placement directly above peg19.5,25.5 would support a future final jump from19.5,31.5 over that peg into the mark. Alternative: it is an occupied special peg/hurdle, in which case the current peg can jump upward over it to19.5,13.5.
- Immediate deliberate probe: click ordinary peg `(19,25)`. If color8 counts as occupancy, selection should produce a color2 ring at `(19.5,13.5)`; if it is an empty target, the peg has no legal jump and no selection/ring should appear. Inspect colors2/3 after this one action.