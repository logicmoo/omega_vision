# Working model

- [Checked, levels 1-8] Logical cells are spaced 6 pixels. Cyan (10) is open; patterned 5/3 is terrain. ACTION3 moves/faces west and ACTION4 east; every successful horizontal step is followed by full vertical gravity settlement. Camera scrolling generally anchors upward travel near screen y39 and downward travel near y29.
- [Checked, levels 1-8] ACTION6 remotely removes rounded green (14). Red (12) toggles individually: sparse plus-form is traversable and rounded 21-pixel form is solid. Visible objects can be clicked remotely.
- [Checked] Color-7 pluses are exits requiring avatar contact. ACTION6 on rounded gray (8) consumes it and reverses gravity. Ordinary 12-pixel white/yellow sprites are immutable lethal hazards; clicks are inert.
- [Checked, level 8] Rounded 21-pixel white bodies are solid propagators. Clicking one removes that source and creates bodies in each orthogonally adjacent open logical cell; existing bodies remain, while terrain/objects/avatar suppress a child. Avatar occupancy suppression is crucial for clearing a row by alternating click and move.
- [Checked] ACTION7 restores the preceding substantive board state but still advances the bottom-row timer. The bottom row is a 64-action deadline. Need 9 levels; levels 1-7 are complete. `scratch/level6_sim.py` and `scratch/level7_sim.py` preserve older engines.
- [Checked, level 8 step 367] The needed gray is not absent: after the x27 elevator reaches avatar world `(27,-105)`, the gray at world `(33,-141)` becomes barely visible at screen `(33,3)` and can be clicked remotely. No automatic apex trigger is needed.

# Working memory

- Level 8, 7/9 complete, current step 367. Avatar is at world `(27,-105)`, gravity up; gray reverser is visible at screen `(33,3)`. Timer is already 55/64.
- Current return shaft is clear down to the constructed floor, but the eastward row contains solid propagated bodies. Retrodiction from steps 319-325 proves bare east moves cannot cross these bodies: each must be clicked while the adjacent avatar suppresses its left child, then entered. Gray + alternating clears/moves + pocket/exit needs at least about 10 actions, so the present 9-action budget is unsafe. Next action: one RESET (not another reset afterward).
- After RESET, replay the known 26-action route to gameplay state 339, omitting the inert initial hazard click: `click (15,21),(21,21),(27,21); E,E; click (33,33),(39,39); E; click (45,39); E; click (51,39); E; click (51,33)x4; click (45,39); W x5; click (21,33)x4`.
- Then replay the successful 16-action branch: `click red (51,51); click (27,45),(33,45),(39,45),(45,45),(51,45); click (27,39); E; click overhead (27,33)x8`. This reveals gray with timer 42/64, leaving ample room to reverse and solve the return carefully.
- Preserve the sparse exit gate at world `(51,-45)`. After reversal, inspect/retrodict exact settled screen geometry before committing the alternating body-clears and final pocket entry.
- Ruled out: ordinary hazard/exit clicks; alleged solid ceiling with no gray (it was merely above the prior viewport); bare five-east return through same-level white bodies; spending the current near-expired attempt on the return.