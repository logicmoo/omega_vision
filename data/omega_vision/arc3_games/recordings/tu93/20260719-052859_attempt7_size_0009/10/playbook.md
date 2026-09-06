# Working model

- **Checked:** ACTION1/2/3/4 = Up/Down/Left/Right. A valid move shifts the 3x3 color-9 player one graph edge (6 pixels), restores the old node, preserves color-2 connectors, and rotates its color-4 pip to the movement edge. Color 5 is wall/background; color 14 is the goal.
- **Checked through level 3:** Color-8 body + color-15 pip is a static oriented enemy. Its adjacent node in the pip direction is threatened: entering that node causes a lunge and GAME_OVER. Entering the enemy's own node from a safe side captures/replaces it. Other enemies may threaten an enemy's node, imposing capture dependencies.
- **Checked through levels 4-5:** Color-12 body + color-15 pip is a mobile oriented enemy. After every valid player move it advances one straight graph edge; a blocked input freezes it. It ignores side branches, flips its pip immediately upon reaching a straight-track endpoint, then moves back next tick. Avoid using any mobile's current or next node as the player's destination.
- **Checked in level 5:** Multiple mobiles can occupy the same node and visually occlude one another without being destroyed; they remain logically distinct and later separate. A goal hidden by a mobile is restored when vacated. Exact time-expanded BFS tracking all hidden mobiles solved level 5 at t=29, advancing to 5/9.
- **Checked:** A border-wide color-6 strip is the action timer. It resets to 64 each level/attempt and usually loses 1-2 cells per action; edge-only changes are HUD.

# Working memory

- Newly entered level 6 (5/9), no move yet; timer 64. Player `(49,19)` facing Left, goal `(13,19)`.
- Mobiles: M1 `(31,25)` Up on three-node vertical track `y=13,19,25` (period 4); M2 `(49,43)` Left on seven-node horizontal track `x=13..49` (period 12).
- Static enemies: E0 `(25,31)` Down (threatens `(25,37)`); E1 `(43,31)` Down (threatens `(43,37)`); E2 `(25,43)` Up (threatens `(25,37)`); E3 `(31,43)` Left (threatens `(25,43)`); E4 `(25,49)` Up (threatens `(25,43)`); E5 `(31,49)` Up (threatens `(31,43)`).
- Direct top crossing is parity-blocked by M1 at `(31,19)`, so the route must bypass below. Under the provisional hypothesis that mobile/static overlap preserves both just like mobile/mobile overlap, exact BFS finds a 28-move shortest route and begins `L L R L R L D...`.
- **Unknown interaction to probe on-route:** On tick 3, M2 enters E3's node `(31,43)`. Use the candidate-shortest prefix `L,L,R`; expect all player/M1 results but leave that lower collision unconstrained. Then inspect whether E3 persists, is captured, or affects M2 before committing.