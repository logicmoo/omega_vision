# Working model

- **Checked:** ACTION1/2/3/4 = Up/Down/Left/Right. A valid action moves the 3x3 player one maze edge (6 pixels), vacates its old node to color 0, leaves the intervening color-2 connector unchanged, and places its color-4 pip on the movement-facing edge. Color 5 is wall/background.
- **Checked:** Maze graph nodes are 3x3 color-0 patches (or occupied by a sprite/goal); midway color-2 3x3 patches encode open edges. Entering color-14 completes a level.
- **Checked from level 2 capture:** Color-8 bodies with color-15 pips are static oriented enemies. Entering an enemy's node from a side it is not facing safely captures it: player replaces the enemy and colors 8/15 disappear.
- **Checked from level 3 GAME_OVER (step 32):** An enemy threatens the *adjacent graph node in the direction its pip faces*. When the player entered that forward node, the enemy lunged one edge into it, its pip changed 15->11, erased the player, and caused GAME_OVER. It does not attack farther than one edge (earlier distant-line probes were safe). Thus exclude each live enemy's forward neighbor as well as plan a non-forward-side capture. This replaces the falsified belief that enemies had no line attack.
- **Checked:** After GAME_OVER the harness issued one RESET; the latest board is already a fresh level-3 attempt. Never reset again here.
- **Checked:** Bottom row color 6 is a shrinking action timer, reset to 64 each attempt/level and usually consuming 1-2 cells per move. Batch verified routes.

# Working memory

- Level 3 (2/9), fresh after automatic reset. Player `(43,43)` facing Up; goal `(25,43)`. Enemies: E1 `(25,25)` faces Right and threatens `(31,25)`; E2 `(31,25)` faces Down and threatens `(31,31)`; E3 `(13,37)` faces Right and threatens `(19,37)`.
- Failure cause is identified: attempted route entered E2's threatened node `(31,31)` on step 32; E2 lunged down and killed the player. Do not repeat that route.
- Exact BFS over `(player node, live-enemy mask)` used the parsed 23-node graph (at most 184 states), forbidding every live forward-threat node and removing an enemy on safe entry. The unique reachable goal state requires all three captured; shortest route is 19 moves: `U U R U L L U L L D R D L L L D R D R`.
- Intended order: reach above E1 and capture it Down; only then capture E2 Right (its node was E1's threat); after crossing E2's formerly threatened node, approach E3 from north and capture Down; then reach goal. Commit all 19 with per-step expectations. Captures occur on moves 10, 11, and 16; final move should advance to 3/9.
