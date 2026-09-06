# Working model

- **[Checked]** Seven levels; only `ACTION6(x,y)`. The top color-9 edge line is a per-attempt click budget; ignore it as gameplay.
- **[Checked]** Route/transform a colored 14-cell plug into its complementary socket. Editable command columns execute left-to-right when the color-9 launch disk at `(57,58)` is clicked. Each cap/stem segment toggles `1<->5`. A failed ordinary program restores the plug but preserves program bits; success advances the level.
- **[Checked]** One command is the complete three-row column (top/middle/bottom pair). Codes: NO-OP=`[(1,1),(1,1),(1,1)]`; LEFT=`[(5,1),(1,1),(1,1)]`; DOWN=`[(5,5),(1,1),(1,1)]`; RIGHT=`[(1,5),(1,1),(1,1)]`; UP=`[(5,1),(1,1),(1,5)]`; SHRINK=`[(5,1),(1,5),(1,1)]`; GROW=`[(1,1),(1,5),(1,1)]`; ROTATE-clockwise=`[(5,1),(5,1),(1,1)]`; RECOLOR-to-swatch=`[(5,5),(5,5),(5,5)]`. Scale changes preserve top-left.
- **[Checked UI]** Yellow patch position identifies cardinal-move demonstrations; a single center dot demonstrated SHRINK. Selector demonstrations run a locked color-4 example and expose the selected operation's repeated code.
- **[Checked]** Level 5 solution was `DOWN,DOWN,DOWN,ROTATE,RECOLOR,GROW`: the scale-1 plug crossed the wall, then became the scale-2 color-15 downward complement. It completed at step 82.
- **[Unresolved new mechanic]** Level 6 introduces 4x4 half-color-11 checker tiles. Their behavior is not present in earlier log history; do not assume portal/checkpoint/collectible semantics until one controlled launch tests one.

# Working memory

- Level 6 (counter `5/7`) began at step 82. Command columns are `x=[34,39,44,49,54,59]`, all currently NO-OP. Timer reset to 61 color-9 cells.
- Treat the playfield as tiles `(c,r)` with top-left `(33+4c,4+4r)`, `c,r=0..6`. The movable color-11 plug is at `(0,6)` (pixel bbox `x33..36,y28..31`), and its matching stationary socket accepts the same orientation at `(1,1)` (`x37..40,y8..11`).
- **[Checked geometry]** Color-6 blocked tiles are `(1,0),(3,1),(5,1),(1,2),(3,2),(5,2),(1,3),(3,3),(5,3),(1,4),(5,4),(0,5),(1,5),(2,5),(3,5),(5,5)`. With ordinary one-tile moves, the shortest source-to-socket route is 12 moves, exceeding six columns.
- Checker tiles are at `(5,6)`, `(4,4)`, `(5,0)`. The first is reached cleanly by `RIGHT` five times. **Current deliberate probe:** encode `RIGHT,RIGHT,RIGHT,RIGHT,RIGHT,NO-OP` and launch. Predict the five ordinary frames end on checker `(5,6)`; the settled result will discriminate whether checker means checkpoint, portal, collectible, or ordinary failed endpoint. Do not yet plan beyond that unknown result.
- Ruled out from geometry alone: a direct six ordinary moves to the socket; color-6 tiles are traversable; a transformation is required (the plug and socket already match in color/scale/orientation).
