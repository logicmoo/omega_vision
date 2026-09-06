# Working model

- **Checked through levels 1-7:** Color-5 sources move; color-4 copies are reflections across color-10 mirrors. Logical cells are 3x3 pixels. Cover all color-11 goal cells with source/image footprints; extra reflected cells are legal when present.
- **Controls/selection (checked):** ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right, ACTION5=next entity, ACTION7=undo; ACTION6 untested. Black centers mark selection on background; centers over goals remain yellow11. Selection cycles horizontal mirror -> vertical mirror -> source entities. In L6 and L7, the right-hand source was selected before the left-hand source.
- **Dynamics (checked):** Source displacement is reflected in every copy. Moving a mirror one logical cell along its normal leaves sources fixed and shifts affected images by two cells. Perpendicular mirrors create the four horizontal/vertical reflection variants.
- **Object grouping (checked):** A source may be diagonally/8-connected even if 4-connectivity splits it; all its parts select/move together.
- **Targets (checked):** Yellow can be a sparse marker subset. Solve with `G ⊆ union(orbits)` rather than requiring silhouettes, though some levels use exact complete footprints.
- **HUD:** x=63 spends one cell per action and resets each level; treat as a 64-action budget. y=63 is static. Undo does not refund HUD.

# Working memory

- **Level 8/8, fresh after step209 (7 completed).** Horizontal mirror at macro `y=5` is selected; vertical mirror at `x=3` is unselected. There are two 4-connected sources: A (7-cell L) at `(7..9,7)` plus vertical leg `x=9,y8..11`; B (8 cells) at `(13,13),(14,13),(13,14),(13..17,15)`.
- All 60 goals are exactly symmetric around intended axes `x=12,y=11`. Exhaustive search over every integer in-board axis and translation proved no solution below 44 geometry moves. Unique known optimum: horizontal down6, vertical right9; A `(+9,-4)` (cost13), B `(-9,-7)` (cost16). Add three ACTION5 selections = 47 actions.
- Final A source: row `(16..18,3)` and leg `x=18,y4..7`; its orbit is exactly 28 goals. Final B source: `(4,6),(5,6),(4,7),(4..8,8)`; its orbit is exactly the other 32 goals.
- Expected order is horizontal -> vertical -> right-hand B -> A, supported by L6-L7 but gate both source selections. Immediate plan can commit full optimum: h down6; select v/right9; select B/left9/up7; select A/right9/up4. Final move should produce level count 8 and WIN.