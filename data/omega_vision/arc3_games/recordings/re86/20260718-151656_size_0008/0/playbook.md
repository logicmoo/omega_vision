# Working model

- **Checked from step 0:** Board is 64x64. Background is color 5. Bottom row is a 64-cell color-15 strip and is likely the action-budget/timer HUD, not terrain. There are 8 levels total; available controls are ACTION1–ACTION5.
- **Checked from step 0:** Two matching-color systems exist. Yellow/color 11 has a radius-11 plus centered at (21,27) and four framed markers centered at (15,3),(6,9),(24,9),(15,17). Blue/color 9 has a radius-13 plus centered at (36,45), with its center uniquely black/color 0, and markers at (48,16),(40,24),(53,24),(48,35).
- **Strong geometric inference, not yet live-checked:** The black center marks the selected plus (initially blue). ACTION1/2/3/4 are up/down/left/right one-cell translations of that selected plus; ACTION5 switches selection. Goal is likely to align each plus with all four same-color marker centers. Each marker set lies on a plus centered at a unique target: yellow (15,9), blue (48,24).
- **Strong inference:** Shortest placement if the above is right is blue U21,R12 (33 moves), switch, yellow U18,L6 (24 moves): 58 actions including switch. The full 64-cell edge bar plausibly gives only six moves of slack. Do not spend arbitrary probes.

# Working memory

- Level 1, 0/8 complete, fresh attempt. Selected/black center appears to be blue at (36,45); yellow center is (21,27).
- Current deliberate probe is ACTION1. Hypothesis/prediction: it means up and rigidly translates the entire blue plus to center (36,44), leaving yellow/markers unchanged. This is also one required shortest-path move if confirmed.
- If confirmed, commit in useful batches toward blue target center (48,24), while watching marker interactions and timer. If contradicted, use the exact diff to remap controls/mechanic rather than repeating.
- Ruled out: nothing yet; only initial-frame geometry has been observed.
- Next step: ACTION1 with checks at the center, horizontal rows, and vertical endpoints.
- Never double RESET; prefer recovery/undo if later offered.
