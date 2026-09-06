# sk48 playbook

## Working model
- **Checked through level 2:** Ordered retractable-chain collector on a 6-pixel logical grid. Bottom-panel colors are the acquisition order; hollow centers mark completed colors. Last acquisition loads the next level.
- **Checked controls:** ACTION1/ACTION2 move the whole horizontal assembly up/down. ACTION4 extends/moves its right terminal one column. ACTION3 retracts/pulls left. ACTION7 is undo; ACTION6 unused. With `k` acquired blocks and right terminal `t`, those blocks occupy the contiguous suffix `t-k+1..t`; minimum retract is `t=k-1`.
- **Refined bare-cable rule, checked by steps 56-57:** With `k=0`, cable can thread through a target without moving it. First R into wrong-order color12 at col3 left it in place and added connectors; the next R extended ordinary cable through col4, again leaving color12 fixed. Thus arbitrary wrong-target pushing was false. Strong inference to test next: threading the next required target acquires it immediately in place (level-2 first red did this at the wall).
- **Checked acquired-chain rule:** With `k>0`, R translates the solid acquired suffix. It pushes any adjacent unacquired target(s) right through free space (step 33), regardless of whether those future colors are yet collectible. If a train cannot shift farther, another R attaches the next required front target. A multi-target blocked train allowing consecutive attachment remains predicted but untested.
- **Checked vertical rule:** The assembly occupies columns `0..t` for vertical collision. Moving vertically pushes destination-row targets at columns `<=t` one row in that direction; targets at `>t` stay. A contiguous vertical stack should cascade if space exists, but this remains untested.
- **Checked HUD:** y=53 is a loose per-level step budget; the alternating strip beside the anchor is its rail.

## Working memory
- Level 3, 2/8. Initial targets all col3: green14 row0, blue9 row1, red8 row2, color12 row3; order red8, color12, blue9, green14.
- Current step57: row3, bare cable `t=4`, color12 still row3 col3 threaded inside it. Steps56-57 were deliberate probes but are off-route. ACTION7 twice should restore step55: row3, `t=2`, clean color12. Then U reaches red's row without pushing it.
- Under the refined model, A* found the 30-action fresh optimum `UUUURRRLURLURRRDDLLLDRRRRUULUR`; additive horizontal/vertical pattern databases exhausted every route shorter than 30. From restored step55, the remaining optimal geometry is `U R L U R L U RRR DD LLL D RRRR UU L U R`.
- Immediate probe after the two undos and U: R should thread/acquire red in place at row2 col3, hollowing bottom center x25-26/y58-59. If confirmed, continue `L U R L U RRR DD LLL D RR`; then separately test blocked-train R (should attach color12 at col5 with blue at col6), before finishing `R UU L U R`.
