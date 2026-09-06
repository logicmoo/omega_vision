# Working model

- **[Checked, step 0]** The only available input is `ACTION6(x,y)` (a grid click); its effect is not yet established. The game requires 7 level completions.
- **[Checked, step 0]** The main panel contains a 9-by-8 checkerboard (4x4-pixel cells, x=14..49 and y=9..40). A color-11 upper piece at bbox x=30..33,y=13..16 and a complementary color-11 receptacle at x=29..34,y=33..37 are vertically aligned.
- **[Checked geometry; assumed objective]** Translating the upper piece down exactly 20 pixels (5 board cells) into x=30..33,y=33..36 fills every hole in the lower receptacle, producing a solid 6x5 color-11 rectangle. This strongly suggests the objective is to put the piece in the receptacle.
- **[Checked, interpretation unconfirmed]** Five small two-color T-shaped glyphs below the board have states `[5,1,5,1,1]` at centers x=`[21,26,31,36,41]`. Treating color 5 as 1 and reading least-significant bit first encodes 5, the required board-cell displacement, but it is not yet known whether these are controls or a clue.
- **[Assumed]** The color-9 disk below and the color-0 bent line may be decoration/a character with a speech-bubble tail, not necessarily a control.

# Working memory

- Level 1, fresh attempt at step 0. Upper piece center is about (31,14); target cavity starts at (30,33).
- Next probe: click the upper piece once. Hypothesis: this selects the movable piece (or advances it downward); expect a visible selection/movement rather than a lethal submission. Use the resulting diff to distinguish click-to-select from direct stepping.
- Ruled out: nothing yet.
- Do not manipulate the five glyphs or click the blue disk until the piece-click probe clarifies whether the board itself is interactive.
