# Working model

- **[Checked, levels 1–6]** `ACTION6` clicks color-matched actuator controls. A length panel's left/right glyph retracts/extends by 3 cells. The selected actuator changes length and translates its entire recursively downstream subtree by 3 along its direction.
- **[Checked, levels 1–6]** A lone magenta/color-13 cell is an active head; a hollow four-arm cross is a target. Docking gives a solid plus, and every head must be docked simultaneously. A previously docked head may be moved and restored.
- **[Checked]** Color-15 is fixed collision geometry; color-1 blocks can be pushed downstream. Any collision rejects the whole color action. UI panels and target arms are collision-transparent overlays.
- **[Checked, levels 5–6]** Same-color controls can drive several actuators. Side contact alone does not couple an object unless it is recursively downstream in the motion direction.
- **[Checked, level 6 through completion]** A direction-plus arm sets the selected actuator to that absolute compass direction and rigidly rotates every downstream actuator by the same turn. Downstream relative orientations are preserved; length changes do not rotate them.
- **[Checked exactly against level-6 boards]** For a width-3 actuator, use top-left joint coordinate `Q`, direction `d`, and `l=2+3n`. `Qchild=Q+(l+1)d`; its occupied cells form the corresponding `(l+1)×3` cap/body rectangle; an active head is `Q+(1,1)+(l-2)d`. Off-board geometry remains in state but is visually clipped and is not rejected. Rectangle-state collision BFS predicted all of level 6 and its completion at step 166.

# Working memory

- **Level 7/8 began at step 166; levels_completed=6.** There are two heads/targets: color10 is already docked as the solid plus centered `(22,7)`; the movable color12 head is `(55,16)` and its hollow target is centered `(25,16)`. Keep color10 docked.
- Main four-actuator chain, outer→inner, currently:
  - color11: `Q=(48,12)`, north, `l=2`;
  - color14: `Q=(48,9)`, east, `l=5`;
  - color9: `Q=(54,9)`, south, `l=5`;
  - color12 active head: `Q=(54,15)`, west, `l=2`, active `(55,16)`.
  Color12 has no direction selector, so its orientation stays one clockwise turn from color9 while parent rotations carry it.
- Separate stationary actuators can be left untouched: color10 is west from `Q=(33,6),l=14` and is already docked; color8 is south from `Q=(12,6),l=14` and has direction control only.
- Fixed wall rectangles: `x39..41,y0..29`; `y27..29` at `x0..5,x9..29,x33..38`; `x15..17,y30..44`; and full-width `y45..47` above the controls.
- Relevant controls: color11 extend `(10,51)`; color14 extend `(10,58)` and left direction `(16,58)`; color9 extend `(32,51)` and down direction `(39,52)`; color12 extend `(32,58)`. Other panels: color11 direction center `(17,51)`, color9 center `(39,51)`, color14 center `(17,58)`; compass arms are one cell U/L/R/D from center.
- **[Exact final-state collision BFS, bound 14; 9 valid goal states]** A 16-action shortest route leaves color8/color10 fixed and takes the main chain over the top of the main wall. Committed sequence with active-head positions:
  1. color9 extend ×4 `(32,51)` → `(55,19),(55,22),(55,25),(55,28)`;
  2. color11 extend `(10,51)` → `(55,25)`; color12 extend `(32,58)` → `(52,25)`;
  3. color11 extend → `(52,22)`; color12 extend ×3 → `(49,22),(46,22),(43,22)`;
  4. color11 extend → `(43,19)`; color14 extend ×2 `(10,58)` → `(46,19),(49,19)`; color11 extend → `(49,16)`;
  5. set color14 west `(16,58)`: its entire subtree goes off-board above the wall, active mathematically `(49,-20)` and visible `(49,16)` becomes background 5;
  6. set color9 south `(39,52)`: color12 rotates west and docks at `(25,16)`, expected level completion.
- The penultimate action is the first live opposite-direction (180°) selector use. Absolute-direction semantics strongly predict the final state; its explicit background expectation will stop the plan if opposite selection behaves differently.
