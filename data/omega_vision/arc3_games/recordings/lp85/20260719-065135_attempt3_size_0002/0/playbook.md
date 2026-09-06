# Working model

- **[Checked through level 2]** Only `ACTION6(x,y)` is used. Each pair of colored arrow buttons rotates its adjacent closed track by one slot: the left/color-8 arrow moves tiles one index counterclockwise on a clockwise-enumerated track; the right/color-14 arrow moves them clockwise.
- **[Checked through level 2]** Tracks can intersect at shared slots. A rotation permutes all tiles on the selected track, including shared slots, while non-shared cells of crossing tracks remain fixed; special tiles can transfer from one track to another at intersections.
- **[Checked for color 11; strongly supported for new colors]** The objective is to put each special-colored tile into the slot surrounded by four corner pixels of the *same* color. Levels 1 and 2 completed when all color-11 tiles occupied color-11 marked slots. Level 3 introduces both color 11 and color 12, so matching by color matters (not merely occupying any marked slot).
- **[Checked]** The full-height `x=0` strip is a level-resetting action budget; its fill rate varies by level. The short marks at the top show level progress (now 2/8). Ignore both as pieces.
- **[Method]** Because ordinary tile colors do not affect completion, model/search only the positions of special target-colored tiles under the track permutations. Preserve token identity when marker colors differ.

# Working memory

- Level 3, 2/8 complete, fresh board at step 13. Tile scale is 2x2. Special tiles: color 11 at `(42,22)`, color 12 at `(18,34)`. Matching marked slots: color 11 at `(15,28)`, color 12 at `(45,28)`.
- The 30 tile slots are exactly the union of two 16-slot rounded rectangular loops sharing `(30,22)` and `(30,34)`:
  - Left loop `L`, clockwise: `(21,19),(24,19),(27,19),(30,22),(33,25),(33,28),(33,31),(30,34),(27,37),(24,37),(21,37),(18,34),(15,31),(15,28),(15,25),(18,22)`. Its left/right controls are approximately `(23,42)` / `(26,42)`.
  - Right loop `R`, clockwise: `(33,19),(36,19),(39,19),(42,22),(45,25),(45,28),(45,31),(42,34),(39,37),(36,37),(33,37),(30,34),(27,31),(27,28),(27,25),(30,22)`. Its controls are `(35,42)` / `(38,42)`.
- BFS with ordered tokens found optimal distance 16. A simple optimal phase sequence is `L-×4, R-×4, L-×6, R-×2`. Token route: color12 reaches shared bottom `(30,34)` after four `L-`; four `R-` move color12 to `(42,34)` and color11 to shared top `(30,22)`; six `L-` move color11 to `(15,28)`; two `R-` move color12 to `(45,28)`.
- Next deliberate probe (also optimal): click left loop's left arrow `(23,42)`. Expected color12 movement `(18,34)→(21,37)` while color11 remains `(42,22)`. If confirmed, commit the remaining 15 moves.
- Ruled out: treating marked slots as interchangeable would have a 4-move solution, but the marker colors exactly correspond to distinct special tiles; use color-preserving targets.
