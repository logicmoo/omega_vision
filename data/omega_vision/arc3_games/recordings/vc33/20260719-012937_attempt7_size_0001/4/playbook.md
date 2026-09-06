# Working model

- **Checked (levels 1-3):** Coordinate-click boundary-transfer/alignment puzzle; 7 levels. The changing color-7 top row is a timer/action budget, not gameplay. A level completes when each movable colored marker aligns with its same-colored fixed marker.
- **Checked:** A color-9 control transfers one unit between its two neighboring slab boundaries; the control on the donor side sends that side's volume across the divider. Transfers respect donor minima and receiver maxima. Level 4 uses 3-pixel units.
- **Checked:** Arrows, markers, ordinary terrain, blue/color1 bars, and blank putative controls are inert unless a later positively observed state changes their role.
- **Checked Level 4 ordinary model:** Five vertical boundaries `q`; initial `[49,61,55,58,46]`. Visible edges are d0 `(q0,q1)` controls `(10,62)/(16,62)`, d2 `(q2,q3)` `(40,62)/(46,62)`, d3 `(q3,q4)` `(52,62)/(58,62)`. d1 `(q1,q2)` has no maroon controls. Bounds used by the exact simulator are minima `[31,31,25,34,34]`, maxima64.
- **Checked Level 4 target:** movable color11 is attached to q0 and fixed target is y29..30, so ordinary alignment would require q0=31.
- **Checked newly recovered rule:** whenever q0=q1 (recorded three times at55), d0's blue span x12..14,y43..54 changes color `1→12` and black side rails appear at x10/x16,y45..52; leaving equality reverses it. This visual activation was missed during earlier plans. By symmetry, d1 should activate when q1=q2, but that part is not yet observed.
- **Executable model:** `scratch/l4_sim.py` implements `step`, click hitboxes, constraints, equality rendering, and board rendering. It exactly reproduces all 70 recorded Level-4 settled boards outside the nondeterministic HUD row. Ordinary-model BFS visits 532 states, finds no goal, and proves q0 cannot fall below46 because d1 is disconnected.
- **Candidate A (model-first, not yet checked live):** if q0=q1=q2, both paired links open and automatically move the yellow-arrow/color11 cargo from q0 to q2. This makes the puzzle solvable: candidate BFS finds a 16-action route—`d0R,d0R`, then eight d2L and six capacity-interleaved d3L—to cargo on q2 at31. The exact numbers strongly support it: initial q2=55 makes triple equality after only two d0R, and q3/q4 have exactly the 24 px capacity needed to lower q2 from55 to31.

# Working memory

- **Current:** Level 4 (`LEVELS 3/7`) freshly reset at step113: `q=[49,61,55,58,46]`, HUD64.
- **Still unexplained:** semantics of activated color12 links and how cargo/d1 crossing occurs. This—not another speculative hidden control—is the sole missing rule.
- **Unvisited reachable states/actions, priority order:** (1) triple equality `[55,55,55,58,46]` via two d0R; (2) d1-only equality q1=q2 via two visible d2R; (3) clicks/actions while a bar is visibly color12; (4) Level-4 d2R/d3R behavior and q2>55 states. These outrank any new mechanism conjecture.
- **Compactly ruled out:** blue bars in ordinary color1 state (all ends/centers/orders), markers, fixed target, blank d1 bottom controls, translated/reflected hidden controls, saturation rerouting, passive overflow, global/local portal alignment, and cargo clicks/movement without color12 activation were all HUD-only.
- **Next searched discriminator:** execute the ordinary BFS prefix d0R twice. Candidate A predicts after action2 both bars are color12 and cargo moves from q0 to q2 (source marker cell 5,53 becomes green; destination 35,53 becomes11). If only activation occurs and cargo stays, stop on expectation mismatch and inspect before testing an explicit color12/cargo action.
