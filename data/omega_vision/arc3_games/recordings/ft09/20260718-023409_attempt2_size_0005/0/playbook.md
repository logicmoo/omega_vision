# Working model
- **Confirmed on level 1:** A clue is a 3×3 arrangement of 2×2 micro-cells embedded in the center of a 3×3 lattice of large 6×6 tiles. The eight micro-cells specify the required colors of the eight outer tiles. Micro-color 2 means a color-9 outer tile; micro-color 0 means an outer tile matching the clue's 2×2 center-core color (color 8 on level 1).
- **Confirmed objective:** Clicking exactly the outer tiles encoded by micro-color 0 solved level 1 and advanced the counter. The final animation frame showed the expected completed pattern before loading level 2.
- **Confirmed control on level 1:** ACTION6 anywhere inside a color-9 outer tile repaints its whole 6×6 tile to the alternate target color (9→8 on level 1). Clicking a clue center or non-grid area is unnecessary. Whether already-painted tiles toggle is untested and should not matter in a shortest solution.
- **Confirmed HUD:** Every ordinary click consumes two cells from the right side of the full-width y=63 bar; this is a step-budget strip, not gameplay.
- **Generalization to test on level 2:** The center-core color changes by level, so micro-color 0 likely means that new core color (12 now), while micro-color 2 still means 9. The two small swatches at top-right show colors 9 and 12 and support this interpretation.

# Working memory
- Level 2, 1/6 completed; only ACTION6 available. New board is a 3-column × 5-row lattice of outer/clue tiles with x origins 20,28,36 and y origins 14,22,30,38,46. Tile centers for clicking are x=22,30,38 and y=16,24,32,40,48.
- Clues occupy lattice positions (col 1,row 1) and (col 1,row 3), so their 3×3 neighborhoods overlap on lattice row 2.
- Upper clue micro-map is `0 2 2 / 0 C 0 / 0 2 0`; lower is `0 2 0 / 2 C 2 / 0 0 2`. Their shared-row requirements agree (`0 2 0`).
- Under the generalized mapping, seven unique color-9 tiles must become color 12: lattice (col,row) = (0,0),(0,1),(2,1),(0,2),(2,2),(0,4),(1,4), at click coordinates (22,16),(22,24),(38,24),(22,32),(38,32),(22,48),(30,48).
- Next step is one discriminating probe at (22,16), predicting the whole tile becomes 12. If confirmed, batch the remaining six clicks.
- Ruled out: treating the opening as an analogy transformation; all references and the solved level-1 frame instead verify direct center-clue decoding.
