# Working model

- **[Checked through level 6]** Base play is orthogonal peg solitaire on a 6-pixel lattice. A color-14 ordinary peg jumps two cells into an empty playable cell; an ordinary color-14 midpoint is removed. A level completes when only one ordinary remains globally. A visible one-peg position may not complete because later/offscreen stages still contain ordinaries.
- **[Checked]** `ACTION6` selects a source and then a marked destination. Selection border is color3 and legal destinations color2. Clicking another source transfers selection; clicking the selected source is a no-op. `ACTION7` undoes the last jump.
- **[Checked]** Color-11/12 shuttles move on color-5 rails under `ACTION1/2/3/4 = U/D/L/R`; every independently legal shuttle moves and blocked ones stay. A shuttle is a playable source/destination and carries its occupant.
- **[Checked through level 6]** Color-15/7 squares are permanent hurdles: jumps over them do not remove them. Color8 is a fully non-capturing mobile hurdle: ordinary pegs jump over it without removing it, and it jumps over ordinary pegs without removing them. Either can ride shuttles.
- **[Checked]** Levels can contain staged offscreen sections. Scripted pans and ordinary-on-shuttle following cause large whole-board diffs and change screen coordinates. Hurdle-only/empty shuttle motion does not trigger survivor following.
- **[Checked]** Row0 is a multi-cycle action counter, not a 64-action deadline. Prefer undo to reset; never issue two RESETs consecutively.

# Working memory

- Level 7 began at step344 (`6/10`). Current visible pieces: ordinary `(7.5,13.5)`, color8 `(43.5,13.5)`, empty cart `(37.5,37.5)`. Fixed hurdles are below both pieces at logical `(7.5,19.5)` and `(43.5,19.5)`, above bottom unloading cells at `(13.5,49.5)` and `(43.5,49.5)`, and along bottom row at `(19.5,55.5)` and `(31.5,55.5)`.
- **[Strongly supported by rail geometry]** The efficient order is color8 first. Route the cart R,U,U to `(43.5,25.5)`, jump X down onto it, carry D,D,D to `(43.5,43.5)`, and jump X down over the fixed hurdle to static `(43.5,55.5)`. This is the next committed phase.
- **[Inferred continuation; verify cart route after unloading X]** Route the empty cart to `(7.5,25.5)`, load the ordinary, carry it through the rail maze to `(13.5,43.5)`, and unload to `(13.5,55.5)`. Jump O right over fixed hurdles x19/x31 to x37. With X at x43, bottom-row leapfrog O37/X43 should transport the pair right and reveal the next stage.
