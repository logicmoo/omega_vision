# Working model

- **Checked:** ACTION1/2/3/4 = Up/Down/Left/Right. A valid move shifts the 3x3 color-9 player one graph edge (6 pixels), restores the old node, preserves color-2 connectors, and rotates its color-4 pip to the movement edge. Color 5 is wall/background; color 14 is the goal.
- **Checked through level 3:** Color-8 body + color-15 pip is a static oriented enemy. Its adjacent node in the pip direction is threatened: entering that node causes a lunge and GAME_OVER. Entering the enemy's own node safely captures/replaces it. Other enemies may threaten an enemy's node, imposing capture dependencies.
- **Checked through levels 4-6:** Color-12 body + color-15 pip is a straight mobile. After every valid player move it advances one straight graph edge; blocked input freezes it. It ignores branches, flips immediately at an endpoint, then returns. The player's destination must be neither its current nor next node.
- **Checked through level 6:** Mobiles persist when sharing a node with another mobile or a static enemy. Rendering may show only one occupant (sometimes static, sometimes mobile), so visual disappearance is not destruction. Track logical entities until later frames settle the issue; vacated underlying objects reappear.
- **Checked:** Exact BFS over player position, live-static mask, and all mobile phases solved levels 3-6. Level 6's corrected 28-action route passed every prediction and advanced to 6/9.
- **Checked:** A border-wide color-6 strip is the action timer, normally losing 1-2 cells per action; edge-only changes are HUD.

# Working memory

- Newly entered level 7 (6/9), no move yet; timer 64. Player `(13,31)` facing Right; goal `(49,31)`. One static color-8 enemy at `(43,25)` faces Left and threatens `(37,25)`.
- New color-13 body + color-15 pip at `(25,19)` faces Down; its behavior is unknown. It has only one forward graph edge initially, to `(25,25)`, so any one-edge mobile/chaser rule predicts that forced move after the first valid player action.
- Ignoring color 13, the unique 14-edge shortest goal route begins Right and uses the lower bridge before capturing the static from below: `R R R D D R U R U U U R D D`.
- Use one deliberate on-route probe: Right to player `(19,31)`. Predict color 13 moves to `(25,25)` still facing Down; inspect its animation/settled result before planning around it. Do not assume it is merely another straight color-12 patrol.