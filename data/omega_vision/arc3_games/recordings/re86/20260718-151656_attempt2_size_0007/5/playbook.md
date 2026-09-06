# Working model

- **Checked on level 1:** A level contains one or more colored line-shapes plus 3x3 gray/color-4 marker blocks whose center pixels match a shape color. The black/color-0 cell is the anchor of the currently selected shape.
- **Checked objective:** Translate every shape so its colored cells simultaneously cover all same-color marker-center pixels. One aligned shape does not lock or auto-switch; the level completes automatically only when all colors are aligned at once. Marker blocks and other shapes persist underneath temporary overlaps.
- **Checked controls:** ACTION1 = up 3 cells, ACTION3 = left 3, ACTION4 = right 3. ACTION5 changes selected shape (with two shapes it restored the old anchor color and blackened the other anchor). ACTION2 is strongly inferred down 3 but not yet live-checked.
- **Checked movement/rendering:** The selected shape translates rigidly in 3-cell strides. It can pass over marker frames and other shapes; its pixels render on top, and underlying pixels restore when uncovered. Shapes may clip normally at board edges rather than being blocked.
- **Checked completion:** Reaching all inferred target alignments completed level 1 immediately (0/8 -> 1/8), validating the simultaneous-coverage model.
- **HUD:** Bottom row color15 is non-terrain and resets each level. During level 1 it filled right-to-left with color1 at an irregular/slower cadence (12/64 segments after 20 actions), likely a deadline. Exclude it from move-effect expectations and monitor remaining budget.

# Working memory

- **Level 2, 1/8 complete, fresh board.** Available ACTION1–ACTION5; HUD reset full. Selected black anchor is at (27,18).
- **Shape color12:** diagonal X, center/anchor (27,18), radius 11. Matching marker centers are (9,39),(24,42),(9,57). Exact unique reachable target center is (18,48), because all marker offsets then satisfy |dx|=|dy|<=11. Shortest translation: D10,L3 (13 moves). This shape is selected.
- **Shape color13:** hollow Manhattan diamond, center (39,30), radius 9 (right vertex (48,30) is currently overlaid by the blue plus). Markers are (21,3),(27,9),(12,12). Reachable centers covering all are (18,9) and (21,12); choose intended/shorter (21,12), whose top and left vertices exactly match two markers. Translation L6,U6 (12 moves). Selection-anchor behavior for a hollow shape is not yet observed.
- **Shape color9:** plus, center (48,42), radius 13. Markers are (27,36),(15,48),(33,48),(27,60). Unique target center (27,48). Translation L7,D2 (9 moves).
- Likely total shortest cost is 13 + 12 + 9 + two ACTION5 switches = 36 actions, assuming ACTION5 cycles X -> diamond -> plus. Selection order is not yet checked.
- **Next deliberate probe:** ACTION2. Prediction: selected color12 X moves down 3 to black anchor (27,21), old anchor (27,18) restores to background5, top endpoints at (16,7),(38,7) clear, new bottom endpoints at (16,32),(38,32) appear, and the moved X overlays diamond pixel (33,27). This is the first required down move.
- If confirmed, batch the remaining D9 then L3 to place color12. Probe ACTION5 before planning the next shape.
- Ruled out on prior level: one-cell strides, solid marker obstacles, one-touch collection, automatic per-shape locking, and edge clipping being blocked.
- Never double RESET; no reset is currently needed.
