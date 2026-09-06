# Working model
- [Checked through level 3] Canvas is x=27..36,y=34..43 (10x10); exact target is x=3..12,y=3..12. Main bracketed 10x5 stamp is moved around an 8-pose ring. ACTION5 overwrites a directional half-plane with its palette color and returns the stamp; matching the target advances the level.
- [Checked masks, local canvas coords] N `y<=4`, S `y>=5`, W `x<=4`, E `x>=5`; NW `x+y<=9`, SE `x+y>=9`; NE/SW are the reflected diagonals. Diagonal masks are inclusive (55 cells), so stamping the opposite diagonal later restores the shared 10-cell boundary.
- [Checked movement] ACTION2=down, ACTION3=left, ACTION4=right, ACTION1=up. Ring poses clockwise are N,NE,E,SE,S,SW,W,NW. Inputs translate to an adjacent pose (e.g. N-L->NW-D->W-D->SW-R->S; N-R->NE-D->E-D->SE).
- [Checked palette] ACTION6 on a framed swatch selects/recolors the main stamp and any visible small stamp, moving the marker. ACTION6 on canvas is inert.
- [Checked small stamp, level 3] At cardinal main poses a smaller stamp appears one step outward: N footprint is local rows0..2,cols3..6 (4x3); W is rows3..6,cols0..2 (3x4), with E/S by rotation. Click the visible small fill directly with ACTION6 to stamp that rectangle; do not press ACTION5. It disappears at diagonal poses. Pressing outward direction at a cardinal pose is a no-op.
- [Checked] y=63 color-4 strip is an action/deadline budget and resets per level; ignore its irregular update cadence as movement evidence.

# Working memory
- Level 4, step29, 3/6 complete; fresh canvas all0 and full budget. Main/visible small stamps start color15 at N. Palette centers: 0@23,15@29,12@35,11@41,14@47,8@53,9@59 (all y=4).
- [Computed exact recipe] Target is exactly: main NW12 (`x+y<=9`), then main SE15 (`x+y>=9`, restoring boundary), then main W9 (`x<=4`), then direct-click small W11 (local rows3..6,cols0..2). Operation order matters and reproduces all100 cells.
- Commit full route: select12,L,stamp; select15,R,R,D,D,stamp; select9,L,L,U,stamp; select11, click W-small at (14,38). Exact pose/canvas expectations guard every stage; expect level count4.
- Level-3 lesson: target decomposition SE14 -> W8 -> NW15 -> small-N12 was exact; direct small click caused the final 4x3 stamp and completion.
