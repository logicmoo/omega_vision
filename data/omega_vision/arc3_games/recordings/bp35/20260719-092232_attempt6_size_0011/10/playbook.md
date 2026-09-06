# Working model

- [Checked, levels 1-4] This is gravity-driven navigation on 6-pixel logical tiles. Cyan (10) is open; patterned dark (5/3) is solid. The blue/yellow avatar (9/11) normally settles around logical center y=39 under upward gravity; long vertical travel scrolls the world and recenters it (about y=39 upward, y=29 downward).
- [Checked] ACTION3 moves one logical column west and faces west; ACTION4 moves east and faces east. A horizontal move into a column open in the gravity direction automatically travels vertically until the next blocker, with camera scrolling if needed. Solid same-row tiles block movement.
- [Checked] ACTION6 erases a green rounded block (14), including a partially exposed block at a screen edge. Removing a block in the gravity direction triggers travel. Clicking cyan/avatar is inert. Click interaction is effectively screen-global: level 4's gray worked at least 24 px horizontally and 18 px vertically from the avatar.
- [Checked, level 3] Red blocks (12) toggle individually with ACTION6: rounded = solid; sparse five-cell X = inactive/traversable. Paired toggles can preserve a safe ceiling while opening the avatar row.
- [Checked, level 3] White bodies (15) with yellow tips (11) are lethal overhead/downstream hazards, not safe blockers. Automatic travel into one causes GAME_OVER. Put a safe solid between the avatar and hazard or use another column.
- [Checked, levels 1-2 and 4] The color-7 plus is the exit; horizontal contact or vertical travel into it completes a level.
- [Checked, level 4] A rounded color-8 block is a one-use gravity reversal: ACTION6 dissolves it and the avatar immediately travels in the opposite vertical direction. Large board diffs are usually camera scrolling, not explosions.
- [Checked] Bottom row is a 64-action deadline bar, +1 white cell/live action and reset each level. ACTION7 remains untested/likely undo. Need 9 levels total.

# Working memory

- Level 5 freshly started at step 125, 4/9 complete, timer 0/64, initial gravity upward. Avatar faces east at logical center (21,39), pinned by the chamber ceiling. Exit is at (33,8), not directly connected from this chamber. Gray reversal is centered (51,39).
- Initial visible route downward: lethal white/yellow row occupies columns 15,21,27,33 at centers about y51; columns 39 and 45 are safe and lead to green gates partially visible at centers (39,63) and (45,63). Right-side hazards at x45/51/57 near y9 and green blocks at those columns y15/y21 belong to the eventual upper route.
- Current computed plan: ACTION4 three times, x21→27→33→39 under the solid ceiling; click gray (51,39), reversing downward. At x39 the avatar should pass the hazard row and stop immediately above the green gate, logical center y57 (body y55..59). Then inspect newly relevant gate/travel before committing farther.
- Ruled out on this level: reversing downward while still at x21 (lethal hazard directly below). From prior levels: inactive red X as ceiling; arbitrary click-to-move; avatar-click rotation; movement through an intact green; color-8 as an explosive opener.
