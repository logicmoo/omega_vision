# Working model

- **[Checked, levels 1–6]** Length-panel left/right glyphs retract/extend an actuator by 3. The selected actuator changes length and translates its predefined recursively downstream subtree. Color-15 is fixed collision geometry; target/UI overlays are transparent.
- **[Checked]** Lone color-13 cells are active heads; hollow crosses are targets; every head must dock simultaneously.
- **[Checked, level 6]** A direction arm sets the selected actuator's absolute direction and rigidly rotates its predefined downstream subtree, preserving relative orientations.
- **[Checked kinematics]** Each width-3 actuator has joint `Q`, direction `d`, and `l=2+3n`. `Qchild=Q+(l+1)d`; occupied cells are its `(l+1)×3` rectangle; active head is `Q+(1,1)+(l-2)d`.
- **[Checked, steps 143, 180–181]** Partial clipping is allowed, but an action rolls back if any moved actuator becomes wholly off-board.
- **[Newly checked, step 184]** Mere tip contact does not dynamically capture/push an anchored actuator. After color10 extended twice to touch color8, a third extension attempted to put its head/body into color8 and rolled back; color8 did not translate. Treat top-level color8 and color10 as anchored unless later evidence says otherwise.

# Working memory

- **Level 7/8; levels_completed=6.** Main chain color11→color14→color9→color12 remains at `(A,B,C,D)=(4,4,6,4)`, directions `(N,E,S,W)`, joints `(48,12),(48,0),(60,0),(60,18)`, active `(49,19)`. Rejected probes did not alter it.
- Left subsystem after steps 182–184: two color10 west extensions succeeded, so `l10=20`, body `x15..35,y6..8`, active `(16,7)` and its target `(22,7)` is temporarily undocked. The third extension was rejected. Color8 remains south at `Q=(12,6),l=14`, body `x12..14,y6..20`.
- Ruled out: over-top main route (would hide a whole link); dynamically pushing/repositioning anchored color8 with color10.
- **[Exhaustive proof through coefficient 100]** With fixed base, fixed relative `d12=d9+1`, all four links retaining visible cells, and fixed walls, there is no main-chain geometry docking `(25,16)`. This remains true even if auxiliary bodies are ignored. Some mechanic must independently move/reorient color12, move the main base, or alter a wall.
- Allowing `d12` to differ yields a clean intended-looking final geometry `(A,B,C,D)=(6,6,5,2)`, directions `(S,W,N,W)`: outer descends right, color14 runs west below the wall, color9 rises through opening `x30..32`, and color12 runs west to target. Thus independent terminal reorientation remains the leading need, but how to obtain it is unknown.
- **Next single probe:** rotate anchored color8 north using `(60,57)`. Standard local-rotation model predicts color8 at `x12..14,y-6..8` with `(13,0)=8`, old `(13,20)=5`, and no main effect (`(49,19)=13`). The full diff will test whether color8 is merely a local obstacle or also controls/carries any remote wall/terminal mechanism. If local-only, restore color10 with retract `(54,51)` ×2 and color8 south `(60,59)` afterward.
