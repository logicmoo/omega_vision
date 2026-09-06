# Working model

- **Checked through levels 1-5:** Color-5 patterned sources are movable; color-4 images are their reflections across color-10 mirror lines. Logical cells are 3x3 pixels. Covering every required color-11 target cell with a source/image completes a level; extra reflected cells on background are allowed.
- **Selection/controls (checked):** Black color-0 centers mark the selected entity. ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right, ACTION5=next selection, ACTION7=undo; ACTION6 is untested. Selected source centers are black (unselected centers background9); selected mirror slots are black. Over goals, centers continue to show underlying color11.
- **Reflection dynamics (checked):** Moving a source by `(dx,dy)` applies the corresponding reflected displacement to all its images. Moving a mirror one logical cell along its normal leaves sources fixed and moves images involving it by two cells. Perpendicular mirrors produce source, horizontal-only, vertical-only, and double-reflected copies.
- **Multiple entities (strong board inference on L6, not action-confirmed yet):** A source shape may be only diagonally/8-connected even though `arclog.objects(..., connectivity=4)` splits it. ACTION5 is expected to cycle each such source entity separately after the mirrors.
- **Targets (checked through L5):** Goal components can overlap or be sparse markers rather than full silhouettes. Decompose yellow cells into source transforms; the win condition is coverage of all yellow cells, not minimizing extra image cells.
- **HUD (checked behavior, deadline still assumed):** x=63 fills one cell per ordinary action; y=63 is static. It resets each level. Treat it as an approximately 64-action budget and ignore it as geometry.

# Working memory

- **Level 6/8, fresh at step120 (5 completed).** Selected horizontal mirror is at macro axis `y=0` (physical stripe 0..2); unselected vertical mirror is at macro axis `x=7` (physical 21..23). Yellow set (52 macro cells) is exactly symmetric about intended axes `x=6,y=11`, so move horizontal 11 down and vertical 1 left.
- There are two inferred 8-connected source entities, each presently unselected:
  - A (8 cells): `(15,3),(16,3),(17,3),(14,4),(18,4),(14,5),(14,6),(15,7)`. It has a unique translation onto yellow: `(-7,+12)`, landing at `(8..10,15),(7,16..18),(11,16),(8,19)`; cost 19.
  - E (5 cells): `(18,8),(17,9),(18,9),(19,9),(20,9)`. Unique target translation `(-15,+4)`, landing row `x=2..5,y=13` with bump `(3,12)`; cost 19.
- These two placements and reflections about `x=6,y=11` partition all 52 yellow cells exactly. Expected shortest sequence from fresh board: horizontal down11; ACTION5; vertical left1; ACTION5; A left7/down12; ACTION5; E left15/down4 = 53 actions total. Source grouping/order still needs one selection confirmation; use expectations at each ACTION5.
- **Immediate plan:** commit the checked horizontal mirror move down 11, then select/move vertical left 1 and select A. Safe selected-line probe coordinates: physical `(37,3*k+1)` for horizontal axis macro k; vertical safe center `(22,7)` then `(19,7)`.