# Working model

- **Checked through level 4:** Glyph identity is invariant under D4 rotations/reflections. Earlier tasks translate a lower source string using displayed correspondences, with variable-length keys and, on level 4, composition through a repeated intermediate-color alphabet. Completion is automatic when the final editable identity is correct.
- **Checked controls on lower editors:** ACTION3/ACTION4 move the bracket left/right; ACTION1/ACTION2 traverse the selected color alphabet's cyclic palette forward/backward. A repeated exact glyph alphabet reuses its intrinsic cycle order across levels (level 4 reused level 2's color-11 cycle and every planned edge succeeded).
- **Palette warning:** The editable palette is the full recurring alphabet, so identities absent from the current clues appear as decoys. Infer cycle/order from a prior appearance of the same canonical alphabet when available; otherwise probe.
- **HUD:** y=63 is a timer filling color 4 right-to-left about every two actions, resetting each level (~128 actions); ignore as gameplay.

# Working memory

- Level 5/6 began at step 102. Lower strings are fixed: color-10 source `[F,C,G,G,B]` with signatures `[04ac6a4,00dc77b,11b82f1,11b82f1,03dc778]`; color-7 target `[g,e,e,b,a]` with signatures `[0358358,007381b,007381b,006b42f,00509c0]`.
- **Strong level-5 hypothesis, not yet control-checked:** This inverts the earlier task: the top rule skeleton is editable while the lower source/target pair is the clue. Top rule arities in reading order are `1→1, 1→2, 2→1, 1→1`, totaling 5 glyphs on each side and uniquely aligning the lower pair as `F→g`, `C→ee`, `GG→b`, `B→a`. The bracket is around the first top glyph, not the lower target, supporting this.
- Top editable slots in predicted row-major cursor order are: p0 `(9,11)` color10 current B→desired F; p1 `(19,11)` color7 current b→desired g; p2 `(32,11)` color10 B→C; p3/p4 `(42,11),(49,11)` color7 d→e; p5/p6 `(9,23),(16,23)` color10 A→G; p7 `(26,23)` color7 g→b; p8 `(39,23)` color10 F→B; p9 `(49,23)` color7 a→a already correct.
- Reused color-10 ACTION1 cycle (from level 3): `A=005bd60→B=03dc778→C=00dc77b→006f5a0→0078f60→F=04ac6a4→G=11b82f1→A` (last closure strongly implied). Reused color-7 cycle (from level 1): `a=00509c0→b=006b42f→11a82b1→d=01638d0→e=007381b→00702b1→g=0358358→a`.
- Next deliberate control probe: ACTION4 from p0, predicting the bracket moves to adjacent p1 `(19,11)` if all ten top glyph slots are editable. If it jumps to p2, only source-color slots are selectable and the model must be revised before editing.
