# Working model

- [Checked, levels 1-3] This is upward-scrolling navigation on 6-pixel logical tiles. Cyan (10) is open; patterned dark (5/3) is solid. The blue/yellow avatar (9/11) normally settles near y=39 while upward progress shifts the world downward.
- [Checked] ACTION3 moves one logical column west and faces west; ACTION4 moves east and faces east. A horizontal move into a column open overhead automatically rises until the next blocker, then camera-recenters. Solid same-row objects block the move.
- [Checked] ACTION6 erases a green block (14), including exposed separator edges. Removing one overhead triggers ascent. Clicking cyan or the avatar is inert. Maximum click range remains untested, so interact from an adjacent logical column when practical.
- [Checked, level 3] Red blocks (12) toggle individually with ACTION6: full rounded state is solid and can be used as a safe ceiling; sparse five-cell X state is inactive, traversable, and does not stop automatic ascent. Vertically paired toggles can be swapped (activate upper, deactivate lower) to preserve a ceiling while opening the avatar row.
- [Checked, level 3] White bodies (15) with yellow lower tips (11) are lethal overhead hazards, not safe blockers. Automatic ascent into one caused GAME_OVER. Activate red safety ceilings before crossing their columns; move around the end of a hazard row before opening a shaft.
- [Checked, levels 1-2] The color-7 plus is the exit; horizontal contact or vertical ascent into it completes a level.
- [Checked] Large diffs are camera scrolling. The bottom row is a 64-action deadline bar, filling one color-15 cell per live action and resetting each level. ACTION7 is available but still untested/likely undo. Need 9 levels total.

# Working memory

- Level 3 at step 96, 2/9 complete, HUD 29/64. Avatar is x=21, west-facing. The planned hazard-protected crossing and deactivation of overhead red at x21 succeeded; final action scrolled exactly +36.
- Current exit is centered (45,38), aligned with avatar height. A full red horizontal blocker is centered (33,39); another full red block at (33,45) is below and irrelevant. A continuous full-red ceiling at y=33 prevents accidental ascent.
- Finish: ACTION4 to x27; toggle blocker (33,39) full -> X; ACTION4 through x33, ACTION4 x39, ACTION4 into exit x45. Expected completion is 3/9.
- Ruled out: inactive red X as a safety ceiling (it permits lethal ascent); progressive destruction of red (clicks toggle); arbitrary click-to-move, avatar-click rotation, movement through green, and random environment mutation.
