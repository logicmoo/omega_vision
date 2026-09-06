# sk48 playbook

## Working model
- **Core controls/objective checked through level 2:** Bottom-panel colors are required order; hollow centers mark secured blocks. ACTION1/2 move the horizontal assembly up/down, ACTION4 extends/moves right, ACTION3 retracts/pulls left, ACTION7 undoes. Free acquired blocks form a contiguous suffix and push ordinary adjacent targets.
- **Level-3 strand:** Targets begin on a fixed vertical 2/3-patterned strand at col3, rows0-3, anchored by color11 above. A bare horizontal cable can cross any bead without moving it: a wrong bead is merely threaded through, while crossing the next required bead hollows it temporarily.
- **Checked transfer rule (steps 61-68):** A temporarily acquired bead on the vertical strand is carried with vertical assembly motion and pushes the bead below it. ACTION3 while it remains on rows0-3 merely unthreads/refills it. Once carried to row4, below the strand, ACTION3 pulls it left normally and its hollow marker persists. This is how a bead transfers from vertical to horizontal chain.
- **Checked ordinary collection below strand:** After transfer, target pushing/attachment follows level-2 rules. Red pushed free color12 along row5; at the wall another R attached color12 (steps69-73).
- **New checked barrier rule (step78):** The fixed vertical strand also blocks a secured horizontal block from being pulled left across col3 on rows0-3. At row2, pair red(c4)-color12(c5) retracted once normally to c4-c5; the next L, which would put red on strand col3, instead detached/refilled terminal color12 and left red at c4. Therefore blocks must be moved/retracted to the desired side while below row3 before travelling upward.
- **Still untested:** Whether a solid acquired block can push a tethered future bead sideways off the strand. Do one explicit R probe once staged left of blue.
- **HUD:** y=53 is a loose step budget; ACTION7 cleanly restores acquisition states.

## Working memory
- Level 3, 2/8, step78. Red remains acquired at row2 col4. Color12 is row2 col5 but was just detached/refilled by the blocked second L. Blue/green remain tethered at row1/0 col3.
- Recovery: ACTION7 restores the acquired pair at row2 cols4-5. Move down twice to row4 (below the vertical strand), then retract three times to cols1-2. Predicted sequence: `undo, DD, LLL`. This avoids the barrier rather than trying to cross it.
- Thereafter `UUU` reaches row1 with the pair still cols1-2 and blue at col3; one separate R should test sideways pushing. If it works, blue goes col4 and can be driven to wall/attached; then repeat below-strand routing for green rather than retracting across the strand at row1.
