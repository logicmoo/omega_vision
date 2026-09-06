# Working model

- **[Checked, levels 1–5]** `ACTION6` clicks color-matched actuator controls. The left glyph retracts one 3×3 unit toward the gray cap; the right glyph extends one unit away. Either translates every recursively downstream touching object by 3. Side-adjacent objects not downstream along the motion axis do not couple.
- **[Checked, levels 1–5]** A single magenta/color-13 center marks an active head; a hollow four-arm magenta cross is a target. Docking makes a solid plus, and all active heads must be docked simultaneously. An initially docked head can be moved away and later returned.
- **[Checked]** Color-1 blocks can be moved downstream; color-15 blocks are fixed barriers. A collision in any branch of a shared-color action rejects the whole action, including same-color actuator occupancy or two fronts requesting one cell.
- **[Checked, levels 4–5]** UI panels and target arms are collision-transparent overlays and remain visually rendered over gameplay beneath them. Bottom row is the action-budget HUD.
- **[Checked, level 5]** A control color may drive multiple linked actuators. Exact rectangle-state BFS correctly predicted the full collision-free route and showed that temporarily undocking a completed head can be required.

# Working memory

- Level 6/8 began at step 141. One color9 active center is `(49,13)`; the hollow target is centered `(52,34)`.
- Gameplay is a nested three-actuator chain:
  - inner color9: gray north cap `x48..50,y9`, colored shaft/head `x48..50,y10..14`, active center `(49,13)`, initially points south;
  - middle color11: gray west cap `x39,y9..11`, body `x40..47,y9..11`, carries the entire color9 actuator, initially points east;
  - outer color14: gray south cap `x39..41,y17`, body `x39..41,y12..16`, carries the color11/color9 assembly, initially points north.
- Fixed color15 maze: left wall `x3..8,y27..41`; top wall `x18..59,y27..29`; right wall `x57..59,y27..41`; lower-right wall `x45..59,y39..41`. Openings are top-left `x9..17` and bottom `x9..44`; the target lies inside at `(52,34)`.
- Normal length controls are bottom panels: color9 retract/extend `(9,57)/(15,57)`, color11 `(28,57)/(34,57)`, color14 `(47,57)/(53,57)`.
- **[New mechanic, untested]** Each color also has an upper plus-shaped control centered at `(12,48)`, `(31,48)`, `(50,48)`. Best hypothesis: it reorients/rotates that color's actuator by 90 degrees; alternatively its individual arms directly select a direction. No prior level/log action tests these controls.
- Next action is one deliberate inner-actuator probe on the right arm `(13,48)`. Prediction under both leading hypotheses: color9 changes from south-pointing to east-pointing while preserving its attachment at x48, becoming a horizontal actuator around `x48..53,y9..11`, and the active center moves to `(52,10)`. If only a fixed opposite rotation is supported, the move may be blocked by the color11 body; do not repeat without inspecting the diff.