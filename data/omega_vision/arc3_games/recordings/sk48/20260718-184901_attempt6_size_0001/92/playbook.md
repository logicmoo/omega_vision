# sk48 playbook

## Working model
- **Checked (step 0):** The playfield is a 5x5 logical room: pixel tiles are 6x6, room x=17..46/y=12..41, with logical centers x=19.5+6c, y=14.5+6r. A magenta source/device sits just left of logical cell (0,4), and a two-pixel patterned lead already occupies the entry into that cell.
- **Checked (step 0):** Three 4x4 colored objects occupy logical cells red/color 8 at (4,1), blue/color 9 at (4,2), and green/color 14 at (4,3). The bottom panel depicts magenta -> red(8) -> green(14) -> blue(9), joined in that order.
- **Strong hypothesis, not yet live-checked:** This is a path/lead-routing puzzle: steer the lead through the room and contact objects in the bottom-panel order (8,14,9), likely without crossing its existing path or touching a later color early.
- **Assumed until first probe:** ACTION1/2/3/4 are up/down/left/right respectively; one input advances the active lead by one 6-pixel logical cell. ACTION7 is undo; ACTION6 is likely mouse control/alternate selection.
- **Unresolved:** The vertical alternating 2x22 strip at x=13..14 above the source may be a move/length budget; track it after every move. Collision/deadline rules and exact lead pixel pattern are not yet known.
- **Likely route only, do not commit yet:** If path cells cannot be revisited, an open simple route consistent with required order is UUUU, RRRR, D (red), LDD, R (green), U (blue). This depends on all assumed mechanics and control mapping.

## Working memory
- Level 1, 0/8 completed, fresh step 0. Inferred active logical entry position: (0,4).
- Next: one deliberate ACTION1 probe. Hypothesis: standard up control extends/moves the lead from (0,4) to (0,3); prediction: a new patterned segment appears in the first room column around x=18..22/y=32..38, while targets remain fixed, and the vertical strip may shorten/change by one unit. Inspect all animation frames and diff before any further move.
- Ruled out: nothing yet; only the RESET frame exists.
