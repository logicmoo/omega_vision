# Working model

- **Checked through levels 1-4:** Boards use a 3x3-pixel logical lattice. ACTION1/2/3/4 move the active piece one logical cell up/down/left/right. ACTION5 rotates it 90° clockwise around its unchanged top-left anchor. Only the active piece moves.
- **Checked through levels 1-4:** Color8 blocks are connection ports. Exact overlay of two ports displays color3 when one piece is active; edge adjacency and port-on-body do not match. Three ports at one coordinate are invalid. Pieces may pass through each other while moving, with underlying layers restored when vacated.
- **Checked on levels 3-4:** Inactive pieces become uniform color4 and hide their ports; ACTION6 activates the clicked piece and reveals its piece-specific body color and ports. Clicking the current active piece can leave none active. Active ports still match hidden inactive ports.
- **Checked on levels 3-4:** Completion requires the intended connected arrangement and no overlaps except exact two-port pairs. Level 3 had all ports paired in a cycle; level 4 formed a collision-free four-piece cycle. Body overlaps prevented completion despite correct-looking port matches.
- **New level-5 hypothesis, strongly supported computationally but not yet live-checked:** A terminal color0 cell marks a root/non-port and changes the objective from a closed cycle to a collision-free connected tree. Not every color8 endpoint must be paired; three pair overlaps should connect four pieces. Treat this as provisional until endpoint selection and completion confirm it.
- **Checked:** The color4 strip `(16..47,0)` is deadline HUD; ignore it in gameplay and expectations.

# Working memory

- Level 5 of 6 freshly loaded at log step 103, background15. Active P at anchor `(23,14)` has 4x4 matrix `.AR. / RA.. / .AAR / .K..` where A=body11, R=color8 port, K=color0 root. P has three ports `(29,14),(23,17),(32,20)` plus root `(26,23)`.
- Inactive yellow paths inferred by graph endpoints: Q anchor `(47,5)`, 3x5, ports `(53,5),(47,8)`; R anchor `(5,38)`, 3x5 branching E-shape, ports `(11,38),(11,44),(11,50)`; S anchor `(47,47)`, 3x3, ports `(47,47),(53,50)`. Selection has not yet confirmed their endpoint colors.
- Exhaustive search proved there is **no geometrically consistent way** to pair all ten inferred color8 endpoints, even before collision checks. A connected-tree search (exactly three two-port overlaps, all other cells disjoint) found a 32-action optimum, strongly supporting the root/tree hypothesis.
- Chosen optimum in logical coordinates q=`(pixel-2)/3`: P final `(7,5)` r1; Q `(9,1)` r2; R `(6,8)` r0; S `(8,12)` r0. Final pair coordinates q are `(9,5)` P-Q, `(8,8)` P-R, `(8,12)` R-S. Unmatched ports are allowed under the hypothesis.
- Action totals from fresh state: P down1+rotate1; select Q, left6+rotate2; select R, right5+up4; select S, left7+up3. As in level4, watch for selection occlusion before fixing order.
- Next short confirmation: move initially active P down1 and rotate1 to its searched target, then select Q at body `(48,12)`. Predict Q endpoint blocks `(53,5),(47,8)` reveal color8. Stop before Q movement to confirm the new level's hidden ports.
