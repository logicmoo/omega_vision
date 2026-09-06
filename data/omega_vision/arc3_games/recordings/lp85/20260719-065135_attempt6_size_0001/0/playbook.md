# Working model

- **[Checked through level 5]** Only `ACTION6(x,y)` is used. Arrow buttons apply a fixed cyclic permutation to an associated set of tile slots. Tracks/permutations may overlap; moving contents through overlaps re-spaces/routes target-colored tokens.
- **[Checked through level 5]** Every special tile must occupy a corner-marked slot of the same color. Same-colored tokens are interchangeable; preserve identities only when colors differ.
- **[Checked levels 4–5]** A logical permutation may span visually separated or winding segments, and one large cycle can overlap a smaller subset cycle. Infer exact membership/direction from diffs, never from apparent local continuity alone.
- **[Checked]** `x=0` can be a budget and top short marks show progress (now 5/8); neither is a piece.
- **[Method]** Ordinary colors do not affect completion. Reconstruct action permutations from exact diffs, then search only special-token positions. Probe a new visual operation once with an explicit predicted permutation before committing.

# Working memory

- Level 6, 5/8 complete, fresh board at step 52. Tile scale is 2x2. Three color-11 tokens: `(11,18)` in upper-left cluster, `(47,12)` in upper-right, `(26,45)` in lower. Three color-11 marked targets: `(26,27)`, `(32,27)`, `(29,33)`.
- The 75 colored slots decompose exactly into three disjoint 25-slot cluster systems:
  - Upper-left center `(14,15)`: 24 slots are three concentric 8-position square rings at radii 3,6,9; target `(26,27)` is the fourth position beyond the center on the SE radial spoke.
  - Upper-right center `(44,15)`: analogous rings; target `(32,27)` extends the SW spoke.
  - Lower center `(29,45)`: analogous rings; target `(29,33)` extends the N spoke.
  Each cluster has exactly one token and one target.
- **Strong but untested operation hypothesis:** each cluster's east-side button rotates all three 8-slot rings angularly by one step; its south-side button cycles the four positions on that cluster's target radial spoke, allowing an angle-aligned inner token to move outward to the target. This two-operation carousel model explains why each cluster has 24 ring slots + one target and two controls.
- Controls inferred by placement: upper-left east `(27,16)`, south `(15,29)`; upper-right east `(57,16)`, south `(45,29)`; lower east `(42,46)`, south `(30,59)`. An additional up-shaped button near `(54,55)` is unassigned and must not be clicked without evidence.
- Angular slots clockwise for radius `r` are `NW,N,NE,E,SE,S,SW,W`. Token/target angles: UL `SW→SE`; UR `NE→SW`; lower `W→N`.
- Next deliberate probe: click UL east button `(27,16)`. Prediction under clockwise ring rotation: UL token `(11,18)→(11,15)` (SW→W), its source becomes old S color1, and outer NW `(5,6)` becomes color15. The target and other clusters should remain unchanged. If the opposite angular direction occurs, the token should instead move to `(14,18)`; either result reveals the operation with one useful move.
- Ruled out: nothing yet on level 6; no actions have been taken.
