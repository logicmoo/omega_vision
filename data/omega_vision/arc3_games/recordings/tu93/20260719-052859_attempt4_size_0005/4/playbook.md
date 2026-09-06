# Working model

- **Checked through level 2:** ACTION1/2/3/4 = Up/Down/Left/Right. A valid action moves the 3x3 player one maze edge (6 pixels), vacates its old node to color 0, leaves the intervening color-2 connector unchanged, and puts the color-4 pip on the movement-facing edge. Color 5 is wall/background.
- **Checked:** Maze graph nodes are 3x3 color-0 patches (or occupied by a sprite/goal); color-2 3x3 patches midway between nodes are open edges. Entering a color-14 goal completes the level (levels 1 and 2 both advanced this way).
- **Checked on level 2:** Color-8 bodies with a color-15 facing pip are static oriented enemies. They do not patrol, react to proximity, or attack along a line of sight. Entering an enemy node from a direction other than the side its pip faces is safe at least for a perpendicular flank: moving north into a west-facing enemy replaced it with the player and removed all colors 8/15.
- **Strongly supported by geometry, not directly tested:** Entering from the side the enemy faces (a head-on encounter) is hazardous. Prefer enemy-free routes; if an enemy blocks all routes, approach via a provided flank branch. Do not spend a life testing head-on contact.
- **Still unresolved:** It is not yet directly known whether all enemies must be removed before a goal works. They behave like optional obstacles, and level 3 provides a shortest goal route avoiding all of them; reaching that goal is the cheapest safe discriminator.
- **Checked:** Bottom row color 6 is a shrinking timer/budget, reset to 64 on each level. It usually loses 1 cell and periodically 2 per action; batch solved routes.

# Working memory

- Level 3 (2/9), fresh timer. Player center `(43,43)`, facing Up. Goal center `(25,43)`.
- Static enemies: `(25,25)` facing Right, `(31,25)` facing Down, and `(13,37)` facing Right.
- Parsed graph BFS while treating all enemy nodes as blocked gives a 9-edge shortest safe route: `U U L L L L D D R`, through centers `(43,37),(43,31),(37,31),(31,31),(25,31),(19,31),(19,37),(19,43)`, then the goal. There are other equal routes, but this one never enters an enemy node.
- Commit this route with per-move position expectations and expect level count 3. If the final Right enters/reaches the goal but the level does not advance, that specifically establishes that enemies are mandatory; then compute a minimal safe capture tour from the resulting state rather than guessing.
