# Working model
- **Confirmed through level 4:** Each clue tile contains a 3×3 array of 2×2 micro-cells. For a neighboring lattice tile, code 0 requires equality with that clue’s center-core color; code 2 requires inequality. Level 4’s three-color palette proved that code 2 accepts *any* unequal palette color: the minimum solution deliberately left five 2-coded neighbors at color9 rather than making them color8, and it completed.
- **Confirmed overlap method:** Translate every clue to equality/inequality constraints at absolute lattice positions, intersect constraints from overlaps, and choose an allowed target minimizing forward click-cycle distance.
- **Confirmed control:** Top-right swatches list colors in cycle order. ACTION6 inside an ordinary 6×6 tile advances it one palette state. Level 4 directly confirmed 9→8→12. Avoid clue centers.
- **Confirmed HUD:** The y=63 strip is a click-budget display, not gameplay.
- **New level-5 code, checked statically:** Micro-code 3 means “no constrained neighbor / ignore.” Every one of its 21 occurrences points either outside the lattice (19) or at another clue tile (2), and none points at an ordinary tile.
- **New level-5 object, still assumed:** Three checker-hatched tiles (colors 14/6) are fixed/special tiles rather than ordinary clickable cells. Each is pointed to by code2 from a core14 clue, so the hatch likely already counts as different or is excluded. Do not click them unless all known ordinary constraints are solved without advancing.

# Working memory
- Level 5, 4/6 completed; only ACTION6. Binary palette [14,15], so each solid ordinary tile starts14 and one click makes15.
- Lattice origins are x=[6,14,22,30,38,46,54], y=[4,12,20,28,36,44,52]. Eight real clue centers are (1,0) core14, (4,1) core15, (0,3) core15, (4,3) core14, (6,3) core14, (2,4) core14, (2,5) core14, (5,6) core14. The top-right block at lattice-looking (6,0) is merely the color15 palette swatch.
- Python merged all 0/2 constraints with no contradictions. Nine solid ordinary tiles require 14→15, at click coordinates: (32,6),(16,22),(32,22),(48,22),(16,38),(32,38),(48,38),(16,54),(32,54). Seventeen constrained ordinary tiles correctly remain14; one unconstrained ordinary tile also remains14.
- Hatched positions are lattice (2,1),(2,3),(4,5), all associated with code2/core14. First solve the nine certainly-required solid tiles. If the hatch assumption is right, the ninth click advances to 5/6; otherwise inspect/probe one hatch rather than altering solved ordinary tiles.
