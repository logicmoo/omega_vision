# Working model

- **Checked (step 0):** Only `ACTION6(x,y)` is available. The settled board is 64x64.
- **Checked (step 0):** The main playfield is a bordered 9x8 checkerboard: logical columns have centers x=15/19/23/27/31/35/39/43/47 and rows centers y=10/14/18/22/26/30/34/38.
- **Checked (step 0):** Yellow/color-11 shapes are aligned on logical column 4: a small arch-like 4x4 shape at logical (4,1), bbox (30,13)-(33,16), and a larger crown/basket-like shape centered near logical (4,6), bbox (29,33)-(34,37).
- **Checked (step 0):** There are five two-color T-like indicators below the board, centered at x=21,26,31,36,41; initial color pattern is 5,1,5,1,1. Their function is unknown.
- **Checked (step 0):** A color-9 61-cell strip at y=1 is likely a timer/action-budget HUD (not yet observed changing). A large color-9 mouse/bomb-like icon is below the controls.
- **Assumed, not yet tested:** One yellow shape is a movable piece and the other is its destination/catcher. The checkerboard may encode grid movement; the opening may be a tutorial with both aligned vertically. The outside vision model's falling-object interpretation and a chess-piece/target interpretation are both live hypotheses.

# Working memory

- Level 1, 0/7 complete, fresh attempt at step 0.
- First deliberate probe: click the center of the small upper yellow arch at (31,14). This is the common actionable object under both leading interpretations: it may select/drop/move the upper piece, or it may be the destination clicked to move the lower crown. Predict a visible yellow-object change or immediate level completion; inspect animation and settled diff afterward.
- Ruled out: nothing yet.
- Do not click the top HUD strip or blindly toggle the five indicators until object-click behavior is known.

[END PLAN]
