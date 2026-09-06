# Working model

- **[Checked through level 4]** Only `ACTION6(x,y)` is used. Arrow buttons rotate an associated ordered coordinate cycle by one slot. Tracks may intersect at shared slots; rotating one track moves every tile on it (including intersections), while other slots stay fixed, so special tiles can transfer between tracks.
- **[Checked through level 4]** Each special tile must occupy a corner-marked slot of the same color. Tokens of the same color are interchangeable; preserve identity only when target colors differ.
- **[Checked, level 4]** One logical cycle may be rendered as multiple separated row/column segments. Determine membership and wrap from exact action diffs, not visual continuity alone. Duplicate arrows around separated segments can control the same cycle.
- **[Checked]** The `x=0` strip can be a level budget and short top marks show progress (now 4/8); neither is a piece. Budget rate varies.
- **[Method]** Ordinary colors do not affect completion. Infer each ordered cycle, then BFS only special-token positions (unordered for identical colors). When a diff contradicts connectivity, replace the model rather than adding exceptions.

# Working memory

- Level 5, 4/8 complete, fresh board at step 42. Tile scale is 4x4. Two identical color-11 tokens are at `(17,18)` and `(29,54)` (coordinates are tile top-lefts). Two color-11 marked targets are `(17,6)` and `(41,6)`.
- The exact 21 tile slots decompose into two inferred cycles sharing the first target `(17,6)`:
  - Top cycle `T` (5 slots): `[(17,6),(23,6),(29,6),(35,6),(41,6)]`; left/right controls centered near `(10,8)` / `(52,8)`.
  - Serpentine cycle `S` (17 slots): `[(17,6),(17,12),(17,18),(23,18),(29,18),(29,24),(29,30),(23,30),(17,30),(17,36),(17,42),(23,42),(29,42),(29,48),(29,54),(23,54),(17,54)]`; left/right controls near `(12,38)` / `(38,38)`.
  - `T∪S` has `5+17-1=21` slots, exactly matching every colored tile; their sole shared slot is `(17,6)`.
- BFS on the unordered pair of color-11 positions under `T±,S±` gives a unique 8-action optimum: `S-×2, T-×1, S+×5`.
  - First two `S-`: tokens `(17,18)→(17,12)→(17,6)` and `(29,54)→(29,48)→(29,42)`.
  - `T-` moves the intersection token `(17,6)→(41,6)` and parks it off `S`.
  - Five `S+` move the remaining token `(29,42)→(29,48)→(29,54)→(23,54)→(17,54)→(17,6)`.
- Next optimal probe: click lower left arrow `(12,38)`, expected to perform `S-`: tokens move to `(17,12)` and `(29,48)`. The shared target `(17,6)` should become old `(17,12)=15`, proving `S` includes that slot. If exact, commit the remaining seven actions.
- Ruled out on prior level: visual subrows were not independent cycles; one action rotated top and bottom rows together. Apply the same exact-diff discipline here.
