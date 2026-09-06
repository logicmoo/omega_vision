# Working model

- **Checked through levels 1-3:** Gameplay uses a 3x3-pixel logical lattice. ACTION1/2/3/4 move the active piece one logical cell up/down/left/right. ACTION5 rotates it 90° clockwise, preserving its top-left anchor and swapping matrix dimensions. Only the active piece moves.
- **Checked through levels 1-3:** Color8 blocks are ports. Exact overlay of two ports displays color3 when one piece is active; edge adjacency and port-on-body do not match. Pieces may pass through/overwrite one another while moving, and vacated cells restore underlying layers.
- **Checked on level 3:** Completion requires every port paired **and no overlap except exact two-port pairs**. A compact cycle with all ports paired but six extra body overlaps did not complete; rotating the final path to remove those overlaps completed immediately. Three ports at one coordinate display color8 and are invalid.
- **Checked on level 3, likely continuing:** One piece is active/revealed in its piece-specific body color with visible color8 ports. Inactive pieces are uniformly color4, hiding bodies and ports. ACTION6 switches to a clicked piece; clicking the active piece itself can leave none active. An active port can match an inactive hidden port.
- **Checked on level 2:** Earlier levels used active body color0 and preserved visible ports on inactive pieces; visual selection rules can vary by level, but movement/rotation/port rules persist.
- **Checked:** The color4 strip `(16..47,0)` is deadline HUD. Ignore it in gameplay and expectations.

# Working memory

- Level 4 of 6 freshly loaded at log step 73, background9. Active piece P has body color10, anchor `(8,11)`, 6x8 logical matrix `AAAAAA / A....A / A.AA.A / A.A..A / A.AAAA / A.A..R / A..... / R.....`; ports `(23,26),(8,32)` and logical vector `(-5,+2)`.
- Three inactive yellow path pieces are inferred from geometry: Q anchor `(35,20)`, 5x4 U-shape ports `(35,20),(47,20)` vector `(4,0)`; R anchor `(44,41)`, 4x6 path ports `(44,41),(44,56)` vector `(0,5)`; S anchor `(17,47)`, 3x1 line ports `(17,47),(23,47)` vector `(2,0)`. Endpoint-port inference is not yet live-confirmed on this level, so select each before relying further.
- A full exhaustive search over all cycle orders, 4 orientations, translations within board bounds, and exact occupancy (only two-port overlaps allowed) found a 29-action optimum from the initial state. Chosen final logical anchors/orientations: P `(5,3)` r0, Q `(10,8)` r3, R `(5,12)` r1, S `(5,10)` r1, where pixel anchor=`2+3*q` and r is clockwise quarter-turns. Final relative match coordinates are a collision-free four-piece cycle.
- Corresponding action budget: P right3; select Q, left1/down2/rotate3; select R, left9/up1/rotate1; select S, up5/rotate1. Selection order may be rearranged after P, but each non-P piece needs one click. Do not execute transformations for a piece until its inferred ports are confirmed on selection.
- Next: move currently active P right3 (required by optimum), then ACTION6 Q at unique body `(39,24)`. Predict Q reveals ports at `(35,20),(47,20)`; stop there to confirm before its transformation.
