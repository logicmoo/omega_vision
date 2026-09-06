# Working model

- **[Checked]** The world is a 3×3-block lattice. A length lobe changes one actuator by one block (=3 cells) and translates its predefined downstream subtree. Left lobes retract; right lobes extend. Color-15 blocks and any occupied actuator block reject a move; hollow color-13 target crosses are transparent.
- **[Checked]** Color-13 terminal heads must simultaneously occupy the hollow-cross centers. In level 7 the color10 head can only reach `(22,7)` and the main color12 head must reach `(25,16)`.
- **[Checked, corrected after step 203]** A plus-shaped direction panel is a four-way absolute selector, not merely a cycling rotation button: top/right/bottom/left colored lobes set that actuator to `N/E/S/W`. This exactly retrodicts level-6 steps 143–145, 152, and 156. Setting a direction rotates its predefined subtree by the required 90/180/270 degrees in one action, so blocked intermediate quarter-turns do not matter. The center cycles `S→E→N→W→S` (seen in level 7), but avoid it.
- **[Checked kinematics]** For top-left block coordinate `Q`, direction `d`, and length index `n>=0`, the actuator occupies `Q+k*d, k=0..n`; `Qchild=Q+(n+1)d`; terminal head is the center of `Q+n*d`. Pixel form: `Qchild=Q+3(n+1)d`, head=`Q+(1,1)+3n*d`.
- **[Checked]** Main level-7 chain is color11→color14→color9→color12. Color12 has no direction panel, and its direction is one clockwise geometric turn from color9 (`d12=d9-1` in the index `S,E,N,W`).
- **[Checked]** Linked nonadjacent segments cannot overlap. Step 203's color14 retraction was rejected because it would move color12's terminal block onto color11's block at lattice `(15,4)` / pixels `x45..47,y12..14`.
- **[Checked]** Top clipping is allowed while an actuator retains visible blocks. Side placement at block `x=21` was rejected at step 199; do not use it.
- **[Strong computed result]** The lower target has a unique clean final main configuration through `n<=30`: `n=(8,13,7,6)`, dirs `(S,W,N,E)`, joints in pixels `(48,12),(48,39),(6,39),(6,15)`, head `(25,16)`.

# Working memory

- **Level 7/8; completed=6; latest step 203.** Current main state is `n=(1,3,0,3)`, dirs `(W,N,E,S)`, joints in block coordinates `(16,4),(14,4),(14,0),(15,0)`, terminal head `(46,10)`.
- Auxiliary color10 is at `n=2`, west-facing from block `(11,2)`, head `(28,7)`; finish with two right extensions `(60,51)` to restore its head to `(22,7)`. Color8 is north at block `x=4` and is clear of the route.
- **Ruled out:** the overlap-permitted route (step 203 rejected its first required overlap), center-only one-way rotation model, over-right-edge placement, dynamic capture/pushing of color8, and remote wall effects.
- **Computed shortest collision-free route from the current state (39 main + 2 auxiliary actions):** `(18,51),(17,57),(17,52)`; `(10,51)×5`; `(16,58)`; `(10,51)`; `(32,51)`; `(10,58)×6`; `(10,51)`; `(38,51)`; `(10,58)×4`; `(26,58)`; `(39,50)`; `(32,51)`; `(26,58)×2`; `(32,51)×2`; `(32,58)×6`; `(32,51)×3`; `(60,51)×2`. A* checked every intermediate 3×3-block occupancy against walls, current auxiliaries, self-collision, and visibility. Final main head is `(25,16)` and final color10 head is `(22,7)`.