# Working model

- **Checked on levels 1–2:** The top is a dictionary from source-colored glyph strings to target-colored glyph strings. Translate the lower source string by segmenting it into dictionary source keys and concatenating their target values in order, then set the lower editable tiles to that result. Levels 1–2 used one-glyph source keys; level 3 visibly introduces keys of length 2–3, and its seven output slots exactly match the unique segmentation prediction (strongly supported, awaiting completion confirmation).
- **Checked identity rule:** Glyph identity is invariant under all D4 rotations/reflections; repeated renderings can have different orientations. Compare 5x5 masks canonically, not visually/exactly.
- **Checked controls:** A contrasting bracket selects one lower target slot. ACTION3/ACTION4 move left/right. ACTION1 advances the selected slot through one global cyclic option palette; ACTION2 traverses the exact same cycle backward.
- **Checked palette warning:** The palette includes every target identity but its composition/length varies. Level 1 had 6 training identities plus one decoy; level 2 had exactly 7 identities and no decoy. Never assume a decoy, training order, or palette length; determine edges from evidence.
- **Checked completion behavior:** Completion is automatic on the edit placing the final correct identity; no submit/cursor departure is needed.
- **HUD:** y=63 is a timer filling color 4 from right to left about every two actions and resetting each level (~128 actions); ignore it as gameplay.

# Working memory

- Level 3/6 began at step 55. Source color 11, target/edit color 10; cursor is at target slot 0. Number identities by first D4-canonical training occurrence.
- Dictionary: `[S0]→[T0]`; `[S1,S1]→[T1,T2]`; `[S2]→[T3,T3]`; `[S3,S3]→[T4]`; `[S4,S5,S4]→[T1]`; `[S6]→[T5]`. Lower source is `[S0,S4,S5,S4,S2,S6,S1,S1]`, uniquely segmented as `[S0]|[S4,S5,S4]|[S2]|[S6]|[S1,S1]`, so required targets are `[T0,T1,T3,T3,T5,T1,T2]`.
- Current lower targets are `[T4,T0,T0,T5,T2,T0,T1]`. All are known training identities; the level-3 palette cycle/order and presence of a decoy are unknown.
- Next deliberate probe: ACTION1 once at slot0 (currently T4, target T0), predicting only that slot0 advances to a distinct palette state while cursor/other slots remain fixed. Canonically classify the result before planning further edits.
