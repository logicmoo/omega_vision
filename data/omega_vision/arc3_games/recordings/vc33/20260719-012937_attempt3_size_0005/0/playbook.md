# Working model

- **Checked (levels 1-2):** This is a boundary-transfer/alignment puzzle controlled only by coordinate clicks; 7 levels total.
- **Checked:** The full color-7 top row is a click/time budget. Ignore its changes as gameplay but conserve actions.
- **Checked:** Same-colored thin markers form target pairs: one is fixed in a color-5 divider, while the other is attached to a movable color-3/0 slab boundary. A level completes when every movable marker is exactly aligned with its same-colored fixed marker.
- **Checked:** Paired color-9 controls straddle each divider. A click transfers a fixed-size unit between only the two adjacent slab boundaries; the two controls are exact inverses. The divider, controls, and fixed marker remain stationary.
- **Checked side-aware rule:** Relative to the side holding the controls, clicking the control belonging to the first adjacent slab moves that slab boundary *away from the controls* and the second boundary *toward them*; the other control reverses this. Examples: right-side horizontal controls' upper click gave `(upper x-4, lower x+4)`; left-side horizontal controls reverse that numeric sign.
- **Revised arrow interpretation:** The color-4 arrow attached to a movable marker points into its color-3 slab and identifies boundary orientation; it is not necessarily the required movement direction. Use same-color marker alignment, not the arrow alone, to derive the target.
- **Checked (level 2):** Multiple dividers form a local transfer chain. Intermediate boundaries may need capacity supplied/drained through neighboring dividers before the target transfers can execute. Direct clicks on arrows, markers, terrain, or divider lines are unnecessary.

# Working memory

- **Level 3 (`LEVELS 2/7`), fresh at step 18.** This is the vertical/rotated chain variant. Four vertical color-5 dividers at x=14,26,36,48 have paired color-9 controls at the bottom, respectively around x=(12,16), (24,28), (34,38), (46,50), all y=56..57.
- Five vertical slab boundary coordinates (first color-0 row, under overlays) are `q=[54,56,54,52,30]` for slabs x=6..13,16..25,28..35,38..47,50..57.
- Fixed/mobile target pairs imply target coordinates: color14 `q0:54→42` (mobile y53 to fixed y41), color15 `q3:52→40` (mobile y51 to fixed y39), color11 `q4:30→48` (mobile y29 to fixed y47). Deltas show this level's transfer step is probably 6 px.
- **Assumed rotated control rule, next to verify:** For bottom-side controls, clicking the **left** color-9 control of divider i does `q[i]-=6, q[i+1]+=6`; the right control is inverse.
- Next probe: click left control of divider 3 at (46,56). It should benefit both adjacent targets: `q3:52→46`, `q4:30→36`, moving mobile color15 y51→45 and color11 y29→35. Predicted witness cells: (40,46)=0, (52,30)=3, (41,45)=15, (52,35)=11.
- If confirmed, shortest capacity-safe candidate is a right-to-left cascade of 7 total left-control clicks: d3 three times, d2 once, d1 once, d0 twice. From after the probe: d3×2, d2×1, d1×1, d0×2. This yields `q=[42,62,54,40,48]`, aligning all three marker pairs; q1=62 is hidden partly behind the bottom frame but remains within board bounds.
