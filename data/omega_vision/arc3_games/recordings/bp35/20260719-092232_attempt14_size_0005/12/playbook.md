# Working model

- [Checked, levels 1-8] Logical cells are spaced 6 pixels. Cyan (10) is open; patterned 5/3 is terrain. ACTION3 moves/faces west and ACTION4 east; successful horizontal movement is followed by full gravity settlement. Camera scrolling generally anchors upward travel near logical screen y39 and downward travel near y29.
- [Checked, levels 1-8] ACTION6 acts remotely. Rounded green (14) is removed. Red (12) toggles individually between a traversable sparse plus and a solid rounded body. Rounded gray (8) is consumed and reverses gravity. Color-7 pluses are exits requiring avatar contact.
- [Checked, level 8] Rounded 21-pixel white bodies are solid propagators: clicking one removes it and creates bodies in each orthogonally adjacent open logical cell. Existing bodies, terrain, objects, and the avatar suppress children. Alternating `click blocker; move into its cell` clears a row because the avatar suppresses regeneration behind it. Ordinary 12-pixel white/yellow sprites are immutable lethal hazards; clicking is inert.
- [Checked] ACTION7 restores the preceding substantive board state but still spends the bottom-row timer. The border timer allows about 64 actions. Need 9 levels; levels 1-8 are complete. Level 8 was solved by exposing its remote gray, reversing down a cleared shaft, alternately clearing four white blockers, dropping through a sparse red gate, and entering the exit.
- [Checked] `scratch/level6_sim.py` and `scratch/level7_sim.py` preserve older level-specific engines/maps.

# Working memory

- Level 9 (final), 8/9 complete, current step 421; timer 0/64. Initial gravity is up: avatar is screen `(21,39)` beneath the y33 ceiling. No exit is visible.
- Initial objects: rounded white source `(39,15)`; two remote gray reversers `(3,27)` and `(3,39)` behind an inaccessible solid x9 wall. Open ceiling lanes are x33,x39,x45; lower chamber spans x15..57.
- [Strong, mechanically forward-simulated] Safest first bounded ascent: click white `(39,15)`, producing children `(33,15),(45,15),(39,9),(39,21)`; move east to x27, then x33. Up gravity carries x33 to world/screen-equivalent y21 beneath the new x33 source, with camera scrolling expected to leave avatar at screen `(33,39)` and its support at `(33,33)`. This reveals upper rows without an unbounded ascent.
- Do not click either gray until the newly revealed upper geometry shows which direction is needed. No level-9-specific mechanic has yet been observed.