# Working model

- **[Checked]** Seven levels; only `ACTION6(x,y)`. The top color-9 edge line is a per-attempt click budget.
- **[Checked]** Route/transform a colored plug into its complementary socket. Editable command columns are evaluated left-to-right by the color-9 launch disk. Each cap/stem segment toggles `1<->5`. Failed programs reset the plug but preserve bits; success advances the level.
- **[Checked]** A 3-row vertical column is one complete operation code. Use the bottom-left selector demonstrations to learn full codes; isolated pair-row interpretations are unsafe.
- **[Checked codes]** Top/middle/bottom pair lists: NO-OP=`[(1,1),(1,1),(1,1)]`; LEFT=`[(5,1),(1,1),(1,1)]`; DOWN=`[(5,5),(1,1),(1,1)]`; RIGHT=`[(1,5),(1,1),(1,1)]`; UP=`[(5,1),(1,1),(1,5)]`; SHRINK=`[(5,1),(1,5),(1,1)]`. SHRINK reduces linear scale by 1 and preserves the top-left anchor.
- **[Checked example UI]** Yellow patch position identifies cardinal moves; a single center dot demonstrated SHRINK. Other icon shapes/colors introduce transformations. Clicking a selector resets/runs a locked color-4 example and leaves its repeated columns showing that operation's exact code.

# Working memory

- Level 4 completed at step 62 with `SHRINK, LEFT, DOWN, DOWN, DOWN, DOWN`; shrink anchored the scale2 plug at top-left, allowing it through a one-cell wall gap.
- Level 5: normal yellow/right-facing plug at x49..52,y8..11. Target is a color-15 scale2 up-opening socket x47..58,y20..29. A fitting plug must end as a color-15 scale2 DOWN-facing plug at x49..56,y20..27.
- Horizontal wall y16..19 blocks all but one-cell gap x49..52. Therefore the normal plug must make three DOWN moves first (y8->12->16->20) while it fits the gap, and only then GROW to scale2. It must also ROTATE from RIGHT-facing to DOWN-facing and RECOLOR from 11 to15. Exactly six required operations match the six command columns; rotation/recolor can likely occur before or after descent, while GROW must be last/below the wall.
- Five selectors appear near centers x=`[5,15,25,35,45]`: single-dot SHRINK, solid-large GROW, bottom-patch DOWN, diamond/cross ROTATE, and color-15 swatch RECOLOR. Known DOWN need not be re-probed. Next batch intended demonstrations: click GROW `(15,58)`, ROTATE `(35,58)`, then RECOLOR `(45,58)`, predicting each updates/runs the left example and exposes its code in its own logged step. Analyze all three frame sequences/codes before programming.
