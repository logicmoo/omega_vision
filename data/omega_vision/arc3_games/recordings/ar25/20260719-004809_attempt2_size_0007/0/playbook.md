# Working model

- **Checked through level 1:** A color-5 patterned source and a solid color-4 counterpart begin as exact horizontal reflections across the vertical color-10 divider. Directional movement is in 3-pixel logical cells. ACTION3 moved the source left and counterpart right; ACTION2 moved both down. Thus horizontal directions are mirrored across the divider while vertical directions are shared.
- **Checked through level 1:** The objective is to place the full color-4 footprint exactly over the identically shaped color-11 goal. Partial overlap on steps 13-14 did not complete; exact overlap on step 15 did, raising LEVELS from 0 to 1.
- **Checked:** The bottom color-5 edge and right color-11 edge are HUD/action budget, not gameplay. One right-edge cell changes 11->5 from top downward per ordinary action; it resets each level and allows up to roughly 64 actions.
- **Checked controls:** ACTION2=down and ACTION3=left. **Strongly inferred:** ACTION1=up and ACTION4=right, with ACTION1/2 moving both source and counterpart together vertically and ACTION3/4 moving them oppositely horizontally. ACTION5, ACTION6, ACTION7 remain untested (ACTION7 is likely undo).
- **Hold loosely for later levels:** Divider location, source side, shape, and marker styling vary by level. Recompute exact footprint displacement each time. Do not assume an edge blocks an internally tracked mirrored source until tested.

# Working memory

- Level 2/8 began at step 15. Divider x=36..38 has color-0 dots along its middle column (new styling/mechanic not yet understood).
- Solid color-4 footprint bbox x=15..29,y=18..29. Its exact horizontally reflected color-5 source footprint is on the right at x=45..59,y=18..29 (eight hollow 3x3 tiles). Exact matching color-11 goal bbox is x=3..17,y=42..53.
- Required color-4 displacement is 4 macro-cells left and 8 down. Under the established mirror controls this calls for 4x ACTION4 + 8x ACTION2. However, the source would need an internal bbox x=57..71, beyond visible x=62; whether clipping/off-board movement is permitted is not established.
- Next deliberate, goal-directed probe: one ACTION4. It should safely fit the source at x=48..62, move color 4 left to x=12..26, leave the divider fixed, and consume timer cell y=0. If confirmed, test one additional ACTION4 specifically at the visible boundary before committing.
