# Working model

## Checked against log
- Board geometry is pixel-scaled logical cells, but scale can change by level: levels1-3 used 4x4 cells; level4 uses a 20-column interior of 3x3 cells with physical origin `(2,2)`. Always derive scale/offset from components.
- Color6 grows one logical cell/frame directly **away from adjacent color4** when ACTION5 runs. It leaves a trail.
- Horizontal bars block flow. Color9 is selected/movable; others are color8. ACTION3/4 move selected left/right by one logical cell. ACTION6 selects a clicked bar (new 8->9, old 9->8). ACTION5 runs with all bars color8.
- Streams hitting a connected horizontal blocker interval `[L,R]` merge and emerge at `L-1,R+1`; misses pass. A branch beyond a side boundary is suppressed. Cascades and merging are confirmed through levels1-3; level3's edge bars confirmed suppression.
- Color11 U shapes are receptacles; success requires the final stream set to equal their opening columns. Leakage to terminal color1 walls fails and restores placements. Level completions: L1 one split, L2 cascade, L3 multi-source plus edge suppression.
- Color14 border strip is the action budget. Reusable set-router is `scratch/flow.py` and supports arbitrary width.

## Assumed / to test
- ACTION1 likely moves the selected bar up one logical cell and ACTION2 down; neither vertical control has yet been tested.
- An unpaired color4 cell in level4 at logical `(5,9)` is treated as a fixed one-cell blocker. The planned streams miss it, so its precise hit behavior need not be assumed.

# Working memory
- Level4 fresh at step24, progress 3/6, full top budget. Logical transform is `X=(x-2)//3`, `Y=(y-2)//3`, width20. Downward source `{7}`; four upward-open cup targets `{3,9,13,17}`.
- Bars `(name,length,L,Y)`: active A `(5,5,5)`; B `(5,12,5)`; C `(3,2,9)`; D `(3,6,9)`; E `(4,14,10)`; F `(4,12,13)`. Fixed color4 blocker at `(5,9)`.
- Fixed-row horizontal search had no exact solution, indicating the new vertical controls are required. A bounded row/order search found a 26-setup-action route (21 directional + one click for each of five inactive bars), then ACTION5:
  - B -> `(L7,Y4)`, A -> `(L4,Y5)`, C -> `(L0,Y9)` (unused/avoids stream), E -> `(L12,Y10)`, F -> `(L13,Y13)`, D -> `(L10,Y14)`.
  - Stream trace: `{7}` --B--> `{6,12}` --A--> `{3,9,12}` --C/fixed miss--> same --E--> `{3,9,11,16}` --F--> `{3,9,11,12,17}` --D merge--> `{3,9,13,17}`.
- Feasible no-reselection move order: A left1; B up1/left5; F right1; D right4/down5 while E is still at L14 and F has cleared L12; C left2; E left2; run. This avoids bar collisions.
- Current short probe: A left1 (known/useful), select B, then ACTION1. Predict B moves from physical y17..19 to y14..16 (up one 3px cell). Stop to confirm vertical mapping.
- Ruled out: no exact solution exists if all bars remain on their initial rows under the checked stream transform.
