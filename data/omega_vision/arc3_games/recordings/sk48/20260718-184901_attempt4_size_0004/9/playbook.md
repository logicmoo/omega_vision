# sk48 playbook

## Working model
- **Core controls:** ACTION1/2 move the entire horizontal assembly up/down one 6-pixel row; ACTION4 extends or shifts its attached suffix right; ACTION3 retracts/pulls left; ACTION7 undoes. Bottom-panel groups encode required color order for each anchor/strand. y=53 is a loose step budget.
- **Levels 1-2 checked:** Free targets attach to the horizontal chain in panel order. Acquired blocks form a contiguous suffix; right motion pushes adjacent blocks through free space, while a blocked target attaches. Vertical motion affects columns through terminal `t`, pushing destination-row targets at `<=t`.
- **Level 3 checked vertical-strand transfer:** A fixed vertical strand is a horizontal barrier on its patterned rows. Bare horizontal cable can cross a tethered bead; the next required bead temporarily attaches/hollows. Carry it vertically below the strand's free bottom, then pull horizontally to make acquisition permanent. Pulling while still on the strand merely detaches/refills it. Conversely, an acquired chain approaching a next bead against the strand attaches it in place (strand acts as stopper); carry the enlarged chain below the strand before retracting across. This solved level 3 at step97.

## Working memory
- Level 4, 3/8 completed, fresh at step97. Room remains 7x7. Two empty fixed vertical strands descend from top anchors: color10 at logical col2 (x25/26) and color11 at col4 (x37/38), apparently ending after row2. Horizontal assembly starts at row6 with four already-connected blocks in order blue9, green14, red8, color12 at cols0-3.
- Bottom panel has two destination/order groups: anchor11 followed by red8,color12; anchor10 followed by blue9,green14. Thus likely strand col4 wants red then color12, and strand col2 wants blue then green.
- Natural simultaneous alignment is shift the four-block chain right twice: blue/green/red/C become cols2/3/4/5, putting first-required blue on strand10 and red on strand11. Then rise from row6 to row3 below the strands. Setup plan is `RR UUU`.
- Next deliberate probe is U from row3 into strand row2. Symmetric-transfer hypothesis predicts all blocks move to row2 and the correctly aligned blue/red panel centers hollow simultaneously (red panel center x19-20, blue x43-44). Do not plan the release/deposition mechanism until that crossing is observed.
