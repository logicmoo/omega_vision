# Working model

- **Checked through Level 5:** Coordinate-click boundary-transfer/cargo-routing puzzle; 7 levels. Color7 border row is the timer/action budget. A level completes only when every mobile cargo is in the required remote slab adjacent to its same-colored fixed marker and aligned with that marker along the transfer axis.
- **Checked controls:** A color9 control transfers one boundary unit from the slab on the control's side (donor) to the slab across its divider (receiver). Donor loses fill and receiver gains it; transfers obey capacities. Units: 4 px (L1-2), 2 px (L3), 3 px (L4-5; L6 likely 3).
- **Checked portal rule for left-filled slabs (L4-5):** A color1 span becomes color12 when cargo is adjacent, the two slab boundaries are equal, and the two-cell cargo marker is flush with the portal's far/high edge (`q=span_hi+1`, marker `q-2..q-1`). Clicking color12 transfers the whole cargo glyph across without changing boundaries. Mere overlap/full-glyph fit is insufficient.
- **Checked simultaneous traversal (L5 step172):** If eligible cargos occupy both sides of one active portal, one click swaps their slabs.
- **Checked solution method:** Model slabs and color9 links as a bounded integer-flow graph, add portal transitions at their exact activation coordinates, and BFS for a capacity-safe shortest route. Arrows/markers/terrain are otherwise inert.

# Working memory

- **Level 6 (`LEVELS 5/7`), fresh at step192.** New right-filled, branching geometry. Three apparent slabs: A=top-left x0..20 with first-filled boundary `qA=3`; B=top-right x24..63 with `qB=39`; C=shared bottom x0..63 with `qC=18`.
- Controls: A↔C at upper/lower `(1,28)/(1,34)`; B↔C at `(25,28)/(25,34)`. Based on the checked donor-side rule, an upper click donates from its top slab: donor right-fill boundary increases by 3, while C's decreases by 3.
- Mobile color11 starts in A (marker x3..4, glyph x3..8); fixed target is x48..49 on the divider. Best structural hypothesis: cargo must traverse A→C through p0 (span x6..17), then C→B through p1 (span x30..41), and finish in B at `qB=48`.
- **Assumed right-fill symmetry, next test:** Portal activation should put the marker flush with the low edge: p0 requires `qA=qC=6`; p1 requires `qB=qC=30`.
- Under unit3, broad physical bounds, and that portal rule, BFS finds a 20-action route: `Au, Bu×3, p0, Ad×2, Bd×6, p1, Bu×6`. State sequence ends with cargo in B and `qB=48`.
- **Next 4-action probe (all are prefix of that shortest route):** click Au once then Bu three times, predicting `(qA,qB,qC)=(6,48,6)` and p0 color1→12 only on the last action. Stop before clicking p0.
