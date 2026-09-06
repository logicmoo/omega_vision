# Working model

- [Checked, levels 1-7] Gravity navigation uses 6-pixel logical cells. Cyan (10) is open; patterned 5/3 is solid. ACTION3 moves/faces west and ACTION4 east. After a successful horizontal step, gravity carries the avatar to the next solid. Same-row solids block. Vertical travel recenters at screen y39 when rising and y29 when falling.
- [Checked] ACTION6 removes green rounded blocks (14). Red (12) toggles individually: sparse 5-pixel X = traversable, rounded 21-pixel body = solid. Clicks target any visible object regardless of avatar distance; cyan/avatar clicks are inert.
- [Checked] White/yellow (15/11) bodies are immutable lethal hazards. Color-7 pluses are exits requiring physical contact; clicking hazards/exits is inert.
- [Checked] ACTION6 on rounded gray (8) removes it and reverses gravity; each is one-use. Level 7's border-hugging gray column is a gameplay reverser bank, not the timer.
- [Checked] ACTION7 restores the preceding substantive gameplay state but still spends timer. Bottom row is a 64-action deadline (level 7 uses fill color 7). Need 9 levels total.
- [Solved level 6] Three grays, including one hidden above the initial viewport, were required. `scratch/level6_sim.py`/validator retrodicted all 954 recorded level-6 frames; searched route completed it at step 259.

# Working memory

- Level 7, 6/9 complete, after step 267 at timer 8/64. Avatar is world (51,15), screen (51,39), camera -24, gravity upward, facing east. Consumed grays are world (3,3) and (3,27). Rounded gates are the initially active (39,-21),(33,-15), plus our activated (39,39); all other seen gates are sparse.
- Lower map: exit (21,75); hazards (21,27),(45,27),(51,69). Row57 blocks x15..45, row63 is open x15..57, row75 walls x33/x39/x51, row81 walls x33/x39. World below y84 remains unseen.
- Newly stitched upper rows: y=-3 is solid x21..51 but open at x15/x57; y=-9 has hazards x33/x45 and a sparse gate x21; y=-15 has gates x21, x33(active), x45; y=-21 has gates x21,x27,x39(active),x45 and wall x51. The x57 vertical corridor is safely open throughout all observed rows down to y=-21. Grays continue at x3 through this upper region.
- [Model status] `scratch/level7_sim.py` has been extended with every row/object now observed. Replaying steps 260-267 predicts the exact current avatar/camera and all 23 visible gate states with zero errors. Its former tentative 17-action goal route is **falsified** because it assumed y=-3 would support x57; x57 is actually open there. Unknown default-wall cells must not be used for a goal plan.
- [Unexplored territory] World above y=-24 and below y84 are still unseen. The only route out of the current upper-right channel is east into x57; with upward gravity it traverses the known-safe y9..-21 corridor and then exposes the next upper section. No visible gate can provide an earlier x57 support.
- [Next deliberate reveal] ACTION4 into x57. Predict safe upward travel and an avatar anchored at screen (57,39), settling immediately below the first unseen solid. Stop after this one action to infer its world y/camera and inventory the newly exposed rows before revising the simulator/search.
