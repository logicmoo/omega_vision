# Working model
- **Confirmed through levels 1–2:** The puzzle consists of 6×6 tiles on an 8-cell pitch. A clue tile has a 3×3 array of 2×2 micro-cells. Its eight noncentral micro-cells specify the required colors of the eight neighboring large tiles.
- **Confirmed semantic rule:** Micro-color 0 means “same color as this clue’s 2×2 center core”; micro-color 2 means “the other color in the level’s two-color palette.” Evidence: level 1 used core 8 with 0→8/2→9; level 2 used core 12 with 0→12/2→9, and both solved exactly under this rule.
- **Confirmed control:** ACTION6 inside an ordinary 6×6 tile switches it from the initial palette color to the other palette color (level 1: 9→8; level 2: 9→12). Do not click clue tiles. Reverse toggling is untested and unnecessary when solutions are computed first.
- **Confirmed overlapping-clue mechanic:** Multiple clue neighborhoods may overlap. Decode each clue locally, merge requirements by absolute lattice position, verify overlaps agree, then click each currently mismatched ordinary tile exactly once. Level 2’s two overlapping clues completed this way.
- **Confirmed HUD:** Each click consumes two cells from the right side of the y=63 budget bar; the bar is not gameplay. Fresh levels reset it to 64 cells (32-click capacity).

# Working memory
- Level 3, 2/6 completed; only ACTION6 available. Palette swatches are colors 8 and 12; ordinary tiles all start 8.
- Geometry is a diamond-shaped union of four 3×3 neighborhoods on global lattice x origins [12,20,28,36,44], y origins [4,12,20,28,36,44,52]. Clue centers are lattice (2,1), (1,3), (3,3), (2,5). Top/bottom clue cores are 12; left/right cores are 8.
- Python decoded all four clues locally and merged 23 outer requirements with **zero conflicts**. Fourteen ordinary tiles need 8→12; nine remain 8. This consistency also rules out any global fixed meaning for 0/2 and supports the local same/different-from-core rule.
- Required click coordinates, row-major: (22,6),(30,6),(38,6),(22,14),(14,22),(30,22),(14,30),(46,30),(30,38),(46,38),(22,46),(22,54),(30,54),(38,54). All are ordinary tile interiors, never clue centers.
- Next: commit all 14 computed clicks with per-step color-12 checks until the final level-transitioning click; expect 3/6.
