# Working model

- **Checked (levels1-8):** ACTION6 clicks a coordinate; compact pieces relocate with the click as logical anchor when selected. ACTION7 undoes piece/hazard/pursuit state but not deadline cells.
- **Checked:** Standard stages are color10 1x1, color6 2x2 bbox `[x-1..x,y-1..y]`, color15 3x3 centered, color11 4x4 bbox `[x-2..x+1,y-2..y+1]`, color12 5x5 centered. Same-stage pieces merge upward. Merge capture is Euclidean, not Chebyshev: color6 succeeds through `sqrt(72)<9` and fails at distances >=9; use logged-safe distances.
- **Checked:** Color8 is a movable 7x7 high stage; hunter attacks downgrade `8->12->11` and fling the victim away from the attacker.
- **Checked:** Required large HUD icons are an unordered multiset of outputs that must each be fully contained in distinct generic color9 blobs. Level8 proved any three of four identical blobs work (TL=12, BL=12, TR=14 completed).
- **Checked:** Row63 is the deadline. Pieces in blobs remain movable until all outputs are correct.
- **Checked:** Color7 hunter footprint around anchor `(x,y)` is `top; shoulders; separated arms; solid 3-cell bottom`. It autonomously moves up to4 per axis toward the nearest compact piece. Clicking it launches to `anchor+2*(click-anchor)`; physical overlap of two H7 merges them into H14 at the launched mover's endpoint.
- **Checked:** H14 footprint is `top; shoulders; left+center+right; two bottom diagonals`. It autonomously pursues compact pieces, but direct clicks relocate it to the click. Axial offset10 works; diagonal `(8,8)` fails, consistent with selection radius `<9` from the nearest occupied cell. A click close to multiple hunters selects the closer one; attempted H14/H7 collision snaps back rather than merging.
- **Assumed for level9 (strong stage/HUD evidence, not yet live-checked):** two H14 merge into color13, whose HUD footprint has 13 cells (`three spaced top; two shoulders; solid five; solid three bottom`) and should be the next direct-control autonomous hunter.

# Working memory

- Final level9/9 (`levels_completed=8`), fresh after log step142; deadline 0/64. HUD requires `[12,15,13]`. Three blobs center `(11,41)`, `(11,55)`, `(53,55)`.
- Initial compact pieces: C6 anchors `(19,47),(24,53)` (can merge in one move), C8 `(38,51)`. H7 anchors: left `(16,14),(17,24)` and right `(53,15),(56,35)`.
- Intended outputs: merge C6s into C15 for BL; intentionally attack C8 once from its left to make C12 for BR; merge all four H7 pairwise into two H14 and then assumed H13 for the remaining `(11,41)` blob.
- **Current four-action route (fully retrodicted from checked H7 behavior):** click lower-left H7 `(17,20)` to merge left pair at H14 `(17,16)`. Then route lower-right H7 to anchors `(52,31)->(44,31)->(36,31)` with clicks `(52,35),(48,31),(40,31)` while upper-right H7 pursues to `(45,23)->(41,27)->(37,31)`; final overlap should make H14 `(36,31)`. Left H14 meanwhile pursues to `(19,28)`.
- After pair merges, planned H14 merge: right H14 `(36,31)->(26,31)` while left advances `(19,32)`, then click overlap near `(21,32)`; verify color13 creation before relying on its controls.
