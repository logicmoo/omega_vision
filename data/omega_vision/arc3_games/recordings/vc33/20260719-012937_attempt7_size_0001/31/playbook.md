# Working model

- **Checked (levels 1-4):** Coordinate-click boundary-transfer/alignment puzzle; 7 levels. The changing color-7 border row is a timer/action budget, not gameplay. A level completes when every movable colored marker aligns with its same-colored fixed marker along the transfer axis.
- **Checked transfer rule:** A color-9 control transfers one unit between the two adjacent slab boundaries. The control lying on the donor side sends that side across the divider; the opposite control reverses it. Transfers respect donor minima and receiver maxima. Unit sizes observed: 4 px (levels 1-2), 2 px (level 3), 3 px (levels 4-5).
- **Checked flow method:** Treat ordinary multi-divider levels as bounded integer-flow problems. Solve target boundary coordinates and search a capacity-safe control schedule; arrows/markers/terrain are normally inert.
- **Checked portal rule (Level 4):** A color1 divider becomes color12/passable when (a) cargo is adjacent, (b) its two adjacent boundaries are equal, and (c) the cargo marker lies vertically/horizontally inside that divider's color1 span. Clicking the color12 span moves the entire arrow/marker cargo across it without changing boundaries. It stays active while those conditions remain. Ordinary color1 spans are inert.
- **Checked Level 4 solution lesson:** Cargo can cross a sequence of offset portals by first equalizing the source/destination boundaries at the coordinate where its marker fits each span. `scratch/l4_sim.py` exactly reproduced all 73 observed non-HUD boards and its searched route completed Level 4 at step134.

# Working memory

- **Level 5 (`LEVELS 4/7`), fresh at step134.** Horizontal orientation, 3-pixel units. Four left-filled slab boundaries at safe rows y=2,20,40,53 are `q=[16,58,46,43]`.
- Dividers/controls: d0 y14..16, upper/lower controls `(62,12)/(62,18)`; d1 y32..34 controls `(62,30)/(62,36)`; d2 y49..51 controls `(62,47)/(62,53)`. For horizontal geometry, lower control transfers lower slab→upper slab.
- Three color1 portal spans exist, but the searched ordinary route never meets their full activation conditions and requires no portal clicks.
- Targets: color14 cargo on q0 already has marker x14..15 matching fixed color14 x14..15, so preserve `q0=16`. Color11 cargo on q3 has marker x41..42 and fixed target x20..21, hence target `q3=22` (seven q3-donor transfers).
- Bounds used by `scratch/l5_sim.py`: minima `[16,25,25,10]`, maxima64. Bounded BFS visits 521 states before finding an optimal 8-action route: `d1D` once to make q1=61/q2=43, then `d2D` seven times to reach `[16,61,64,22]`. This preserves color14 and places color11 on target.
- **Next:** execute that 8-action searched route with fail-fast boundary/cargo expectations; expect level counter to become5 on the final d2D.
