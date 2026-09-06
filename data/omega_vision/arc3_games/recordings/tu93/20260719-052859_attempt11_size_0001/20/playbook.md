# Working model

- **Checked:** ACTION1/2/3/4 = Up/Down/Left/Right. A valid move shifts the 3x3 color-9 player one graph edge (6 pixels), restores the old node, preserves color-2 connectors, and rotates its color-4 pip to the movement edge. Color 5 is wall/background; color 14 is the goal.
- **Checked through level 7:** Color-8 body + color-15 pip is a static oriented enemy. Its adjacent node in the pip direction is threatened: entering that node causes a lunge and GAME_OVER. Entering the enemy's own node safely captures/replaces it. Other enemies can overlap it.
- **Checked through levels 4-6:** Color-12 body + color-15 pip is a straight mobile. After every valid player move it advances one straight graph edge; blocked input freezes it. It ignores branches, flips immediately at an endpoint, then returns. The player's destination must be neither its current nor next node.
- **Checked through level 6:** Mobiles persist when sharing a node with another mobile or a static enemy. Rendering may show only one occupant; track logical entities until they separate.
- **Checked on level 7:** Color-13 + pip-15 is a dormant oriented pursuer. Ending a move anywhere on its unobstructed forward graph ray activates it (`15→11`) without immediate motion. On every later valid move it advances one edge along the displayed color-11 pip after the player animation, then rotates toward the player's new location along a shortest graph path. An equal-distance choice preserves its incoming heading when possible. The settled pip reliably forecasts its next edge. Level 7's fully simulated route passed all predictions and advanced to 7/9.
- **Checked:** A border-wide color-6 strip is the action timer; edge-only changes are HUD.

# Working memory

- Level 8 (7/9), fresh. Player `(15,45)` facing Right; goal `(27,15)`; timer 64. Static color-8 at `(21,33)` faces Down and threatens `(21,39)`. Dormant color-13 at `(39,21)` faces Down; its forward ray is `(39,27),(39,33)`.
- Exact BFS over `(player, static-alive, pursuer position/heading/activation)` gives a 21-move finish: `R R U U R R L L L D D R U U R R U U U L L`. It first activates at `(39,33)`, retreats left while the pursuer follows, captures the static at `(21,33)`, loops around the now-open lower cycle to gain the lead, then passes upward behind the pursuer.
- Predicted pursuer states after activation and each later move: activation `(39,21)D`; then `(39,27)D,(39,33)L,(33,33)L,(27,33)L,(21,33)D,(21,39)D,(21,45)R,(27,45)U,(27,39)U,(27,33)R,(33,33)R,(39,33)U,(39,27)U,(39,21)U,(39,15)L`. Every player destination avoids both its current and forecast next node; final Left reaches the goal and should advance to 8/9.
