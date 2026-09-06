# Working model

- [Checked, levels 1-7] Gravity navigation uses 6-pixel logical cells. Cyan (10) is open; patterned 5/3 is solid. ACTION3 moves/faces west and ACTION4 east. After a successful horizontal step, gravity carries the avatar to the next solid. Same-row solids block. Vertical travel recenters the camera at screen y39 when rising and y29 when falling.
- [Checked] ACTION6 removes green rounded blocks (14). Red (12) toggles individually: sparse 5-pixel X = traversable, rounded 21-pixel body = solid. Clicks target any visible object regardless of avatar distance; cyan/avatar clicks are inert.
- [Checked] White/yellow (15/11) bodies are immutable lethal hazards. Color-7 pluses are exits requiring physical contact; clicking hazards/exits is inert.
- [Checked] ACTION6 on a rounded gray (8) removes it and reverses gravity; each is one-use and its vanished location is inert. Level 7 confirms that even a border-hugging column of these sprites is a bank of gameplay reversers, not the timer.
- [Checked] ACTION7 restores the preceding substantive gameplay state (avatar, gravity, objects, camera) but still spends timer. Bottom row is a 64-action deadline (its fill color can vary; level 7 uses 7). Need 9 levels total.
- [Solved level 6] Three grays at world (39,33), (27,87), and hidden (51,-93) were required. `scratch/level6_sim.py`/validator retrodicted all 954 recorded level-6 frames with zero errors; searched route completed it at step 259.

# Working memory

- Level 7, 6/9 complete, after step 260 at timer 1/64. Clicking gray world (3,3) behaved exactly as predicted: it was consumed, gravity became downward, and avatar is world (21,51), screen (21,29), camera +22, facing east.
- The scroll exposed world rows through y81. Exit is at (21,75). New hazard is (51,69), in addition to (21,27),(45,27). Grays continue every 6 rows at x3 through at least world y81; the x9 wall isolates them physically but they are remotely clickable. Red gates are x27/33/39 at y3/9/15/21/27 plus (39,39),(39,51), initially sparse.
- Key stitched terrain: row57 is solid x15..45 and open x51/x57; row63 is open x15..57; row69 is open except hazard x51; row75 has exit x21 and walls x33,x39,x51; row81 has walls x33,x39. World above y0 and below y84 remains unseen.
- [Executable/tentative] `scratch/level7_sim.py` adapts the checked engine and exactly predicts the initial gray transition. On the stitched map, a restricted BFS finds a 17-action suffix: reach x39/y51, activate gate (39,39), reverse up to y45, go east/up to the top-right, descend x57, rise to open row63, go west, then fall into the exit. Its assumptions about unseen support rows y=-3 and y87 must be checked before committing past them.
- [Searched next prefix] Seven actions use only checked visible terrain and end in a territory reveal: east to x39/y51; activate red (39,39) at current screen (39,17); consume unused gray world27 at screen (3,5) to reverse upward and stop at x39/y45; east to x45/y45 and x51/y15. Final camera -24 exposes unseen world rows -24..-1 before entering x57. Predicted timer 8.
