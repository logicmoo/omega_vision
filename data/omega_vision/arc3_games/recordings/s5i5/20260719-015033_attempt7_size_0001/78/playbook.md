# Working model

- **[Checked]** Length buttons change one actuator by 3 cells and translate only its predefined downstream subtree. Color-15 walls and separate occupied actuators reject collisions; target/UI overlays are transparent.
- **[Checked]** Color-13 terminal heads must simultaneously occupy hollow-cross centers.
- **[Checked, levels 6–7]** A rotation-panel click turns its actuator and predefined subtree one quarter-turn `S→E→N→W→S`. Adjacency does not create a new linkage.
- **[Checked kinematics]** For top-left joint coordinate `Q`, direction `d`, and length `l=2+3n`: `Qchild=Q+3(n+1)d`; terminal head=`Q+(1,1)+3n*d`. Body centerline starts at `Q+(1,1)` and has `l` cells.
- **[Checked]** Main level-7 chain is color11→color14→color9→color12; color12 has no direct rotation, so `d12=CW(d9)` is invariant.
- **[Checked]** Top clipping is allowed when some actuator remains visible. Step 198's color9 rotation was rejected when color12's centerline lay beyond the right edge; do not infer terminal orientation from it.
- **[Strong computed result]** For lower target `(25,16)`, endpoint algebra plus wall checking gives a unique clean configuration (searched through `n<=30`): `n=(8,13,7,6)`, dirs `(S,W,N,E)`, joints `(48,12),(48,39),(6,39),(6,15)`. It deliberately threads the gaps at `y39..41` and `x6..8`; head is `(25,16)`.
- **[Assumed; current decisive probe]** Linked descendants may overlap ancestors temporarily even though separate actuators collide. A* finds a 43-action main-chain route only under that rule; forbidding all self-overlap exhausts the bounded reachable graph without reaching the unique goal. The first discriminating overlap is a color14 retraction after the first base rotation.

# Working memory

- **Level 7/8; completed=6; latest step 198.** Current main state is exactly `n=(3,3,0,3)`, dirs `(N,E,S,W)`, joints `(48,12),(48,0),(60,0),(60,3)`, color12 head `(52,4)`.
- Auxiliary color10 is undocked at `n=2`/head `(28,7)` and should eventually be extended twice with `(60,51)` to head `(22,7)`. Color8 is independently oriented north at `x12..14,y0..8`; it can remain there for the computed route.
- Ruled out: over-top attempt, dynamic capture/pushing of color8, remote wall/main effects from color8, and the step-198 edge probe (rejected rather than informative).
- **Current 4-action probe:** retract color11 twice `(4,51)`, rotate color11 `(17,51)`, then retract color14 `(4,58)`. Predictions for the terminal head are `(52,7)`, `(52,10)`, `(46,10)`; if the fourth action permits linked self-overlap it moves color9 into `(43,4)=9`. If it rejects, discard the overlap-permitted A* route and re-derive the missing mechanic.
- If confirmed, cached shortest route from the pre-probe state has 43 main actions total, ending at the unique configuration above; restore color10 with two final extensions. Bottom timer has only 10 filled cells after 32 level actions, so the remaining route is within the apparent budget.
