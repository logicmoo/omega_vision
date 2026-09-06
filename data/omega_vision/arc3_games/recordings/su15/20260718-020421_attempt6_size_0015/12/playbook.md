# Working model

- **Checked (levels 1-5):** ACTION6 clicks a grid coordinate. Clicking within 4 cells per axis of a compact piece relocates it with the click as logical anchor; farther clicks are no-ops. ACTION7 undoes piece/hazard/pursuit state, but deadline cells spent before an undo chain are not restored.
- **Checked:** Standard stages/footprints are color10 stage1 at anchor; color6 stage2 bbox `[x-1..x,y-1..y]`; color15 stage3 bbox `[x-1..x+1,y-1..y+1]`; color11 stage4 bbox `[x-2..x+1,y-2..y+1]`. Same-stage pieces in attraction range merge at the mover's clicked anchor.
- **Checked/corrected:** Successful Chebyshev anchor separations include stage1=5, stage2=7 (step88 had dx7,dy4), and stage3=9 (step95); stage2 failed at 9 and stage3 failed at 10. Thus stage3's maximum is 9, while stage2's exact maximum is 7 or 8. Earlier notes claiming thresholds 5/6/7 were false.
- **Checked:** Large HUD icons are required outputs. A single output completes when its logical anchor enters its color9 blob. Level 3 required both outputs simultaneously; its successful left-to-right placement matched the HUD icon order (size4 left, size3 right), but swapping was not tested.
- **Checked:** Rows 0-9 are HUD; row63 is a deadline bar draining about 1-2 cells per action, including invalid clicks.
- **Checked (levels 4-5):** A rounded color7 hunter moves independently up to 4 per axis each action toward the nearest compact piece's current/new anchor. It ignores edge adjacency and attacks on footprint overlap: stage2 was downgraded to a flung stage1, and stage1 decoys were erased. Hunter contact can also corrupt a color9 blob.
- **Checked:** Clicking within 4 per axis of a hunter launches it to `center + 2*(click-center)`, clipped to keep its footprint in bounds. Use this direct control to position/repel it.

# Working memory

- Level 6/9 (`levels_completed=5`), fresh after step95; timer64. HUD shows required size4 color11 followed by a hunter. Matching blobs are left center `(6,16)` bbox `(2,12)-(10,20)` and right center `(56,57)` bbox `(52,53)-(60,61)`; level-3 ordering evidence suggests size4 left and hunter right.
- Field contains one hunter centered `(18,36)` and one solid color8 7x7 object bbox `(33,32)-(39,38)`, apparent anchor/center `(36,35)`. HUD's ladder now extends after color11 through color12 and color8.
- **Strong hypothesis, not yet tested:** color8 is a higher stage that must be attacked/downgraded `8 -> 12 -> 11`; hunter attacks fling the reduced piece away from the side of impact. Therefore approach from the object's right so the required size4 is knocked toward the left blob, leaving the hunter to deliver right.
- Safe positioning plan uses three checked direct launches around the object's top: hunter centers `(18,36)->(26,28)->(34,20)->(42,28)` via clicks `(22,32),(30,24),(38,24)`. Then probe movement/attack of the color8 object; do not build the downgrade route until that new mechanic is observed.
