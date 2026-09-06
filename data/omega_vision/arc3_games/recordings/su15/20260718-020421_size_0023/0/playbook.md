# Working model

- **Checked (step 0):** Board is 64x64. Header is rows 0-9 (color 4) and contains a 3x3 color-15 square centered at (31,5). Playfield is rows 10-62 (color 5); row 63 is a color-0 border. Only ACTION6 (coordinate click) and ACTION7 are available.
- **Checked (step 0):** A second, shape-identical 3x3 color-15 square is centered at (4,59). A color-0 plus/cross is centered at (10,53). Single color-3 cells form an exact diagonal at spacing (2,-2), continuing through the cross from the lower-left square toward a color-9 round object centered near (48,15); that object has a color-3 3x3 core.
- **Assumed, not yet tested:** The centered header square is a target exemplar, so clicking its identical playfield counterpart may solve the tutorial. The diagonal likely indicates aim/path/line of sight, but the roles of the cross and round object are unresolved.
- **Objective/controls:** Not established beyond coordinate clicking; ACTION7 is likely undo (assumed from interface convention).

# Working memory

- Level 1/9, initial state (step 0); no live probe yet.
- Cheapest high-information/probable-solution probe: click the center (4,59) of the playfield square matching the header exemplar. Prediction: level 1 completes. If it does not, inspect whether the click selected/moved/shot anything before testing the cross or the round object's core.
- Ruled out: nothing yet.
