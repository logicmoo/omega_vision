# Working model

- **Checked (steps 0-18):** Main field is a 9x8 checkerboard (logical centers x=15,19,...,47; y=10,14,...,38). The small yellow piece starts at logical `(4,1)` and the yellow cup/catcher is centered at `(4,6)`.
- **Checked:** Only `ACTION6` is available in-level. Every non-RESET action consumes one HUD cell from right to left on y=1 (9→3). Direct clicks on either yellow object and on board cells do nothing except consume time.
- **Checked:** Five command tokens are centered at x=`21,26,31,36,41`. Each consists of a disconnected 3-pixel horizontal head at y=42 and 3-pixel vertical stem at y=44..46. Clicking a component toggles all of it, 1↔5, without changing the other component.
- **Checked from run animations (steps 9,16,18):** Clicking the color-9 body at `(36,55)` is RUN. It flashes 9→10 and executes tokens left-to-right, highlighting each. A failed run returns the player to start and preserves token settings.
- **Checked command truth table:** `(head,stem)=(5,1)` moves LEFT; `(1,5)` moves RIGHT; `(5,5)` moves DOWN; `(1,1)` produced no displacement in all three observed occurrences. Step 9 retrodicts `L,R,L,R,R`; step 16 `R,L,R,L,L`; step 18 `D,S,D,S,S`.
- **Checked executable model:** `scratch/tn36_sim.py` implements `step(state, action)`, timer/toggle rendering, all run frames, and BFS. It retrodicts all 36 recorded frames through step 18 with zero mismatched cells.
- **Searched (bounded exhaustive 4^5=1024 command configurations):** Exactly one modeled configuration ends at catcher `(4,6)`: all five pairs `(5,5)`, executing `D,D,D,D,D`. From the current initial pairs, BFS finds the unique shortest setup: toggle both head and stem at x=26,36,41, then RUN (6 toggles + run).
- **Checked:** RESET restores initial pairs `[(5,5),(1,1),(5,5),(1,1),(1,1)]` and timer. Two self-issued resets have already been used; do not reset again unless a later level truly requires it.

## Escalation inventory

- **Still unexplained:** success transition has never been observed; `(1,1)` may be a true no-op or an attempted move suppressed by an unseen restriction, though its rendered displacement is exactly zero. Boundary behavior, timer expiry, and whether crossing the catcher before the fifth command could win are unobserved. The searched all-down route reaches the catcher exactly on command five, so none of these ambiguities affect it.
- **Reachable but never visited live:** `(5,5)` obtained by toggling both halves of an initially `(1,1)` token; any submitted mixed configuration; player rows 4-6; goal overlap; columns outside 3-5; and most of the 1024 global token states. This unvisited all-`(5,5)` state is the next searched destination, not a speculative new mechanic.

# Working memory

- Level 1, 0/7 complete, step 18. Step 17 RESET restored the initial board; step 18 ran it and failed as `D,S,D,S,S`. Current token pairs remain `55,11,55,11,11`; only one timer cell is consumed (x=61).
- Execute the BFS plan without further probes: click x26 head then stem, x36 head then stem, x41 head then stem, producing `55,55,55,55,55`; RUN at `(36,55)`. Simulator predicts logical positions `(4,2),(4,3),(4,4),(4,5),(4,6)` and level completion.
- Computed component expects: each clicked 1 component becomes 5; timer cells x=60..55 are consumed during setup, then x=54 on RUN.

[END PLAN]
