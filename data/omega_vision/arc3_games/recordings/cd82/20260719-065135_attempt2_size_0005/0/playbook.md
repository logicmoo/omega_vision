# Working model
- [Checked through level 1] The board is 64x64. Background is color 5; the reference is the 10x10 panel at x=3..12,y=3..12; framed top-bar swatches list the construction colors. A color-2 bracket and enlarged fill mark the active 10x5 slab. The central unbracketed region is the already-placed construction.
- [Checked, level 1] Objective: move the active slab to the spatial side indicated by the reference, then press ACTION5 to submit/drop it. Merely reaching the target pose does not complete; ACTION5 completed level 1 when 15 had been moved beneath 0 to match reference `0 over 15`.
- [Checked] Direction controls are conventional: ACTION2=down, ACTION3=left, ACTION4=right; ACTION1 is strongly expected to be up. A directional input moves/rolls the active slab through 45-degree poses on an 8-neighbor ring. Verified level-1 route: N --left--> NW --down--> W --down--> SW --right--> S.
- [Checked] ACTION6 on a playfield object does not select it. ACTION5 is submit/drop; whether it advances between multiple active colors is being tested now.
- [Strongly supported] The reference is built sequentially by spatial half-plane cuts: each new swatch color occupies the side/direction where that slab should be placed relative to prior slabs. Example: adding 15 south of 0 gives the level-1 horizontal `0/15` split. This interpretation predicts level-2 placements but is not yet checked beyond level 1.
- [Checked observations; semantics uncertain] The full-width color-4 strip at y=63 is an action/deadline budget. It reset on level transition. It does not change on every directional action, so do not use it as evidence of movement success.

# Working memory
- Level 2, step 6, 1/6 complete. Fresh budget: all 64 bottom cells are color 4.
- Placed base is color 0 at x=27..36,y=34..43. Active color 15 is in the default north pose (fill x=26..37,y=25..31; bracket x=25..38,y=24..32). Top swatches are 0,15,12, with the marker under 15.
- Target panel partitions as: 15 in the upper-left, 0 in the lower-left, and 12 in the southeast (`12` exactly where local x+y>=9/10). This strongly indicates sequential desired placements: 15 north of 0 (already true), then 12 southeast of the existing construction.
- Next deliberate probe: ACTION5 without moving 15. Prediction: it accepts/locks the already-correct north placement and advances the active marker/piece to color 12 rather than completing the level. If confirmed and 12 starts north, predicted shortest route to southeast is ACTION4, ACTION2, ACTION2, then ACTION5.
- Ruled out this level: nothing yet.
