# Working model

## Checked against log
- Logical scale/origin varies. Level6 uses an 18x19 logical interior: scale3, physical x-origin5/y-origin2; logical center `(x,y)` is physical `(6+3x,3+3y)`.
- ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right by one logical cell; ACTION5 starts flow; ACTION6 selects the clicked movable entity. Selected material is color9, inactive ordinary guides color8, and inactive special L guides color15.
- Color6 grows away from adjacent color4, retaining a trail. Against an ordinary bar perpendicular to travel, a blocked stream spreads along the near face and exits both ends; a border can suppress an off-board exit. Old trail is not an obstacle.
- L5 correction: its color15 `┐` hit upward at its left top cell emitted only a persistent left ray; it did not also create an ordinary upward branch.
- L5 was solved live at step211. Source5 hit the red L for the side cup. Source13 cascaded through bottom A `[10..13]`, middle B `[12..14]`, and top C `[6..10]`, yielding exact top outputs `{5,11,15}`.
- Completed levels: L1 split, L2 cascade, L3 multi-source/edge suppression, L4 composite-bar cascade, L5 special turn plus three-bar cascade. Progress 5/6.

## Assumed / to test
- A color15 L changes a branch's travel direction persistently; exact input/output behavior for the two L orientations in L6 is not yet known.
- A vertical ordinary bar should split a horizontal branch just as horizontal bars split vertical branches, but no recorded L6 animation yet confirms this.

# Working memory
- Level6 initial board after step211, progress5/6, state NOT_FINISHED, timer64/64 on top row. Logical dimensions 18x19; flow source is color4 `(8,0)` with seed6 `(8,1)`, so initial travel is downward.
- Four cups: left-facing-board openings `(1,7)` and `(1,12)` (cups at left edge), right opening `(16,10)`, and bottom opening `(8,17)`.
- Movables: selected L-A cells `(8,5),(8,6),(9,6)` (`└`); inactive L-B `(9,14),(8,15),(9,15)` (`┘`); vertical gray bar x13,y4..7; composite horizontal guide at y10 with cells `8,8,4,8,8` across x6..10 (central color4 moves with it).
- No L6 action has yet been taken. Cheapest discriminating probe is ACTION5 on the untouched layout. Prediction/hypothesis: source descends to `(8,4)`, L-A diverts it horizontally (likely right), and the vertical bar may then split it; animation will establish the L and perpendicular-bar rules. Settled board should restore with selected L-A unchanged.
- Do not RESET unless unavoidable.