# Working model

- **Checked:** ACTION1/2/3/4 = Up/Down/Left/Right. A valid move shifts the 3x3 color-9 player one graph edge (6 pixels), restores the old node, and rotates its color-4 pip. Color 5 is wall/background; color 14 is the goal.
- **Checked through level 8:** Color-8 + pip-15 is a static oriented enemy. Its adjacent node in the pip direction is lethal; entering the enemy's own node safely captures it. Static enemies can impose capture dependencies by threatening one another.
- **Checked through levels 4-6:** Color-12 + pip-15 advances one edge on its straight line after every valid player move, ignores side branches, and flips immediately at line endpoints. A destination equal to its **next** node is lethal (level-6 GAME_OVER). Earlier notes also banned its current node, but raw history never tested that; final-level solvability instead requires that entering a node it vacates is safe. Treat current-node safety as strongly inferred until the planned step-17 test.
- **Checked through level 8:** Mobiles persist while overlapping other entities even if rendering hides one.
- **Checked movement, revised target rule:** Color-13 + pip-15 is dormant until the player ends anywhere on its unobstructed forward ray (`15→11`, no immediate motion). It then advances one displayed-pip edge after each valid move. Level-7's only discriminating turn and final-level solvability indicate it reorients along a shortest path to the player's **previous/departed node** (follows the trail), not the player's new node; this remains strongly inferred until final-level step 20 directly distinguishes the models. Avoid both its current and forecast next node.
- **Checked:** A border-wide color-6 strip is the action timer; edge-only changes are HUD.

# Working memory

- Level 9/final (8/9), fresh. Player `(34,35)` facing Left; goal `(34,41)`; timer 64. Dormant follower/pursuer `(28,23)` faces Down and is unavoidably activated by first Left to `(28,35)`. Three straight mobiles start `(28,17)L`, `(46,17)L`, `(46,23)D` with common phase period 8. Statics: `(28,41)R` threatens the goal; `(28,47)U` threatens the first static, so capture lower then upper.
- Exact BFS using trail-following color-13 and only-next-node mobile lethality gives the 29-move route `L L U U R D D L U U R U U R R R D D R D L D L D D L L U R`. It is robust to pursuer shortest-path tie order.
- Planned segmentation: first execute moves 1-8 `LLUURDDL`; then 9-16 `UURUURRR`; move 17 `D` is the deliberate test of entering the horizontal mobile's current `(46,17)` as it vacates to `(40,17)`; moves 18-20 `DRD` reach the direct old-vs-new target discriminator (pursuer at `(46,23)` should face Right only under trail-following); then finish `LDLDDLLUR`.
