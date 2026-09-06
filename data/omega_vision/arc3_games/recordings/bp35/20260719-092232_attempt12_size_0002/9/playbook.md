# Working model

- [Checked, levels 1-7] Gravity navigation uses 6-pixel logical cells. Cyan (10) is open; patterned 5/3 is solid. ACTION3 moves/faces west and ACTION4 east. A successful horizontal step is followed by full gravity settlement. Vertical travel anchors at screen y39 upward and y29 downward.
- [Checked, levels 1-7] ACTION6 removes rounded green blocks (14). Red (12) toggles individually: sparse state is traversable and rounded state is solid. Visible objects can be clicked remotely.
- [Checked, levels 1-7] White/yellow (15/11) sprites were immutable lethal hazards in earlier levels; clicking them there was inert. Hold this loosely on level 8 because a new rounded white object strongly suggests an added white-state mechanic.
- [Checked] Color-7 pluses are exits requiring physical contact. ACTION6 on rounded gray (8) removes it and reverses gravity; each gray is one-use.
- [Checked] ACTION7 restores the preceding substantive state but spends timer. The bottom row is a 64-action deadline even when its fill is visually subtle. Need 9 levels total.
- [Solved] Levels 1-7 complete. `scratch/level6_sim.py` and `scratch/level7_sim.py` preserve the validated gravity engines and later-level maps; level 7 completed at step 312.

# Working memory

- Level 8, 7/9 complete; current settled board is the fresh level at step 312. Avatar is screen `(21,39)`, facing west and apparently under upward gravity. No exit, gray, green, or red object is currently visible.
- Visible logical layout uses x=9,15,...,57. Row y57 is solid; rows39/45/51 are open. Row33 is solid at x9..27 and x51..57 but open at x33,39,45. Rows15/27 are open. Seven ordinary lethal white/yellow sprites occupy `(9,9)` through `(45,9)`, and a novel rounded white 21-pixel body occupies `(15,21)`.
- Geometry makes direct entry from row39 into x33/39/45 lethal under upward gravity: those shafts lead to the white/yellow sprites at y9. The open x51/x57 shafts continue above the visible screen but are initially separated by the row33 wall.
- [Deliberate probe; not yet assumed] Level 8 may add a white toggle analogous to red: clicking a white/yellow hazard should turn it into a rounded solid white body, while clicking the rounded body may turn it hazardous. This would make a safe support at x33/y9, allowing ascent to y15 and later traversal toward x51. Probe ACTION6 on `(33,9)`; predicted transformed-block pixels include `(33,11)=15` and `(31,9)=15` while the avatar remains `(21,39)`. If inert, discard this hypothesis rather than repeating clicks.
- Ruled out from the existing board/history: no known green removal or gray reversal is available; prior-level white clicks cannot settle the new rounded-white behavior because that state never appeared before level 8.
