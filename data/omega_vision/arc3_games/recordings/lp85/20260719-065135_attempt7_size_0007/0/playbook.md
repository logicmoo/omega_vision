# Working model

- **[Checked through level 6]** Only `ACTION6(x,y)` has been needed. Arrow-shaped buttons apply fixed cyclic permutations to associated tile slots; tracks can wind, overlap, or consist of several disjoint cycles. Infer membership/direction from exact diffs rather than visual proximity alone.
- **[Checked through level 6]** Completion requires every special tile to occupy a corner-marked slot of the same color. Same-colored tokens are interchangeable; ordinary tile colors do not matter.
- **[Checked levels 4–6]** One operation can act simultaneously on separated tracks or boundary pairs. Level 6 used three polar grids: local right arrows shifted radial layers or rotated rings CCW, while one global button swapped three target/boundary pairs.
- **[Checked level 6]** A right-pointing arrow below a ring moves contents counterclockwise (rightward along the ring's bottom tangent). Translation-identical arrow shapes are strong direction evidence, though new track membership still needs care.
- **[Checked]** The `x=0` border strip is a move budget and short top bars are progress (currently 6/8), not pieces.
- **[Method]** Reconstruct permutations from diffs and search only special-token positions. Probe genuinely new operations once with a prediction; use already-solved components as constraints and do not disturb them unnecessarily.

# Working memory

- Level 7 began at settled step 72, 6/8 complete. Tiles are 2x2. There are two color-11 tokens and two color-11 marked targets.
- Upper system is a 10-slot L-shaped track: row `(20,23),(23,23),…,(41,23)` plus `(20,26),(20,29)`. Its token `(41,23)` is already in its marked target. Opposing down/up controls near `(20,20)` and `(20,33)` should not be touched.
- Lower system is a four-slot square: NW `(29,35)=1`, NE `(32,35)=15` and marked target, SW `(29,38)=9`, SE `(32,38)=11` token. Opposing left/right controls are near `(29,43)` and `(33,43)`.
- **Strong retrodicted prediction:** the lower right button has exactly the same translated shape/hash as level-6 right arrows. As a bottom tangent it rotates the four-slot square CCW, moving the token `SE (32,38) → NE target (32,35)` in one action while leaving the already-solved upper track untouched. This should complete level 7; use `expect_levels=7` rather than a cell expectation because the settled board will transition immediately.
- Ruled out/avoid: touching the upper track is unnecessary and would move its solved token off target; the lower left arrow would rotate the token away from its target if it is the inverse control indicated by its shape.
