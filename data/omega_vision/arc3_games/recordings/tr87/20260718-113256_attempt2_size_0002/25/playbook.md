# Working model

- **Checked on levels 1–2:** The top is a dictionary from source-colored glyphs to target-colored glyph strings. Translate the lower source string by concatenating those target strings in order, then set each lower editable tile to the required target glyph identity. Identity is invariant under all D4 rotations/reflections; repeated renderings can have different orientations.
- **Checked controls:** A contrasting bracket selects one lower target slot (its color depends on the field). ACTION3/ACTION4 move left/right. ACTION1 advances the selected slot through one global cyclic option palette; ACTION2 traverses the exact same cycle backward.
- **Checked palette warning:** The palette includes every target identity but its composition/length varies. Level 1 had 6 training identities plus one decoy; level 2 has exactly its 7 training identities and no decoy (the observed edges close a 7-cycle). Never assume a decoy, training order, or palette length; classify masks canonically and determine cycle edges from evidence.
- **Checked completion behavior:** Completion is automatic on the edit placing the final correct target identity; no submit or cursor departure is needed.
- **HUD:** y=63 is a timer filling color 4 from right to left about every two actions; it resets each level (~128 actions). Do not treat it as gameplay.

# Working memory

- Level 2/6 at step 43. Source color 7, target color 11. Dictionary: `S0→[T0]`, `S1→[T1,T0,T2]`, `S2→[T1,T3]`, `S3→[T3,T3]`, `S4→[T4,T5,T4]`, `S5→[T6]`. Lower sources `[S0,S4,S3,S5]` require `[T0,T4,T5,T4,T3,T3,T6]`.
- Current lower IDs are `[T0,T4,T5,T4,T5,T5,T1]`; cursor is slot 3 and slots 0–3 are solved. Full checked ACTION1 cycle is `T4→T6→T2→T5→T1→T0→T3→T4`; ACTION2 reverses it. The step-43 edge `T3→T4` closes the cycle and falsifies the assumed level-2 decoy.
- Shortest finish: slot4 `T5→T1→T0→T3` (move right + 3 ACTION1); slot5 the same; slot6 `T1→T5→T2→T6` (move right + 3 ACTION2). Final edit should complete level 2. Use D4-invariant expected cells because slot renderings can differ in orientation.
