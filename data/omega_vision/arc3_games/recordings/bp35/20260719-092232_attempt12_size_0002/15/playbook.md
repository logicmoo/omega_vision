# Working model

- [Checked, levels 1-7] Gravity navigation uses 6-pixel logical cells. Cyan (10) is open; patterned 5/3 is solid. ACTION3 moves/faces west and ACTION4 east. A successful horizontal step is followed by full gravity settlement. Vertical travel anchors at screen y39 upward and y29 downward; world y = screen y + camera.
- [Checked, levels 1-7] ACTION6 removes rounded green blocks (14). Red (12) toggles individually: sparse state is traversable and rounded state is solid. Visible objects can be clicked remotely.
- [Checked] Color-7 pluses are exits requiring physical contact. ACTION6 on rounded gray (8) removes it and reverses gravity; each gray is one-use. Ordinary white/yellow (15/11) sprites are immutable lethal hazards; clicking one on level 8 was inert.
- [Checked] ACTION7 restores the preceding substantive state but spends timer. The bottom row is a 64-action deadline. Need 9 levels total; levels 1-7 are solved. `scratch/level6_sim.py` and `scratch/level7_sim.py` preserve earlier engines/maps.
- [Checked, level 8 steps 314-316] Rounded 21-pixel white bodies are a new solid propagation mechanic. Clicking one removes that source and creates rounded bodies in each orthogonally adjacent 6-pixel cell that is not already obstructed; existing adjacent bodies remain. This was retrodicted over three successive eastward expansions. Gravity settlement after removing a player support is expected from the common engine but not yet directly checked for white.

# Working memory

- Level 8, 7/9 complete, current step 318; timer 6/64. Gravity is up. Avatar is screen `(33,39)`, world `(33,27)`, camera `-12`, facing east.
- Current rounded-white world set is `y15:{15,21,27}; y21:{9,15,21,33}; y27:{15,21,27}`. Ordinary lethal hazards are `(x,9)` for x=9..45 by 6. A newly revealed rounded red gate is world `(45,-3)` / screen `(45,9)`.
- Checked static route: x51 is open at world y21,15,9,3,-3 and has a solid ceiling at y-9. The wall at world y33 blocks x51/x57; avatar is already above it. Thus x51 is the safe shaft past the y9 hazard row.
- Next deliberate probe: click the current overhead white support at screen `(33,33)` (world `(33,21)`). Predicted propagation creates upper support `(33,15)` and side bodies `(27,21),(39,21)`; avatar rises one cell to world y21, camera becomes -18, and remains screen `(33,39)`. In the new screen, upper support remains centered `(33,33)`, old lower child is `(33,45)`, and red shifts to `(45,15)`.
- If confirmed, shortest known continuation is: click side body `(39,39)`, east to x39; click `(45,39)`, east to x45; click `(51,39)`, east to x51. Then click the overhead support `(51,33)` four times to climb the safe shaft to world y-3 under the static y-9 ceiling and reveal the upper map.
- Ruled out: ordinary hazard clicks; direct entry into x33/39/45 shafts without white support; undoing to over-propagate row21 (downward children then prevent the needed rise and x51 is walled at y33).
