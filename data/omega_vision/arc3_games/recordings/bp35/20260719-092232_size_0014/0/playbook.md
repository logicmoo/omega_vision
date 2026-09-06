# Working model

- [Checked, step 0] The board is a 64x64 rendering of an approximately 6-pixel logical tile grid. Main colors: dark patterned color 5, cyan 10, seven identical rounded green tiles (14), and one blue/yellow directional-looking piece at logical tile center (21,39), facing right.
- [Checked, step 0] Cyan/green logical layout (centers spaced 6): top green trio at (15,3),(21,3),(27,3); upper cyan room x=33..51 at y=3,9; green row x=33..51 at y=15; middle cyan room x=15..51 at y=21,27; a cyan neck at (45,33); lower cyan room x=15..51 at y=39,45,51,57. The blue/yellow piece starts at (21,39). Treat dark patterned tiles as likely walls and cyan as likely traversable, but this is not yet tested.
- [Checked, step 0] Supported controls are ACTION3, ACTION4, coordinate ACTION6, and ACTION7. Their effects are unknown. ACTION7 is likely undo only by convention.
- [Assumed] The blue/yellow piece is an avatar and green tiles are targets/collectibles; this matches the geometry and outside vision read, but no action evidence yet. Its yellow right edge suggests facing may matter.
- [Assumed] ACTION6 may move/select by clicked logical tile, while ACTION3/ACTION4 may turn or move horizontally. Do not build a route until one probe identifies control behavior.
- [Checked, step 0] Need complete 9 levels; current count 0/9. Bottom row is all color 0, but no evidence yet that it is a timer.

# Working memory

- Level 1, fresh attempt, avatar-like object centered at (21,39), apparently facing east.
- Next deliberate probe: ACTION6 at the adjacent cyan logical center (27,39). Hypothesis: click-to-move; prediction is a one-tile east translation preserving orientation (old footprint restores cyan and new footprint appears around x=25..29). If unchanged, click likely selects/acts rather than adjacent movement; then analyze before another action.
- Tried: none. Ruled out: none.
1 action used including RESET (step 0).
