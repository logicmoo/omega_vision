# Working model

- **Checked from step 0:** Board is 64×64 with a 5-cell tile scale. Gray (5) forms one connected, stepped play area; yellow (11) fills the left background and orange (12) the right. Two identical cyan (10) 5×5 squares start at bboxes `(19,49)-(23,53)` and `(39,49)-(43,53)`. Top and bottom border rows are gray. Six levels are required; initial actions available are ACTION1–ACTION6.
- **Assumed, awaiting first probe:** ACTION1–ACTION4 are up/down/left/right (usual mapping), probably moving both cyan squares on gray floor. ACTION5 may be interact; ACTION6 is coordinate input.
- **Goal hypotheses (unconfirmed):** likely a synchronized two-piece navigation puzzle; pieces may need to meet via the gray structure. Movement may be one 5-cell tile, one pixel, or sliding until blocked. Yellow/orange likely impassable terrain, but this has not yet been tested.

# Working memory

- Level 1, fresh attempt, 0/6 complete. Cyan centers are `(21,51)` and `(41,51)`.
- Next deliberate probe: ACTION1. Hypothesis: it is up and moves both pieces upward onto gray. This should at minimum turn `(21,48)` and `(41,48)` cyan and vacate bottom cells `(21,53)` and `(41,53)` to gray if movement is incremental; a mismatch distinguishes mapping / single-piece / sliding behavior.
- Ruled out: nothing yet; only the initial board exists in the log.
- After probe, inspect all frames and settled diff before taking another action; infer displacement and whether both pieces move.
