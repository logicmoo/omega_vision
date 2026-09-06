# Working model

- **Checked on levels 1–3:** The top supplies correspondences from source-colored glyph strings to target-colored glyph strings. Translate the lower source sequence (segmenting into variable-length source keys when needed), concatenate the values, and set the lower editable targets accordingly. Level 3 confirmed multi-glyph keys/unique segmentation.
- **Checked identity rule:** Glyph identity is invariant under all D4 rotations/reflections; repeated renderings can have different orientations. Compare 5x5 masks canonically and use D4-invariant expected cells.
- **Checked controls:** A contrasting bracket selects one lower target slot. ACTION3/ACTION4 move left/right. ACTION1 advances the selected slot through one cyclic palette; ACTION2 traverses the exact cycle backward.
- **Checked palette warning:** The palette includes the target alphabet but can also expose identities absent from the current training correspondences. Level 1 had 6 true targets + 1 decoy, level 2 had all 7 as true targets, and level 3 had 6 true + 1 decoy. Do not infer palette size from current training alone.
- **Cross-level hypothesis, not yet checked:** A glyph alphabet may have an intrinsic cycle order reused when it reappears as an editable target. Level 4's color-11 output alphabet is the exact same seven canonical identities as level 2's editable alphabet, making the old level-2 cycle a strong prediction; confirm one edge before relying on it.
- **Checked completion:** Automatic on the edit placing the final correct identity; no submit/departure needed.
- **HUD:** y=63 is a timer filling color 4 right-to-left about every two actions, resetting each level (~128 actions); ignore as gameplay.

# Working memory

- Level 4/6 began at step 81. Lower source is color 10, editable target is color 11, cursor at slot0. The top has two adjacent correspondence pairs per row and an intermediate color-7 alphabet. Matching repeated color-7 identities composes input→bridge→output (strongly supported by the exact one-to-one graph; completion will confirm).
- Label color-10 inputs I0..I3 by first occurrence, color-7 bridges B0..B3, and color-11 outputs O0..O3 by first occurrence. Correspondences compose as `I0→B1→O2`, `I1→B2→O3`, `I2→B3→O1`, `I3→B0→O0`. Lower inputs `[I0,I1,I3,I2,I1,I0,I3]` therefore require `[O2,O3,O0,O1,O3,O2,O0]`.
- Output signatures: `O0=09e7f89`, `O1=007a9ea`, `O2=02def68`, `O3=027ffc8`. Current targets are `[D0,D1,O2,O1,O0,D0,D0]`, with absent-training identities `D0=02523ea`, `D1=0076dc0`; the seventh same-alphabet identity should be `D2=15f83f5`.
- Level 2's checked ACTION1 cycle on exactly this alphabet was `O1→O0→D0→D1→D2→O2→O3→O1`. Next deliberate confirmation: ACTION1 at slot0 currently D0, predicting D1 (D4-invariant inner ring with blank center). If confirmed, reuse this full cycle and compute all shortest edits.
