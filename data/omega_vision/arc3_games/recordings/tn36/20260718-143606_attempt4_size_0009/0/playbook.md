# Working model

- **[Checked]** Seven levels, only `ACTION6(x,y)`. The top color-9 edge line is a click-budget bar; each action consumes one cell from the right.
- **[Checked]** Checkerboard puzzles route a color-11 plug into a complementary socket. Controls below are editable command columns; each cap/stem segment toggles `1<->5`. The color-9 disk launches columns left-to-right. Failed programs reset moved pieces but preserve bits; successful composition advances the level.
- **[Checked]** In 3-row banks the full vertical column is one code. Copy full codes from the colored example UI rather than interpreting isolated pair rows.
- **[Checked movement codes]** Listed top/middle/bottom pairs: NO-OP=`[(1,1),(1,1),(1,1)]`; LEFT=`[(5,1),(1,1),(1,1)]`; DOWN=`[(5,5),(1,1),(1,1)]`; RIGHT=`[(1,5),(1,1),(1,1)]`; UP=`[(5,1),(1,1),(1,5)]`.
- **[Checked example UI]** Yellow patches inside bottom-left square selectors identify the demonstrated operation/direction. Clicking a selector changes and runs the locked color-4 example; its resulting repeated column pattern is the exact code to copy. Patches on left/right/top/bottom gave the cardinal directions in levels 2-3. Later levels can introduce non-movement operations represented by other patch shapes/sizes.

# Working memory

- Level 3 completed at step 49 with `UP, RIGHT, RIGHT, RIGHT, RIGHT, UP`, crossing the one-cell gap in the vertical wall.
- Level 4 board: a large color-11 down-facing plug at bbox x45..52,y8..15 is exactly a 2x scale-up of the normal 14-cell plug (56 cells = 14*4). A normal socket at x40..45,y24..28 accepts a normal plug at x41..44,y24..27. A horizontal color-6 wall fills row4 except a one-cell gap at col2.
- Geometry strongly suggests the six-command solution: SHRINK the large plug to normal size (likely anchored to its top-left, x45..48,y8..11), LEFT one cell to col2, then DOWN four cells through the wall gap into the socket. This exactly matches the six editable columns. Do not commit until SHRINK behavior/code is demonstrated.
- Bottom-left selectors now show patches LEFT (x~5), a solid 5x5 block (x~15, likely GROW/large), DOWN (x~25), and a single center pixel (x~35, likely SHRINK/small). The left example is a normal down-facing plug. Next click the center-dot selector at (35,58), predicting a size-reduction demonstration and a readable SHRINK code; inspect all frames and the settled locked-bank pattern.
