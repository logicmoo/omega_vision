# sk48 playbook

## Working model
- **Checked through level 2 (steps 0-50):** Ordered retractable-chain collector on a 6-pixel logical grid. The bottom panel lists required colors left-to-right; hollow centers mark acquisitions. Acquiring the last target loads the next level.
- **Checked controls:** ACTION1/ACTION2 move the entire assembly up/down one row. ACTION4 extends its right terminal one column, or moves the acquired chain/contacted target right when permitted. ACTION3 retracts/pulls the cable and acquired chain left. ACTION7 is undo; ACTION6 is unused. The assembly occupies logical columns `0..t` and cannot retract below `t = acquired_count-1`.
- **Checked vertical rule:** A vertical move pushes unacquired targets in the destination row at columns `<=t` one row in the same direction; targets at `>t` remain. This enables selective movement by retracting first. A stacked-target cascade is still untested.
- **Corrected horizontal rule (step 56):** Targets are order-gated. With red next, extending from `t=2` into wrong-order color12 at row3 col3 did **not** push it despite free space; only contact connectors appeared. This falsifies arbitrary prepositioning of future targets and the prior 30-action plan. Historical rightward target pushes were all of the next required color. Still to check: a correct target contacted through free space should move immediately (as color12 did with an acquired red at step 33).
- **Checked acquisition:** A next-required target can be pushed right; when it cannot move farther, another ACTION4 attaches it, adds connectors, and hollows its panel marker. Retraction then moves acquired blocks but leaves other targets. Contacting the final target completes the level.
- **Checked HUD:** y=53 is a loose step budget; the thin alternating strip beside the magenta anchor is its rail.

## Working memory
- Level 3, 2/8 completed. Initial targets all col3: green14 row0, blue9 row1, red8 row2, color12 row3; order red8, color12, blue9, green14. Initial assembly row6, `t=0`.
- Step 56/current: after `UUURR`, assembly is row3, `t=2`; the failed third R contacted wrong-order color12 at col3 and added connectors but did not move it. Use ACTION7 (not RESET) to undo this mistake.
- Corrected model gives a 38-action fresh solution `UUUURRRRRRLLLLDRRRRULLLLURRRRLLLLURRRR`: horizontal lower bound is 30 (first target needs 6 R; each later target needs 4 L+4 R), and ordered row travel needs 8 vertical moves. From the post-undo state, move U beside red and test one R; predict red col3->4 while color12 stays row3 col3.
- If confirmed, finish red with `RRR`, then follow `LLLL D RRRR U LLLL U RRRR LLLL U RRRR`.
