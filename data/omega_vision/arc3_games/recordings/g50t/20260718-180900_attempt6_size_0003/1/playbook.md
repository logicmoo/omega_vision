# Working model

- **Checked (level 1):** Movement is on logical centers spaced 6 pixels. ACTION1=up, ACTION2=down, ACTION4=right; each moves one track edge with a 7-frame animation. ACTION3 is strongly expected to be left but has not yet been live-tested. Color 5 is track, the active player is a color-9 5x5 ring with an explicit color-5 center, and entering the matching color-9 open-frame/dot goal completes the level automatically.
- **Checked (level 1):** ACTION5 is the time-clone/rewind control. It reverses the active timeline to the start, records its inputs, changes that timeline to a clone, and activates the next HUD slot. On every later input, each recorded clone replays one recorded input synchronously. Once its input list ends, a clone remains forever at its endpoint. The number of top-left 3x3 HUD slots is the number of timelines; therefore use ACTION5 at most `slots-1` times and only after programming a correct endpoint.
- **Checked (level 1):** Color-8 systems consist of a 3x3 pressure pad, a thin wire/rail, and a notched 5x5 blocker. Occupying the pad moves the blocker one logical tile along its rail and clears the track node it blocked. Leaving/rewinding restores world state, while a completed clone can hold a pad indefinitely. This is the purpose of time clones.
- **Checked (level 1):** A full color-9 bottom border drains gradually (roughly one cell per two physical actions) and is a budget/HUD, not terrain. Level 1 completed by clone `right×4` holding `(40,10)`, then active `down×7,right×5` to `(46,52)`.
- **Safety:** RESET restarts the level; never issue two RESETs consecutively. ACTION5 is not ordinary interaction or undo and can consume a timeline slot.

# Working memory

- **Level 2, step 27, fresh board; 1/7 complete.** Start/current center `(52,28)`, goal `(28,22)`, and three HUD timeline slots (two rewinds/clones). Available ACTION1–ACTION5.
- **Checked board geometry:** Switch B `(40,28)` is wired downward to blocker B `(40,52)`; switch A `(16,40)` is wired upward to blocker A `(16,22)`. Blocker B bars the route to switch A; blocker A bars the final route to the goal.
- **Derived solution (strong, geometry/timing checked in Python; pressure directions not yet live-tested on level 2):**
  1. Timeline 1: `left×2` to switch B `(40,28)`, then ACTION5.
  2. Timeline 2: `down×4,left×4,up×2,left×2` to switch A `(16,40)`, then ACTION5. Clone 1 reaches B on tick 2 and persists, so blocker B is open before timeline 2 crosses it on tick 6.
  3. Timeline 3: `up×3,left×7,down×2,right×3` to goal `(28,22)`. Clone 2 reaches A on tick 12 exactly when active reaches `(10,22)`; active crosses blocker A on tick 13.
- **Next deliberate step:** Test required ACTION3=left from `(52,28)` to plain-track `(46,28)`. If confirmed, move left once more onto switch B and verify blocker center `(40,52)` clears before committing ACTION5.
- **Ruled out:** no level-2 probes yet; do not alter the derived schedule without contradictory board evidence.
