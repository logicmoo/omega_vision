# Working model

- **Checked:** ACTION1/2/3/4 = Up/Down/Left/Right. A valid move shifts the 3x3 player one graph edge (6 pixels), restores the old node to color 0, preserves the midway color-2 connector, and rotates the color-4 pip to the movement edge. Color 5 is wall/background; color-14 is the level goal.
- **Checked through level 3:** Color-8 bodies with color-15 facing pips are static oriented enemies. A live enemy threatens the adjacent graph node in its facing direction. If the player enters that forward node, the enemy lunges into it, changes pip 15->11, erases the player, and causes GAME_OVER. Entering the enemy node from any non-forward side safely captures/replaces it. Enemies can have overlapping dependencies: remove the enemy whose threat covers another enemy's node first.
- **Checked:** Level 3 was solved after the automatic reset by exact BFS over `(player node, live-enemy mask)`; all 19 predicted moves and three safe captures succeeded, advancing to 3/9. This validates the one-node threat/capture model.
- **Checked:** Bottom color-6 row is a shrinking action timer, reset to 64 each level/attempt and usually consuming 1-2 cells per move. Batch known-safe routes.
- **New on level 4, untested:** A sprite with eight color-12 cells and a color-15 facing pip appears. Do not assume it obeys the color-8 rule; its distinct body color likely signals a new mechanic.

# Working memory

- Level 4 (3/9), fresh timer. Player `(22,41)` facing Right; goal `(22,23)`.
- Parsed graph nodes: bottom chain `(22,41)-(28,41)-(34,41)-(40,41)-(46,41)`; right loop rises via `(46,35),(46,29)` and reconnects at `(40,29)`, while direct vertical nodes are `(40,41)-(40,35)-(40,29)`. New color-12/15 sprite occupies `(40,23)` facing Down. Upper graph continues through `(34,23),(28,23)` to goal and has a loop via y=17. A normal color-8 enemy at `(28,17)` faces Down and threatens `(28,23)`.
- If the color-12 sprite behaved exactly like color 8, its threatened node `(40,29)` would cut every path, so it must differ or be manipulable. The lower right loop probably supports the new mechanic, but there is not yet evidence for which route is safe.
- First three Rights to `(40,41)` are unavoidable for either direct or loop approaches. Use them as a guarded probe: predict the color-12 sprite remains at `(40,23)` when the player first aligns three edges below it. Stop there to analyze whether it moves/reacts before choosing direct vertical versus right loop.
