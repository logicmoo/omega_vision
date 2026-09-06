# Working model

- **[Checked]** Length controls change an actuator by 3 and translate its predefined downstream subtree. Fixed color-15 and occupied actuators reject collisions; targets/UI are transparent.
- **[Checked]** Color-13 heads must simultaneously occupy hollow-cross targets.
- **[Major correction, retrodicted through all level-6 actions and checked by step-185 attempted frame]** A small plus panel is not four absolute direction buttons. Clicking its colored glyph rotates the actuator exactly one quarter-turn counterclockwise: `S→E→N→W→S`. Every level-6 direction action followed this cycle, regardless of which plus arm was clicked. The downstream subtree rotates rigidly by the same turn.
- **[Checked kinematics]** Width-3 actuator: joint `Q`, direction `d`, `l=2+3n`; `Qchild=Q+(l+1)d`; active=`Q+(1,1)+(l-2)d`.
- **[Checked, steps 143,180–181]** Partial off-board clipping is allowed, but an action rolls back if a moved actuator becomes wholly invisible.
- **[Checked, step 184]** Color10 cannot push the anchored color8: after contact, the next extension collided and rolled back. Whether an anchored rotator can capture/carry an object newly adjacent to its tip is still unknown.

# Working memory

- **Level 7/8; completed=6.** Main chain remains `(A,B,C,D)=(4,4,6,4)`, directions `(N,E,S,W)`, joints `(48,12),(48,0),(60,0),(60,18)`, active `(49,19)`.
- Left subsystem current after step 185: color10 is W with `l=20`, body `x15..35,y6..8`, active `(16,7)`; color8 is still S at `Q=(12,6),l=14`. Step 185 clicked the color8 plus: its attempted frame rotated S→E (`x12..26,y6..8`), collided with color10, then rolled back with `[DIFF] none`. This directly exposed the CCW-cycle rule.
- Fixed-relative main chain still has no visible collision-free target geometry (checked through coefficient 100); some transfer/base-shift mechanic is required. If color12 could be independently flipped, the clean final geometry is `(6,6,5,2)` with `(S,W,N,W)`, routed below the wall and up opening `x30..32`.
- **Current setup/probe plan:** retract color10 four times using `(54,51)`, moving its head `19→22→25→28` and shortening to `l=8`, body `x27..35`, so color8 can rotate without overlap. Then click color8 plus `(60,57)` once: S→E, body `x12..26` adjacent to color10. Click it a second time: local-only behavior predicts E→N with color8 visible at `(13,0)` and color10 unchanged at `(28,7)`; if new tip adjacency makes color10 downstream, the attempted rotation would carry color10 wholly above board and roll back, so the explicit expectation discriminates capture.
