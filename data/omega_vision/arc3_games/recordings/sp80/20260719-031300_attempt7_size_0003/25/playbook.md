# Working model

## Checked against log
- Logical scale/origin varies by level. L5 is a 19x19 interior with scale 3 and physical origin `(5,5)`; logical `(x,y)` center is physical `(6+3x,6+3y)`.
- ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right by one logical cell; ACTION5 starts flow; ACTION6 selects the clicked movable entity. Selected material is color9, inactive gray is color8, and this level's inactive special L is color15.
- On ACTION5, color6 advances upward from each color4 source, retaining a trail. Against a horizontal gray bar `[a..b]`, an incoming column is replaced by outputs `a-1` and `b+1`; a flush-edge output is suppressed. Old trail is not an obstacle. Normal routing is implemented in `scratch/flow.py`.
- L5 has sources x5/x13 at y17; top cup openings x5/x11/x15 and a left cup opening x1,y11. All four cups must fill.
- The color15 L at cells `(5,10),(6,10),(6,11)` hit from below at x5 emits a persistent LEFT horizontal ray along y11, filling the side cup. Crucial correction from step190: it does **not** also send an ordinary upward escape branch; the prior model asserting that was falsified when top cup x5 flashed empty.
- Gray bars can be cascaded. For source13, bottom A length4 `[10..13]` gives `{9,14}`; middle B length3 `[12..14]` changes 14 to `{11,15}`; top C length5 `[6..10]` changes 9 to `{5,11}`. Thus exact top outputs are `{5,11,15}` with no leak.
- Timer is the color14 strip on row63. It fell from 64 at reset step154 to 41 after step190; roughly two input actions consume one timer cell. ACTION5 at only 7 cells (step153) caused immediate GAME_OVER, so flow must be launched with a substantial margin.
- Completed: L1 split, L2 cascade, L3 multi-source/edge suppression, L4 composite-bar cascade. Progress is 4/6.

## Still assumed / guarded live
- Proposed cascade rows C y3, B y5, A y7 have one empty row between successive bars, so each bar's lateral spread should clear the lower bar. Placement/movement expectations will stop on any collision.

# Working memory
- Current level5 after step190 failed flow, state NOT_FINISHED, progress 4/6, timer 41/64. Do not RESET (a second reset after the automatic reset risks returning the whole game to L1).
- Settled positions: B len3 `(x12..14,y3)`; A len4 `(x8..11,y5)`; C len5 `(x0..4,y8)`; selected red L `(5,10),(6,10),(6,11)`. Sources/cups fixed as above.
- Step190 evidence: side cup and top x11/x15 filled during animation, but top x5 flashed black; board then restored. This directly rules out the former claim that red also emits an upward x4 branch.
- Next exact plan: A -> `[10..13],y7` (D2 R2); B -> `[12..14],y5` (D2); C -> `[6..10],y3` (U5 R6); ACTION5. Cost 20 setup inputs plus flow, leaving about 27 timer cells. Predicted routes: source5 -> red -> side cup; source13 -> A `{9,14}` -> B `{9,11,15}` -> C `{5,11,15}` -> all top cups.
- Ruled out: previous red-only-upward target; L rotation/halo; movable sources/cups; sideways cup attraction; direct L placement near cup.