# Working model

- **[Checked through level 5]** Base play is orthogonal peg solitaire on a 6-pixel lattice. A color-14 ordinary peg jumps two cells into an empty playable cell; an ordinary color-14 midpoint is removed. Levels 1–5 ended at one global ordinary peg, but level 6 has now disproved that as a universal goal.
- **[Checked]** `ACTION6` selects a source and then a marked destination. A selection uses color3 and legal destinations color2. Clicking another selectable source transfers selection immediately; clicking the selected source is a no-op. `ACTION7` undoes the last jump.
- **[Checked]** Color-11/12 shuttles travel on color-5 rails under `ACTION1/2/3/4 = U/D/L/R`; every independently legal shuttle moves, blocked ones stay. A shuttle is a playable jump source/destination and carries any piece on it.
- **[Checked through level 5]** Color-15/7 squares are permanent hurdles: they enable jumps but survive and can ride shuttles. Hurdle-only/empty shuttle motion does not trigger survivor-camera following.
- **[Checked level 6 through step263]** A color-8 cross is a fully non-capturing mobile hurdle: ordinary pegs jump over it without removing it, and it jumps over ordinary pegs without removing them. It selects and moves through the normal jump UI.
- **[Checked]** Levels can be staged offscreen. Scripted pans and normal-peg shuttle following change screen coordinates; large whole-board diffs usually indicate camera motion.
- **[Checked through step228]** Row0 is a multi-cycle action counter, not a 64-action deadline.
- Prefer undo to reset; never issue two RESETs consecutively.

# Working memory

- Level 6 remains `5/10`. Reducing the visible position to one ordinary peg did **not** complete it, so the level-1–5 objective does not apply here.
- **[Checked current board]** Color8 is `(19.5,43.5)` and the sole ordinary peg is adjacent at `(25.5,43.5)`. Empty shuttles occupy `(49.5,43.5)` and `(55.5,43.5)`; all other original ordinary pegs were validly captured.
- **[Computed, not yet executed]** Five forced rightward leapfrogs load both surviving pieces: color8 `19.5→31.5`, ordinary `25.5→37.5`, color8 `31.5→43.5`, ordinary `37.5→49.5` (left shuttle), color8 `43.5→55.5` (right shuttle). This is the shortest loading route under the checked rules.
- **[Assumed only]** The paired shuttles likely carry both pieces to an offscreen second stage. Do not build beyond loading until a rightward shuttle move reveals how the camera/world continues.
