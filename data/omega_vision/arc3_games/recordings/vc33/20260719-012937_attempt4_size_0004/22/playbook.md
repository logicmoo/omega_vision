# Working model

- **Checked (levels 1-3):** This is a boundary-transfer/alignment puzzle controlled only by coordinate clicks; 7 levels total. The color-7 top row is a click/time budget, not gameplay.
- **Checked:** Same-colored thin markers form target pairs: one is fixed in a color-5 divider, while the other is attached to a movable color-3/0 slab boundary. A level completes when all movable marker ranges align with their same-colored fixed ranges.
- **Checked:** Color-9 controls flank a divider. Clicking one transfers one unit between only the two adjacent slab boundaries; the opposite control reverses it. Unit size equals divider/control thickness (4 px in levels 1-2, 2 px in level 3).
- **Checked side-aware rule:** For vertical dividers with controls at the bottom, the left control does `q_left -= unit, q_right += unit`; the right control reverses it. Horizontal versions rotate this rule accordingly.
- **Checked:** A transfer is blocked when its donor slab is at its hard minimum or its receiving slab lacks capacity. In level 3, minima were set by neighboring divider top endpoints and the visible maximum was the inner bottom frame. Replenish/drain through adjacent dividers before retrying; no-op clicks only spend HUD budget.
- **Checked (level 3):** Multi-divider levels are integer flow problems. Solve net transfer counts from target marker coordinates, then order clicks so every intermediate boundary respects capacity. The color-4 arrow identifies the movable boundary's color-3 side; it is not necessarily the required travel direction.
- **Checked:** Direct clicks on arrows, markers, terrain, and divider lines have not been useful; use controls unless a later level positively introduces another interaction.

# Working memory

- **Level 4 (`LEVELS 3/7`), fresh at step 43.** It is vertical with 3-pixel units and no enclosing side/bottom frame.
- Five slab boundaries (first color-0 row at clean sample columns x=0,18,30,48,60) are `q=[49,61,55,58,46]`.
- Dividers: d0 x=12..14 (controls x=9..11 / 15..17 at y=61..63); d1 x=27..29 has **no color-9 controls**; d2 x=42..44 (controls x=39..41 /45..47); d3 x=54..56 (controls x=51..53 /57..59).
- The only ordinary target pair is color11: movable bar y=47..48 on q0, fixed bar y=29..30 in d2. Thus target is `q0=31`, requiring six d0-left transfers (`49→31`).
- New unexplained feature: identical color1 segments occupy d0 at y43..54 and d1 at y34..45, and d1 lacks controls. They may couple/relay d0 and d1, but this is untested; do not build the full solution on it yet.
- **Next probe:** click d0-left at (10,62). Under the established rule it should do `q0:49→46`, `q1:61→64`, shift the mobile color11 bar to y44..45, and show witnesses (0,46)=0, (18,61)=3, (3,44)=11. Inspect the full diff for any additional color1/d1/q2 motion indicating coupling.
