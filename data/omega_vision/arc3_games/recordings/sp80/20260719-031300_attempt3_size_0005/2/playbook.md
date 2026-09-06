# Working model

## Checked against log
- Geometry uses 4x4 logical cells (`X=x//4`, `Y=y//4`), except the one-pixel budget edge and clipped emitter blocks.
- A color-6 seed grows one logical cell/frame directly **away from its adjacent color-4 emitter** when ACTION5 runs the layout. It leaves a trail.
- Horizontal bars block flow. Color9 is the selected/movable bar; other bars are color8. ACTION4 shifts the selected bar right one logical cell. ACTION6 clicking a color8 component selects it (8->9) and deselects the old bar (9->8). ACTION5 makes all bars color8 during simulation.
- If any streams hit bar interval `[L,R]`, those streams merge/spread across its face and emerge at `L-1` and `R+1`; streams missing it pass unchanged. Level 1 confirmed endpoint routing, and level 2 confirmed cascading/merging through several bars.
- Color11 U shapes are receptacles. Flow is safe only when final streams enter their openings and become enclosed; leakage to the terminal color1 edge fails. Failed ACTION5 restores placements and consumes budget. Successful ACTION5 increments the level.
- Levels solved: L1 downward, one bar; L2 upward, three-bar cascade. L2 route `{10} -> {5,11} -> {5,8,12} -> {4,8,12}` completed exactly as modeled.
- Color14 full-width edge is the move budget. It recedes by a small variable number of physical cells/action and resets each level.
- Reusable stream solver: `scratch/flow.py` (`route`, `solutions`).

## Assumed / to test
- A bar flush with x=0 or x=15 should suppress the off-board endpoint branch rather than leak; this is required by the unique low-move level-3 solution but has not yet been live-tested.
- ACTION3 is probably left by convention; ACTION1/2 remain untested.

# Working memory
- Level 3 freshly loaded at step14, progress 2/6, full bottom budget. Upward sources are `{1,9,14}`. Inverted cup openings are target `{2,7,13}`.
- Bars in upward order `(row,length,initial L)`: active D `(10,6,9)`; C `(8,6,2)`; B `(7,5,10)`; A `(5,4,2)`.
- Exhaustive 18,876-placement stream-set search found only 3 exact solutions under the checked routing rule plus edge suppression. Unique cheapest is lefts `(10,0,8,3)`, horizontal movement 6. Trace: `{1,9,14}` --D flush right--> `{1,9}` --C flush left--> `{6,9}` --B--> `{6,7,13}` --A--> `{2,7,13}`.
- Required moves: D right1; C left2; B left2; A right1; select each inactive bar; ACTION5. Total 10 actions from fresh state.
- Current short plan: D right1, select C, then deliberately test ACTION3 as C-left. Stop after one left because left mapping and edge suppression are not yet checked.
- Ruled out: under the verified non-edge transform there is no exact placement for this level in any horizontal-bar order; boundary branch suppression is therefore the simplest testable extension, not an ad hoc rescue of a contradicted model.
