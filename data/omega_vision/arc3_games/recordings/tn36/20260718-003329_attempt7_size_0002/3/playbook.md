# Working model

- **Checked objective/UI:** A color-11, 14-pixel notched piece is transformed by the editable program and must exactly enter the larger color-11 catcher with matching notch orientation. Program columns execute left-to-right; RUN is the large color-9 button near the lower right. Failed runs restore the initial piece while preserving controls. Timer row `y=1` spends one color-9 cell per click/run.
- **Checked control encoding:** Each T has independently toggled head/stem colors `1↔5`. For convenient naming, a T pair `(11,15,51,55)` is digit `(0,1,2,3)`, and a three-T column is `top + 4*middle + 16*bottom`. This scalar name is bookkeeping, not a complete semantic formula.
- **Checked operations needed for routing:** value0 `[11,11,11]` stays; value1 `[15,11,11]` moves RIGHT one logical cell; value2 `[51,11,11]` moves LEFT one; **value18 `[51,11,15]` moves UP one**. These preserve the piece mask/orientation. Value5/7 move RIGHT two. Value4 enlarges. Level 1 used single-T digit3 to move DOWN one; three-T value3 has not been isolated on level3, so do not rely on it yet.
- **Checked orientation/other examples:** value9 turns the UP notch LEFT in place; value10 turns it RIGHT; value32 also appears LEFT on this symmetric source. Many patterns are inert on the starting source (including 8,16,19-23,26-27,31,42,47-48,55); 15 and63 send it out of bounds. Do not infer untested operations from numeric adjacency.
- **Checked level progression:** Level1 was five DOWN moves. Level2 source `(3,5)` to catcher `(3,1)` solved with four value18/UP columns. Timer exhaustion causes GAME_OVER and an automatic current-level RESET; never manually RESET after that.

# Working memory

- Level 3, 2/7 complete, fresh board at step110. Full timer remains through `x=61`; all six editable columns are value0. Centers are `x=(34,39,44,49,54,59)` with T head/stem y-pairs `(33,36),(39,42),(45,48)`. RUN center is `(57,58)`.
- Arena is a 7×7 logical checkerboard (`x` blocks 33..60, `y` blocks 4..31). Piece starts at logical `(1,4)`, pixel bbox `(37,20)-(40,23)`, UP notch. Matching catcher is logical `(5,2)`, fitting bbox `(53,12)-(56,15)`.
- Color6 is a solid vertical wall at logical column3 on rows0-2 and4-6; only row3 is a gap. Computed shortest route is `UP, RIGHT, RIGHT, RIGHT, RIGHT, UP`: `(1,4)→(1,3)→(2,3)→(3,3)→(4,3)→(5,3)→(5,2)`. This uses only checked operations and avoids every obstacle.
- Configure values `[18,1,1,1,1,18]`: col0 clicks `(34,33),(34,48)`; cols1-4 click top stems `(39,36),(44,36),(49,36),(54,36)`; col5 clicks `(59,33),(59,48)`; then RUN `(57,58)`. Predict level count3.

[END PLAN]