# Working model

- [Checked, level 1] This is an upward-scrolling navigation/breaking game on 6-pixel logical tiles. Cyan (10) is open space; patterned dark (5/3) is solid and cannot be crossed; rounded green tiles (14) are individually breakable. The blue/yellow avatar (9/11) usually settles near y=39 while camera scrolling follows vertical progress.
- [Checked] ACTION3 moves one logical column west and faces west; ACTION4 moves one column east and faces east. Green and dark tiles collision-block horizontal movement. If a horizontal move enters a column open above, the avatar automatically rises until the next blocker; animation then recenters it and shifts the world downward by the gained height.
- [Checked] ACTION6 erases the clicked green tile, including its separator edge. It works on lateral or overhead green. Removing overhead green triggers automatic ascent; clicking cyan or the avatar is inert. Whether clicks have any range restriction is untested.
- [Checked, level 1] A color-7 plus is the exit: horizontal contact with it completed the level. The exit can be revealed by scrolling and may settle on the avatar's row near the upper boundary.
- [Checked] Camera scrolling fully explains large settled-board diffs. Bottom row is a 64-live-action budget bar (one color-15 cell per action) and resets each level. ACTION7 is available and likely undo. Need 9 levels total.
- [Assumed for level 2] New white rectangles (15) with two yellow lower pixels (11) are likely hazards/solid enemies; avoid contact until evidence says otherwise. Later levels can add mechanics.

# Working memory

- Level 2 fresh board at step 18; 1/9 complete; HUD 0/64. Avatar starts (21,39), east-facing.
- Immediate barriers are two full green rows at y=33 and y=27 across x=15..51. Above them, a dark vertical divider at x=33 splits chambers. Left chamber x=15..27 contains three new white/yellow objects centered around x=15,21,27 and y=9; right chamber x=39..51 is clear cyan to the top edge.
- Safest/shortest known route avoids the untested objects: move east three tiles to x=39, click green (39,33), rise one row to the second green, then click (39,33) again and ascend through the clear right chamber until the next blocker. Stop after the resulting scroll and inspect newly revealed terrain.
- Level 1 established direct contact with the plus exit. Ruled out globally: arbitrary click-to-move, avatar-click rotation, movement through green, and random environment mutation.
