# Working model

- **Checked objective (level 1 completion):** The top shows a dictionary from source-colored glyphs to target-colored glyph strings. The lower source string must be translated by concatenating the corresponding top target strings in order. Set each lower editable target tile to the required target glyph identity; recognize glyph identity up to D4 rotation/reflection. Geometry presentation may vary.
- **Checked controls:** A white bracket selects one lower target slot. ACTION3/ACTION4 move left/right. ACTION1 advances that slot through a global cyclic option palette; ACTION2 is the exact reverse.
- **Checked palette warning:** The palette contains all target glyph identities plus at least one decoy not shown in the training dictionary. Never infer an unseen decoy is a missing training identity. Level 1 had 6 training targets + decoy U = 7 states; actual B3 followed U and completed the level. Determine cycle edges from observed transitions only; do not assume training order or palette length without seeing return.
- **Checked completion behavior:** Completion is automatic on the edit that places the final true target identity; no cursor-departure/submit action is needed.
- **HUD:** y=63 is a timer filling color 4 from right to left about every two actions; it resets each level (~128 actions).

# Working memory

- Level 2/6, fresh board after step 29; cursor at lower target slot 0. Source color is 7 and target color is 11. There are six training source symbols with variable-length target strings.
- Number unique target identities by first D4-canonical occurrence as T0..T6. Training dictionary is: `S0→[T0]`, `S1→[T1,T0,T2]`, `S2→[T1,T3]`, `S3→[T3,T3]`, `S4→[T4,T5,T4]`, `S5→[T6]`.
- Lower source IDs are `[S0,S4,S3,S5]`, so the required seven-slot target is `[T0,T4,T5,T4,T3,T3,T6]`.
- Current lower target IDs are `[T6,T2,T4,T0,T5,T5,T1]`; all seven currently match known training identities (no visible decoy).
- The new level's option-cycle order is unknown. It likely has 8 states (7 identities + one decoy), but this is assumed from level-1 structure, not checked. Next deliberate probe: ACTION1 once at slot0 (currently T6, target T0), predicting only that the selected glyph advances to the next palette state while cursor/other slots remain fixed. Identify that state from the resulting mask before planning further edits.
