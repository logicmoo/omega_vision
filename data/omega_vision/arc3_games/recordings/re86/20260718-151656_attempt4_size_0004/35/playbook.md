# Working model

- **Checked through level 3:** Boards contain movable colored line-shapes and 3x3 color-4 marker frames. A level completes when every marker center is simultaneously covered by a compatible shape. Aligned shapes do not lock or auto-switch. If several shapes/markers share a color, coverage is collective: level 3 completed on the unique union cover rather than requiring each shape to cover every marker.
- **Checked controls:** ACTION1 up 3, ACTION2 down 3, ACTION3 left 3, ACTION4 right 3. ACTION5 cycles shapes in generation order, restoring the old reference point's transported underlying value and blackening the new shape's reference point.
- **Checked movement/rendering:** Shapes translate rigidly in 3-cell strides, can overlap marker frames/other shapes, render above underlying objects while selected, and restore underlying cells when uncovered. Shapes may clip at board edges rather than being blocked.
- **Checked anchor nuance:** Black/color0 is a cursor overlay at the selected reference point. Do not infer its later restoration merely from the initial center pixel: level 3's X initially showed color8 there, but its first move and deselection restored background5. Retrodict from moved-pattern history when a restoration value matters.
- **Checked completion:** The final required translation immediately replaces the settled board with the next level. Omit old-board cell expectations on a predicted completion action and use `expect_levels`.
- **HUD:** Bottom row color15 is a non-terrain action/deadline bar that fills right-to-left with color1 on many, not all, actions and resets each level. Exclude it from mechanic expectations.
- **Level-4 extension, strongly board-supported but not yet completion-checked:** Six 4x4 color swatches in color2 frames form a 2x3 compatibility key. Centrally opposite swatches pair under 180-degree rotation: 10<->14, 12<->6, 13<->11. The only full geometric cover pairs the color6 shape with color12 markers and color10 shape with color14 markers, exactly matching this key. Treat the framed swatches as a static legend, not pieces or targets.

# Working memory

- **Level 4, 3/8 complete, fresh board; HUD 0/64.** Available ACTION1–ACTION5. Marker centers: color12 at (15,18),(27,30),(15,43); color14 at (48,21),(33,24),(30,39).
- **Selected color6 plus:** center/anchor (54,36), radius13, clipped at the right edge. Under the key it targets color12. Its unique center covering all three color12 markers is (15,30): L13,U2, 15 moves.
- **Color10 diagonal X:** center (24,21), radius10. Under the key it targets color14. Its unique center covering all three color14 markers is (39,30): R5,D3, 8 moves.
- Exhaustive reachable-center analysis found exactly this two-shape full cover. Total shortest cost is 15 + one ACTION5 + 8 = 24 actions.
- **Current commitment:** Move selected plus L13 then U2 to (15,30). This shortest ordering keeps overlap with the static X to at most one cell per affected frame; final plus and final X placements are disjoint. Then probe ACTION5 before moving X.
- **Ruled out from earlier levels:** one-cell strides, solid marker obstacles, one-touch collection, automatic per-shape locking, and blocked clipping. No reset is needed; never double RESET.
