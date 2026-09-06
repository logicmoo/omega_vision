# Working model

- **[Checked, step 0]** The playable cells form a 7×7 L: all cells in tile rows 0–2, plus tile columns 4–6 in rows 3–6. Tile blocks start at pixel `(x,y)=(11+6c, 12+6r)` and are 4×4.
- **[Checked, step 0]** Color-14 cross markers initially occupy tile coordinates `(1,1),(2,1),(4,1),(5,2),(5,4)`.
- **[Strong static inference, not yet action-tested]** A level asks us to restore the salient symmetry/pattern by toggling a tile with `ACTION6`; `ACTION7` is likely undo. Do not assume the exact click effect until the first click confirms it.
- **[Checked geometry; inferred objective]** This opening L is invariant under anti-diagonal reflection `(c,r) -> (6-r,6-c)`. Every marker is paired under that reflection except `(1,1)`, whose missing mate is `(5,5)`, so the likely solution is to mark `(5,5)`.
- `ACTION1`–`ACTION4` are available but their roles are unknown and presently unnecessary.

# Working memory

- Level 1, fresh attempt (0/10 complete), no actions spent beyond RESET.
- Planned deliberate commit/probe: click inside tile `(c,r)=(5,5)`, e.g. pixel `(42,43)`. Prediction: it gains a color-14 cross and the uniquely anti-diagonally symmetric pattern completes, advancing to level 2.
- Ruled out from static geometry: no avatar is visible; the five markers are not arbitrary—the set is exactly one reflected mate short.
