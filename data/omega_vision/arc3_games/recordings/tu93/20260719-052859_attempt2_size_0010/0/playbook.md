# Working model

- **Checked through level 1:** ACTION1=Up, ACTION2=Down, ACTION3=Left, ACTION4=Right. All four mappings were exercised successfully.
- **Checked:** Maze nodes are homogeneous 3x3 color-0 patches; neighboring nodes are 6 pixels apart and an open edge is a 3x3 color-2 connector midway between them. Color 5 is wall/background. A valid directional action moves the 3x3 player (eight color-9 cells plus one color-4 facing pip) one graph edge / 6 pixels, crossing without consuming the connector. The vacated node restores to color 0, and the pip rotates to the movement side.
- **Checked:** Entering the 3x3 color-14 goal completes the level. Level 1 was solved by BFS in the graph and advanced 0/9 -> 1/9 on the goal-entry action.
- **Checked:** Bottom row color 6 is a shrinking timer/budget and resets to 64 on a new level. During level 1 it usually lost 1 cell per move and periodically 2 (64 to about 41 over 18 moves); do not rely on an exact one-per-action rate, and batch known routes.
- **New on level 2, untested:** A second agent-like sprite has eight color-8 cells and a color-15 pip. Its pip initially faces west. Best hypothesis is an autonomous moving hazard; test its response before planning around it.

# Working memory

- Level 2 (1/9), fresh board and full timer. Player center `(13,34)`, facing Up; goal center `(49,22)`. New color-8/15 agent center `(37,28)`, facing Left.
- Graph: the central row y=28 is the chain x=`13-19-25-31-37-43-49`; goal is one edge north of `(49,28)`. Player starts one edge south of `(13,28)`. A lower detour/loop has nodes `(25,34)-(31,34)-(37,34)` with vertical edges to those same x positions on y=28.
- Ignoring the second agent, shortest player route is `U R R R R R R U` (8 moves), but it runs through the agent's initial node.
- Next move `U` is forced (the player's start is a dead-end), so use it as one safe probe. Prediction under the autonomous-hazard hypothesis: player moves to `(13,28)` while the color-8 agent advances west from `(37,28)` to `(31,28)`, preserving its west-facing pip. If it stays still or responds differently, re-derive from the observed diff rather than assuming a patrol rule.
