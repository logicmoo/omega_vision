# Working model

- [Checked, steps 0-7] This is an upward-scrolling navigation/breaking game on logical tiles spaced 6 px. Cyan (10) is empty/traversable space; patterned dark (5/3) is solid terrain; rounded green tiles (14) are breakable blockers; the blue/yellow object (9/11) is the avatar. The avatar normally settles around logical row center y=39 while the camera follows vertical progress.
- [Checked, steps 2,4-6] ACTION4 moves the avatar one logical column east (+6 px). If the new column has cyan above, the avatar automatically rises through it until the next solid/green ceiling; animation shows the avatar rise, then the camera recenters it and shifts the world downward by exactly the gained height. Entering the x=45 shaft at step 6 caused an 18-px/3-row ascent.
- [Assumed, high confidence] ACTION3 is the symmetric one-column west move; not yet directly tested. It may flip the facing sprite, so first use only one ACTION3 before batching.
- [Checked, step 7] ACTION6 on a green blocker erases that logical green tile. If it is directly overhead, the opened path makes the avatar auto-rise until the next blocker. Clicking green at (45,33) removed it and caused a 24-px/4-row ascent. ACTION6 on empty cyan or on the avatar itself is inert (steps 1 and 3). Whether distant green can be broken is untested and unnecessary so far.
- [Supported, not yet directly tested] Dark patterned terrain is unbreakable; navigate horizontally while supported by a ceiling until beneath a green tile or an open vertical gap. The likely objective is to keep ascending until the level exits/completes.
- [Checked, steps 5-7] Camera scrolling explains the large diffs: step 5 board shifted down 3 logical rows at step 6 (apart from avatar), and step 6 shifted down 4 rows at step 7 with only the clicked green missing. These are not arbitrary board mutations.
- [Checked] ACTION7 is available and likely undo. Bottom row is a 64-action budget bar, filling one cell per live action. Need complete 9 levels total.

# Working memory

- Level 1, step 7, 0/9 complete. Avatar at (45,39), east-facing, held beneath the ceiling at y=33. HUD has consumed 7/64 cells.
- Current ceiling y=33: green at x=15,21,27; dark at x=33,39,45,51. Thus move west to a breakable column. Above it, y=27 and y=21 are all cyan; at y=15 green is at x=27,33,39 but x=15,21,45,51 are cyan.
- Next step is one ACTION3 probe, predicting west translation to center (39,39) with no camera scroll because x=39 still has dark directly overhead. If confirmed, likely continue to x=21 (four total west moves from x45) rather than x27: breaking x21 should pass the visible y=15 green row and potentially gain more height, while x27 would immediately meet another green after only 3 rows.
- Ruled out: arbitrary click-to-move, avatar-click rotation, ACTION4 rotation, and unexplained environment evolution.
