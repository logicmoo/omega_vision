# Working model

- **Checked through levels 1–2:** Boards contain movable colored line-shapes and 3x3 color-4 marker frames whose center has a shape color. A level completes when every marker center is simultaneously covered by the geometry of a same-color shape. Aligned shapes do not lock or auto-switch.
- **Current extension, board-checked but objective not yet completion-checked:** Level 3 has three distinct shapes and eight markers all color8. Their geometry admits exactly one collective set-cover placement, strongly indicating same-color shapes collectively cover their shared markers rather than each needing all of them.
- **Checked controls:** ACTION1 up 3, ACTION2 down 3, ACTION3 left 3, ACTION4 right 3. ACTION5 cycles shapes in generation order. It restores the old reference cell's true underlying value and makes the new shape's geometric reference point black/color0.
- **Checked movement/rendering:** A selected shape translates rigidly in 3-cell strides, can overlap marker frames and other shapes, and renders above them; underlying cells restore when uncovered. Shapes can clip at board edges rather than being blocked.
- **Checked anchor nuance:** Black is a cursor overlay at the selected shape's reference point. Its underlying value depends on topology: solid centers restore to shape color, while hollow/gapped centers (level-2 X and diamond) restore to background5.
- **Checked completion:** The final required translation immediately replaces the settled board with the next level, so omit old-board cell expectations on a predicted completion action and use `expect_levels`.
- **HUD:** Bottom row color15 is a non-terrain budget bar that fills right-to-left with color1 on many (not all) actions. It reset each level; exclude it from mechanic expectations. Completed levels have needed far fewer than 64 actions.

# Working memory

- **Level 3, 2/8 complete, fresh board; HUD 0/64.** Available ACTION1–ACTION5. All shapes and all eight marker centers are color8. Exact markers: A=(6,6), B=(45,6), C=(51,15), D=(21,21), E=(9,27), F=(48,30), G=(33,33), H=(21,39).
- **Selected shape:** horizontal segment centered/anchored at (30,45), radius21 (offsets x=-21..21). Other board-verified shapes: diagonal X centered (18,48), radius11; Manhattan diamond centered (45,48), radius12.
- **Computed unique collective cover** over all reachable centers (multiples of 3): line center (27,6) covers A,B; X center (42,24) covers C,F,G; diamond center (18,30) covers D,E,H. Exhaustive candidate-mask combination found no other full cover.
- **Shortest movement costs:** line L1,U13 = 14; X U8,R8 = 16; diamond U6,L9 = 15; plus two ACTION5 switches = 47 total. Shape-cycle order on this same-color board is expected line -> X -> diamond from generation order, but probe each transition before relying on it.
- **Current commitment:** Move selected line L1 then U13 to center (27,6). This is required by the unique cover and is the shortest center satisfying A,B. It will not complete the level by itself.
- **Ruled out from earlier levels:** one-cell strides, solid marker obstacles, one-touch collection, automatic per-shape locking, and clipping being blocked. No reset is needed; never double RESET.
