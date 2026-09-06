# Working model

## Checked against log
- Geometry is on 4x4 logical cells (`X=x//4`, `Y=y//4`), except a one-pixel border/budget strip and source blocks clipped by that strip.
- Color 4 is the fixed emitter/back of a color-6 flow seed. On ACTION5, color 6 grows one logical cell per animation frame directly **away from color 4**, leaving a trail.
- Horizontal bars are flow blockers/guides. Color 9 is the currently active/movable bar; during ACTION5 it becomes color 8 like the other inactive blockers. ACTION4 moves the active bar right by one logical cell (+4 px). ACTION3/vertical mappings remain untested.
- Flow blocked head-on by a horizontal bar spreads along the face of that bar in both directions, then continues forward immediately outside its endpoints. Thus a bar occupying inclusive columns `[L,R]` routes one incoming stream to `L-1` and `R+1`.
- Color-11 U shapes are receptacles. Flow entering an opening is contained by the three walls; flow striking a wall branches around it and can leak to the terminal color-1 boundary. Leakage causes warning flashes and the setup is restored with no level gain. ACTION5 successfully completes a level when all output streams are contained.
- Level 1 confirmed this exactly: downward source x=9, bar length 5 at x=6..10 produced streams x=5,11 into two cup openings and raised progress to 1/6.
- A color-14 full-width border is the move budget; it recedes by roughly 2-3 physical cells/action and resets each level. A failed ACTION5 costs budget but restores placements without GAME_OVER.

## Assumed / to test
- ACTION6 clicking an inactive color-8 bar likely selects it (8->9, old 9->8). This is strongly suggested by multiple bars but not yet tested.
- Likely ACTION1=up, ACTION2=down, ACTION3=left by standard convention; only ACTION4=right is confirmed.

# Working memory
- Level 2 freshly loaded at step 5, progress 1/6, full bottom budget strip. Flow points upward: emitter color4 at logical (10,15), seed color6 at (10,14). Three inverted cups near top have openings x=4,8,12.
- Bars: active length-5 at row9 x=5..9; inactive length-3 at row6 x=7..9; inactive length-3 at row4 x=2..4.
- Computed routing network: bottom length-5 should be x=6..10, splitting source x10 into x5,x11. Middle length-3 should be x=9..11, splitting x11 into x8,x12. Top length-3 should be x=5..7, splitting x5 into x4,x8. Final unique streams x4,x8,x12 match all openings.
- Cheapest assignments from current positions: active bottom right 1; middle right 2; top right 3. Need select bars between adjustments.
- Current plan: ACTION4 moves bottom right once, then ACTION6 click middle bar around physical (32,25). Prediction for click: middle becomes color9 and bottom becomes color8. Stop to verify selection before committing remaining moves.
- Ruled out this level: no probes yet.
