# Working model

- **Checked:** ACTION1/2/3/4 = Up/Down/Left/Right. A valid move shifts the 3x3 color-9 player one graph edge (6 pixels), restores the old node, preserves color-2 connectors, and rotates its color-4 pip to the movement edge. Color 5 is wall/background; color 14 is the goal.
- **Checked through level 3:** Color-8 body + color-15 pip is a static oriented enemy. Its adjacent node in the pip direction is threatened: entering that node causes a lunge and GAME_OVER. Entering the enemy's own node safely captures/replaces it. Other enemies may threaten an enemy's node, imposing capture dependencies.
- **Checked through levels 4-6:** Color-12 body + color-15 pip is a straight mobile. After every valid player move it advances one straight graph edge; blocked input freezes it. It ignores branches, flips immediately at an endpoint, then returns. The player's destination must be neither its current nor next node.
- **Checked through level 6:** Mobiles persist when sharing a node with another mobile or a static enemy. Rendering may show only one occupant; track logical entities until they separate.
- **Checked on level 7:** Color-13 + pip-15 is a dormant oriented pursuer. Ending a move anywhere on its unobstructed forward graph ray activates it (`15→11`) without immediate motion. On every later valid move it advances one edge along the displayed color-11 pip after the player animation, then rotates toward the player's new location along a shortest graph path. In the one observed equal-distance tie it preserved its incoming heading. The settled pip reliably forecasts its next edge.
- **Checked:** A border-wide color-6 strip is the action timer; edge-only changes are HUD.

# Working memory

- Level 7 (6/9). Player `(37,43)` facing Right; active pursuer `(31,37)` facing Down; timer 51. Goal `(49,31)`. Static color-8 at `(43,25)` faces Left and threatens `(37,25)`.
- Latest `D,R` behaved exactly as the shortest-path pursuer model predicted. At the first tie the pursuer chose Down, preserving heading, so the next Up is safe.
- Computed collision-free finish: `U R U U U R D D`. Pursuer states after the first seven moves are `(31,43)R,(37,43)U,(37,37)R,(43,37)U,(43,31)U,(43,25)U,(43,19)R`; none equals the player's current/destination. The second Up captures the static from below at `(43,25)`; final Down reaches the goal and should advance to 7/9.
