# Working model

- **Checked (levels 1–3):** Logical movement centers are 6 pixels apart. ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right. Legal moves have 7-frame animation. Color 5 is full-width track; the active avatar is a color-9 5x5 ring with color-5 center; entering the matching color-9 frame/dot goal completes a level. Thin one-cell mechanism wires are not traversable—the avatar needs a full-width corridor.
- **Checked (levels 1–3):** ACTION5 rewinds the active timeline to level start, stores its directions as a color-2 clone, and advances the HUD slot. Every later direction advances all clones one stored input; finished clones hold their endpoints. Multiple clones work concurrently. Use at most `HUD slots - 1` rewinds.
- **Checked (levels 1–3):** Color-8 system = 3x3 pressure pad + wire + notched 5x5 blocker. Occupying the pad shifts the blocker off its node; leaving restores it. A clone can hold it.
- **Checked (level 3):** Color-11 system = 3x3 control + wire + solid 5x5 blocker. Touching it latches the blocker open after leaving. ACTION5 resets it; clone replay retriggers it.
- **Checked (levels 1–3):** The changing color-9 bottom border is a generous action budget, not terrain.
- **Safety:** RESET restarts this level; never RESET twice consecutively. ACTION5 consumes a timeline slot.

# Working memory

- **Level 4, step 123; 3/7 complete.** Start/current `(28,10)`, goal `(10,52)`, three timeline slots, full timer.
- **Checked geometry (Python):** Color-8 pressure pad `(34,28)` controls blocker `(10,28)`, which bars the left descent. A new connected color-15 system has a 3x3 pad `(52,28)` and two sealed 7x7 color-15 frames centered `(28,40)` and `(28,52)`, each enclosing an isolated 5x5 color-5 floor cell. The upper and lower left track regions are otherwise disconnected.
- **Assumed, do not yet build beyond probe:** Color 15 likely powers a paired transporter/portal between the framed cells. This explains the two isolated interiors and level topology. It probably requires continuous pad occupancy, providing the second clone task alongside color-8.
- **Current deliberate probe / likely T1:** Reach color-15 pad by shortest full-width route `D2,R2,U2,R2,D3` (11 moves). Predict occupying it visibly activates both framed cells; inspect exact effect before rewinding.
- **Conditional schedule if it is a held transporter:** T1 holds color-15 pad at tick 11; T2 reaches/holds color-8 pad via `D2,R,D` at tick 4; T3 `L3,D5,R3` reaches upper frame at tick 11, should transport to lower frame, then `L3` reaches goal. Same-tick transporter activation may need testing.
- **Ruled out on level 4:** nothing yet.
