# Working model

- **Checked objective/UI:** RUN executes editable columns left-to-right on the solid color-11 notched piece. Success occurs when it enters the matching cavity inside the color-11 outline catcher with the right position, orientation, and scale. A failed run restores the initial playfield while preserving program controls. The changing color-9 strip at `y=1` is the click/run budget, not a piece.
- **Checked control encoding:** Each T has independently toggled head/stem colors `1↔5`. Name a pair `(11,15,51,55)` as digit `(0,1,2,3)` and a three-T column as `top + 4*middle + 16*bottom`. This is only bookkeeping; command effects can depend on piece state/orientation.
- **Checked movement on the scale-1 UP-notched solid piece (levels 2-3):** value0 stays; value1 moves RIGHT one logical cell; value2 moves LEFT one; value18 moves UP one. Value5/7 move RIGHT two. Values9/10 rotate the UP notch LEFT/RIGHT. Many tested values were inert on that source; 15 and63 sent it out of bounds.
- **Checked size behavior:** value4 increases the piece's integer pixel scale by one (scale1→scale2, then scale3, anchored at its top-left; arena clipping explained later frames). Value8 is the color-reversed candidate for decreasing scale, but on the only historical scale1 test it was clamped/no-op, so actual shrinking is **still assumed, not checked**.
- **Checked DOWN behavior:** In level1, single-T digit3 (equivalent to three-T value3 with other rows zero) moved the scale1 DOWN-notched solid piece DOWN one logical cell on every use. Do not generalize this to other orientations without evidence.
- **Checked progression:** Level1 used five value3/DOWN commands. Level2 used four value18/UP commands. Level3 used `[18,1,1,1,1,18]` through a wall gap. Timer exhaustion causes GAME_OVER plus an automatic current-level restart; never manually RESET immediately afterward.

# Working memory

- Level 4, `3/7` complete, fresh settled board at step120. Six editable columns are value0 at centers `x=(34,39,44,49,54,59)`; T head/stem y-pairs are `(33,36),(39,42),(45,48)`. RUN center is `(57,58)` and timer is full through `x=61`.
- The movable solid is a scale2 DOWN-notched 14-cell mask: bbox `(45,8)-(52,15)`, top-left logical `(3,1)`. The catcher outline is bbox `(40,24)-(45,28)` around the matching scale1 cavity `(41,24)-(44,27)`, logical `(2,5)`.
- Color6 forms a full wall on logical row4 (`y=20..23`) except the one-cell gap at logical column2 (`x=41..44`). If value8 really shrinks, the six-column candidate is `[8,2,3,3,3,3]`: shrink at `(3,1)`, LEFT to column2, then DOWN four times through the gap into the catcher.
- **Current deliberate probe:** configure only col0=value8 by clicking middle head `(34,39)`, then RUN `[8,0,0,0,0,0]`. Predict animation frame1 is the scale1 DOWN-notched solid at bbox `(45,8)-(48,11)`; identities leave it there, then failure restores the scale2 start. This directly checks shrinking before committing the route. The left clue shows a DOWN-notched color4 glyph with three fixed value17 columns, but its role is unresolved and is not being assumed.

[END PLAN]