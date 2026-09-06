# Working model

- [Checked, levels 1-7] Gravity navigation uses 6-pixel logical cells. Cyan (10) is open; patterned 5/3 is solid. ACTION3 moves/faces west and ACTION4 east. A successful horizontal step is followed by full gravity settlement. Vertical travel anchors at screen y39 upward and y29 downward.
- [Checked] ACTION6 removes green rounded blocks (14). Red (12) toggles individually: sparse 5-pixel X = traversable, rounded 21-pixel body = solid. Visible objects can be clicked remotely.
- [Checked] White/yellow (15/11) bodies are immutable lethal hazards. Color-7 pluses are exits requiring physical contact. Clicking cyan/avatar/hazards/exits is inert.
- [Checked] ACTION6 on rounded gray (8) removes it and reverses gravity; each is one-use. Level 7's x3 border column is a gameplay reverser bank, not the timer.
- [Checked] ACTION7 restores the preceding substantive state but spends timer. Bottom row is a 64-action deadline (level 7 fill color 7). Need 9 levels total.
- [Solved level 6] `scratch/level6_sim.py`/validator retrodicted all 954 level-6 frames; its searched route completed the level at step 259.

# Working memory

- Level 7, 6/9 complete. Step 268 entered unseen x57 under upward gravity and caused GAME_OVER; harness RESET at step 269, so current board is fresh initial state: avatar (21,39), gravity up, camera0, timer0, all objects reset.
- [Cause identified, checked from all 57 death frames] x57 is open upward from y15 through y-45, but contains an immutable hazard at world (57,-51). The avatar traveled into exactly that hazard. The death camera scrolled to -84 and exposed the entire missing upper map; never repeat the direct x51/y15 -> x57/up move.
- Upper map additions: hazards (27,-27),(39,-27),(33,-9),(45,-9),(57,-51). A controllable gate column runs x45 at y=-51,-45,-39,-33,-27; other upper gates are x21/-27; x21,x27,x39,x45/-21; x21,x33,x45/-15; x21/-9. Initial rounded gates are (39,-21),(33,-15). Row -57 is a solid ceiling. This allows climbing x45 safely, then reversing at y-39 and entering x57 with **downward** gravity below the lethal hazard.
- Lower known map: exit (21,75), hazard (51,69); row57 blocks x15..45, row63 is open, row75 walls x33/x39/x51, row81 walls x33/x39. Only support row y87 and territory below y84 remain unseen.
- [Executable/retrodicted] `scratch/level7_sim.py` includes every observed row/gate/hazard. It reproduces steps 260-267 and predicts step 268 as death at (57,-51). Bounded incremental A* found a 43-action fresh-attempt route. It zigzags through gates to x45/y-39 with gravity down (33 actions), moves to x51/y-33 (action34), then can enter x57 downward, rise back to open row63, walk west, and fall into the exit. The only remaining assumption is that descending x57 is safely supported at/below y81; inspect before that move.
- [Committed next] Execute the searched 34-action prefix entirely over observed terrain, ending world (51,-33), camera -62, gravity down, timer34. Concrete gray choices preserve a visible unused upper reverser for camera -90. Every click/move is simulator-forwarded with expectations; stop before the x57 descent into the unseen lower boundary.
