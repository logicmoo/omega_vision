# Working model

- **Checked (level 1):** This is a horizontal boundary-transfer/alignment puzzle controlled only by `ACTION6`; there are 7 levels total.
- **Checked:** A full color-7 top row is the click/time budget. Ordinary wrong clicks change only this HUD strip; ignore it as gameplay but conserve actions.
- **Checked (level 1):** A color-5 horizontal divider has two color-9 square controls, one immediately above and one below it. Clicking the **upper** control changes the adjacent slab boundaries by `upper x -= 4, lower x += 4`; clicking the **lower** control is the exact inverse, `upper x += 4, lower x -= 4`. The divider, controls, and fixed marker do not move.
- **Checked (level 1):** One same-colored marker is fixed in a divider and another is attached to a movable outer slab boundary. The adjacent color-4 arrow gives the required horizontal direction. The level completes when the movable marker's x-range exactly aligns with the fixed marker's x-range.
- **Checked:** Direct clicks on arrows, markers, ordinary terrain, and color-5 line cells are not needed; use the color-9 controls.
- **Assumed for later levels:** With several stacked dividers, each control pair transfers one 4-pixel unit between only the slab immediately above and immediately below that divider. A slab boundary likely cannot be moved past the board edge, so upstream controls may need to supply enough width before repeated downstream transfers. Verify this local-transfer generalization with one predicted click before batching.

# Working memory

- **Level 2 (`LEVELS 1/7`), fresh board at step 9.** Background boundary coordinates (first color-3 x, equivalently color-0 width) are: upper slab `p0=52`, middle `p1=12`, bottom `p2=8`.
- Dividers are y=20..23 and y=40..43. Their color-9 controls are at the left: top pair centered near (1,17)/(1,25), lower pair near (1,37)/(1,45).
- Fixed color-14 marker is x=28..29 in the lower divider. Movable color-14 marker is x=8..9 on the bottom boundary, with a color-4 arrow pointing right. Required displacement is +20 = five 4-pixel lower-divider upper-control clicks.
- Capacity inference: each desired lower transfer should do `p1 -= 4, p2 += 4`. Since p1 starts at 12, five transfers likely require two top-divider upper clicks first (each predicted `p0 -= 4, p1 += 4`). Computed shortest candidate: 2 top-upper + 5 lower-upper = 7 clicks, in any safe order.
- **Next probe:** click the upper control of the lower divider at (1,37). Predict `p1:12→8`, `p2:8→12`, and movable marker x=8..9→12..13; specifically cells (8,28)=3, (8,60)=0, (12,52)=14. If confirmed, batch the remaining two top-upper and four lower-upper clicks with forward expectations.
