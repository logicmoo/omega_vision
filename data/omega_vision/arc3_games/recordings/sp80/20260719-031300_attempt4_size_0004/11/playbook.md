# Working model

## Checked against log
- Board geometry is pixel-scaled logical cells and can change: L1-3 used 4x4; L4 uses a width-20 interior of 3x3 cells with physical origin `(2,2)`. Derive scale/offset each level.
- On ACTION5, color6 grows one cell/frame directly away from adjacent color4 and leaves a trail. Exact local rule, retrodicted with a script against **every step3 frame 0..12**: each frontier cell advances forward if that cell is open; if forward is blocked, it instead spreads left/right on its current row. Existing trail is not an obstacle.
- Therefore the simple stream-set transform `[L,R] -> {L-1,R+1}` is valid only when a bar has a clear flow-facing row. Adjacent/overlapping bars can block a lateral exit and must be checked with the 2-D model, not treated as independent sequential transforms.
- Color9 is selected/movable; color8 bars inactive. ACTION1=up, ACTION3=left, ACTION4=right, one logical cell. ACTION6 selects a clicked bar and deselects the old one. ACTION5 runs. ACTION2/down remains untested.
- Side boundary suppresses an off-board branch (L3 confirmed). Color11 U shapes contain flow at their openings; success requires all streams contained. Leakage to terminal color1 walls fails/restores.
- `scratch/flow.py`: `route` for separated bars and `grow_grid` for exact 2-D directed growth.
- Levels complete: L1 split, L2 cascade, L3 multi-source/edge suppression.

## Assumed / to test
- ACTION2 should be down. An unpaired L4 color4 cell at logical `(5,9)` is a fixed blocker; planned streams miss it.
- Clicking one original bar after it visually touches another same-color bar should still select only that game entity; test with an expectation before moving it.

# Working memory
- Level4, step34, progress3/6, budget59/64. Width20, `X=(x-2)//3`, `Y=(y-2)//3`; source `{7}`, target openings `{3,9,13,17}`.
- Initial bars `(name,len,L,Y)`: A `(5,5,5)`, B `(5,12,5)`, C `(3,2,9)`, D `(3,6,9)`, E `(4,14,10)`, F `(4,12,13)`.
- Current: A final/inactive `(L4,Y5)`; B inactive `(L7,Y4)`; F selected/final `(L13,Y13)`; C,D,E initial. A and B now touch/overlap in adjacent rows as one visible color8 component. This exposed a flaw in the old 1-D placement plan.
- Exact 2-D forward simulation shows B at Y4 blocks A's right exit, yielding `{3,12}` instead of `{3,9,12}`. Correct B must move one further up to **Y3**, leaving an empty row before A. Likewise F at Y13 would block D's right exit if D were Y14; D must finish at **Y15**, leaving Y14 empty.
- Correct final bars: B `(7,3)`, A `(4,5)`, C `(0,9)` unused, E `(12,10)`, F `(13,13)`, D `(10,15)`. With empty separation rows, 2-D simulation gives the intended trace and final columns `{3,9,13,17}` before cups.
- Immediate correction/probe: click the B-only area `(35,15)` and require B->9 while A stays8; then ACTION1 moves B to physical y11..13 (Y3). If click selects the whole connected visual component, stop and re-plan.
- After correction: select D, right4, probe ACTION2/down, ultimately down6 to Y15; then C left2, E left2, ACTION5.
- Ruled out: all bars fixed to original rows; B Y4/A Y5 adjacency; F Y13/D Y14 adjacency.
