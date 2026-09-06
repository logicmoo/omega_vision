# Working model
- **Checked (level 1):** The green 2x2 traveler moves one 2x2 tile per directional input: ACTION1=up and ACTION4=right (ACTION2/3 presumed down/left). It can traverse contiguous solid path tiles of several colors; when it leaves, the underlying tile color is restored. Mixed/checkerboard blue cells are closed and block movement. Blocked actions produce `[DIFF] none` and do not advance the bottom budget bar.
- **Checked (level 1):** Colored control icons are activated with ACTION6. A blue/color-9 control swapped two blue connectors between solid/open and checkerboard/closed. A red/color-8 control toggled a rectangular arm around a fixed color-13 joint between two orientations. Controls remained clickable after their white outlines vanished.
- **Checked objective:** Transfer green through reconfigurable solid paths to the 2x2 yellow/color-11 tile. Entering yellow completed level 1. Safe switching pattern: move onto a fixed joint while its incoming arm is connected, reorient the arm, switch the next connector open, then continue.
- **Checked HUD:** the bottom row is a successful-action budget bar; no-op moves do not fill it. Level 1 completed well before its deadline.
- **Hold loosely:** Later levels add colors, multiple arms, controls in new locations, and distractor branches; infer connectivity from the current board rather than assuming every switch is required.

# Working memory
- **Level 2, fresh board, 1/6 complete.** Arena left side ends at x=37; right-side large controls are color 6 near (52,22) and blue/color 9 near (52,40). A small red/color-8 down-arrow-like control is at x16–19,y52–55.
- Green starts at x6–7,y30–31. Yellow is x22–23,y12–13 inside the top gray node x20–23,y12–15.
- **Current open route (checked from geometry):** green's gray node x4–7,y28–31 connects right through solid blue x8–11,y28–31, then upward into gray x8–11,y24–27 and right across a horizontal red assembly to the fixed color-13 joint x20–23,y24–27. The alternative vertical blue connector x4–7,y32–39 is checkerboard/closed.
- **Planned solution hypothesis:** move to the red joint via R,R,U,U,R×5. Click the small red control at (17,54); predict the two horizontal red arms rotate into a vertical bridge, with color 8 appearing at x20–23,y16–23 and connecting the joint to the goal. Then move U×7 and R onto yellow. Per-cell expectations will stop if the new red control behaves differently.
- Lower color-7/color-6 branch at y40–43 and large color-6/blue controls are likely an alternate/distractor route and are not used unless the direct red route fails.
