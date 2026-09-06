# Working model

## Checked against log
- Logical cell scale varies: L1-3 used 4x4 cells; L4 is width 20 with 3x3 cells and physical origin `(2,2)`, so logical `(X,Y)` occupies x=`2+3X..4+3X`, y=`2+3Y..4+3Y`.
- ACTION1=up, ACTION3=left, ACTION4=right by one logical cell; ACTION5 starts flow; ACTION6 selects a clicked movable entity and deselects the old one. ACTION2/down remains untested.
- Selected movable material is color9 and inactive material color8. Entity identity is not just a visible connected component: step35 selected B alone when it touched A on another row, while step37 clicking either wing of L4's `8884888` row selected both wings and step38 shifted both wings **and the central color4** together. Thus that row is one composite movable entity G, not two bars plus a fixed cell.
- On ACTION5, color6 grows one logical cell/frame away from its adjacent color4, leaving a trail. Retrodicted local rule: a frontier advances forward if open; if forward is blocked it instead spreads left/right on its current row; old trail is not an obstacle. `scratch/flow.py::grow_grid` is the exact 2-D model.
- A separated solid interval hit by streams transforms the streams that hit it to its two outside columns. Adjacent bars can block a lateral exit, so validate layouts in the 2-D model. Side-board exits are suppressed; color11 U shapes contain successful streams.
- Completed L1 split, L2 cascade, L3 multi-source/edge suppression.

## Assumed / to test
- ACTION2 is down.
- G's central movable color4 is a solid flow obstacle like its two wings. The proposed L4 layout has been exact-simulated successfully but not yet run live.

# Working memory
- Level4 after step38, progress 3/6, timer strip 57/64. Source `{7}` flows down; cup openings are `{3,9,13,17}`.
- Correct initial entities `(name,length/pattern,L,Y)`: A `(5,5,5)`, B `(5,12,5)`, G `("8884888",2,9)`, E `(4,14,10)`, F `(4,12,13)`.
- Current: A inactive `(4,5)`, B inactive `(7,3)`, G selected `(3,9)` after the beneficial step38 right move, E inactive `(14,10)`, F inactive `(13,13)`.
- Prior C/D-independent plan is falsified by step37-38; do not revive it.
- Python search found a 22-movement, collision-free candidate: B `(7,3)`, G `(9,8)`, E `(13,10)`, F `(9,12)`, A `(4,14)`. Stream trace is `{7}->{6,12}->{6,8,16}->{6,8,12,17}->{6,8,13,17}->{3,9,13,17}`; exact `grow_grid` reaches precisely all four cup openings.
- Remaining moves for that candidate: G right6/up1; E left1; F left4/up1; A down9. A can pass safely because it ends at x4..8 while G/F start at x9. Three selections plus ACTION5 are needed.
- Immediate plan: perform all confirmed G/E/F moves, select A, then use exactly one ACTION2 as the final probe expecting A Y5->Y6. If confirmed, down8 and ACTION5.
- Ruled out: B-at-Y4 adjacency layout; treating G as independent C/D bars; old final `(C0,D10)` plan.