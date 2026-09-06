# Working model

- **Checked (levels 1-6):** ACTION6 clicks a grid coordinate. Standard compact pieces relocate when clicked within 4 cells per axis, with the click as logical anchor; farther clicks are no-ops. ACTION7 undoes piece/hazard/pursuit state but does not restore deadline cells.
- **Checked:** Standard stages are color10 stage1 (1x1 at anchor), color6 stage2 bbox `[x-1..x,y-1..y]`, color15 stage3 bbox `[x-1..x+1,y-1..y+1]`, and color11 stage4 bbox `[x-2..x+1,y-2..y+1]`. Same-stage pieces merge at the mover's clicked anchor.
- **Checked/corrected:** Successful Chebyshev merge separations include stage1=5, stage2=7, stage3=9. Stage2 failed at9 (exact maximum 7 or8); stage3 succeeded9 and failed10, so its maximum is9.
- **Checked:** Large HUD icons are required outputs, left-to-right corresponding to left-to-right color9 blobs where distinguishable. Completion requires every output simultaneously anchored in its blob; pieces already placed remain movable until all are correct.
- **Checked:** Rows0-9 are HUD; row63 is the deadline bar, draining roughly1-2 cells per action.
- **Checked:** A rounded color7 hunter moves independently up to4 per axis each action toward the nearest compact piece's current/new anchor. It attacks on footprint overlap, downgrading the victim one stage and flinging the remainder away; stage1 is erased. Normal hunter contact can corrupt a target blob.
- **Checked:** Clicking within4 per axis of a hunter launches it to `center + 2*(click-center)`, clipped at bounds. Direct launch (rather than pursuit) safely placed the hunter into a required blob on level6.
- **Checked (level6):** Color8 is a movable 7x7 high stage and color12 its 5x5 downgrade. Color8 relocated to clicks at radial distances about11.3 but not12.53 (boundary likely12). Right-side attacks produced `8 -> 12 -> 11`; each knockback was exactly `(-11,-1)`. Level6 completed with color11 in the left blob and hunter in the right, confirming ordered mixed outputs and the downgrade chain.

# Working memory

- Level7/9 (`levels_completed=6`), fresh after step113; timer64. HUD requires two size4s. Targets: left center `(23,17)` bbox `(19,13)-(27,21)`, right center `(44,22)` bbox `(40,18)-(48,26)`.
- Four size2 anchors A=`(10,26)`, B=`(7,36)`, C=`(21,36)`, D=`(31,38)` provide one size4. One color8 anchor `(54,49)` provides the other. Hunters start left `(14,53)` and right `(54,58)`.
- Efficient standard merge route: C+D at `(25,32)` (safe separation6), A+B at `(14,29)` (observed-safe separation7), merge size3s at `(18,25)`, then deliver `(22,21)` into left target: four clicks total.
- Right hunter is only four pursuit pixels from overlapping color8 from below on the next action. **Next productive probe:** perform C+D `(25,32)`. Predict left hunter center `(10,49)` toward B; right hunter attacks, producing a color12 flung mostly upward toward the right target. Record the rotational knockback anchor before batching the remainder.
