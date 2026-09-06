# Working model

- **[Checked]** Length controls alter an actuator by 3 and move only its predefined downstream subtree. Occupied actuators and color-15 walls reject collisions; target/UI overlays are transparent.
- **[Checked]** Color-13 heads must simultaneously occupy hollow-cross targets.
- **[Checked, retrodicted levels 6–7]** A plus-panel click rotates its actuator exactly one quarter-turn counterclockwise `S→E→N→W→S`, rigidly rotating its predefined downstream subtree. Plus arms are not absolute directions.
- **[Checked kinematics]** Joint `Q`, direction `d`, `l=2+3n`; `Qchild=Q+(l+1)d`; active=`Q+(1,1)+(l-2)d`.
- **[Checked]** Partial clipping is allowed, but an action rolls back if any moved actuator becomes wholly invisible.
- **[Checked, steps 184 and 190–191]** Adjacency does not create a new parent/child relation. Color10 could not push adjacent anchored color8; after color8 rotated east into tip-adjacency and then north, color10 remained fixed. Treat linkage as predefined, not dynamic capture.

# Working memory

- **Level 7/8; completed=6.** Main chain remains color11→color14→color9→color12 at `(A,B,C,D)=(4,4,6,4)`, directions `(N,E,S,W)`, joints `(48,12),(48,0),(60,0),(60,18)`, active `(49,19)`.
- Auxiliary state after step 191: color10 was retracted to `l=8`, body `x27..35,y6..8`, active `(28,7)` (undocked); color8 independently rotated `S→E→N` and now occupies `x12..14,y-6..8`. Neither action affected the main chain or walls. Restore color10 later with extend `(60,51)` ×2; color8 can be returned N→W→S with two plus clicks if needed.
- Ruled out: over-top links, moving/capturing anchored auxiliary actuators, remote wall/main effects from color8.
- **[Exhaustive geometry through coefficient 100]** With fixed base and fixed relative `d12=d9+1`, no state can dock either left target while all main links retain visible cells and avoid walls—even ignoring auxiliaries. If color12 orientation were independently flipped, a clean goal would be `(A,B,C,D)=(6,6,5,2)`, dirs `(S,W,N,W)`, routed below the wall and through `x30..32`. Therefore either color12 is an exceptional non-rotating terminal or another assumed invariant is wrong.
- **Next decisive retrodiction/probe:** create the shortest safe color9 rotation that visibly distinguishes whether color12 rotates with it. From current, retract color9 once `(26,51)` → active `(49,16)`; retract color12 once `(26,58)` → `(52,16)`; retract color9 four more times → `(52,13),(52,10),(52,7),(52,4)`, giving `C=1,D=3`. Then click color9 plus `(39,50)`, rotating color9 S→E. Standard subtree rule predicts color12 W→S at `Q=(63,0)`, only column 63 visible with `(63,10)=12`, old `(52,4)=5`, and its head mathematically offscreen. If color12 exceptionally preserves W, it instead appears horizontally with active `(55,1)`. This probe directly resolves the contradiction rather than assuming level-6 behavior applies.
