# Working model

- **[Checked, step 0]** Only `ACTION6(x,y)` is available. The playfield is a 20-slot rectangular ring of 4x4 colored tiles: clockwise from the marked upper-left slot, centers are `(13,20),(19,20),...,(49,20),(49,26),...,(49,44),(43,44),...,(13,44),(13,38),(13,32),(13,26)`.
- **[Checked, step 0]** Four 2x2 color-11 corner marks surround the upper-left ring slot (center `(13,20)`). Exactly one ring tile is color 11, currently at `(43,20)`, five clockwise slots away. Large symmetric arrow-shaped objects lie at left `(2..7,29..36)`, color 8, and right `(56..61,29..36)`, color 14.
- **[Strong hypothesis, not yet action-tested]** The corner marks designate the target slot and their color (11) designates the tile to align there. Clicking the left/right arrows rotates all ring tiles one slot counterclockwise/clockwise. A level completes when the unique color-11 tile reaches the marked slot. The shortest initial solution should therefore be five clicks of the left arrow, because color 11 is at clockwise index 5.
- **[Assumed]** The eight small marks along the top likely show the eight levels (win requirement is 8), rather than gameplay pieces. The full left edge is HUD/border and should not be clicked.

# Working memory

- Level 1, 0/8 complete, fresh attempt at step 0. Ring clockwise colors from the marked slot: `[1,2,10,9,15,11,2,15,9,10,2,15,10,9,9,1,1,2,15,10]`.
- Next deliberate probe: click center of the left arrow `(5,32)`. Prediction under the rotation model: every tile shifts one slot counterclockwise; marked slot changes `1→2`, and the color-11 tile moves from `(43,20)` to `(37,20)`. If confirmed, commit the remaining four left clicks (unless completion occurs sooner).
- Ruled out: nothing yet; there is no prior action history beyond RESET.
[]
