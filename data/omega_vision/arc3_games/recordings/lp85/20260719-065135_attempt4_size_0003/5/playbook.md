# Working model

- **[Checked through level 3]** Only `ACTION6(x,y)` is used. Arrow buttons rotate an associated closed coordinate cycle by one slot. Tracks may intersect at shared slots; rotating one track moves every tile on it (including intersection contents) while other slots stay fixed, allowing special tiles to transfer between tracks.
- **[Checked through level 3]** Each special tile must occupy the corner-marked slot of the *same color*. Preserve token identity in searches when marker colors differ.
- **[Checked]** The `x=0` strip can act as a level budget and the short top marks show progress (now 3/8); neither is a piece. Budget behavior/rate varies by level.
- **[Method]** Ordinary colors do not affect completion. Infer ordered track cycles from action diffs, then BFS only the ordered special-token positions. When a diff contradicts connectivity, replace that connectivity rather than adding exceptions.
- **[Checked, level 4 step 30]** Visually separated rows can belong to one larger cycle. Clicking the right arrow `(55,16)` advanced a 20-slot horizontal cycle consisting of the entire top row followed by the entire bottom row; it did not rotate only the top row.

# Working memory

- Level 4, 3/8 complete, step 30. Special tokens now: color11 `(42,15)` (moved by the probe), color12 `(15,48)`. Matching targets: color11 `(45,45)`, color12 `(51,45)`.
- **Falsified:** four independent/global 10-cycles. The failed expectation at `(9,15)` exposed the wrong wrap source. Exact diff shows one horizontal 20-cycle `H`:
  `[(x,15) for x in 9,12,15,18,21,39,42,45,48,51] + [(x,45) for the same x list]`.
  The click `(55,16)` performs `H+` (each tile advances one index). Thus top-left `(9,15)` received old bottom-right `(51,45)=1`, while bottom-left `(9,45)` received old top-right `(51,15)=15`.
- By exact slot symmetry, strongly inferred vertical 20-cycle `V` (not yet action-tested):
  `[(15,y) for y in 9,12,15,18,21,39,42,45,48,51] + [(45,y) for the same y list]`.
  Up arrows should perform `V-`; use `(15,36)` for the needed move.
- `H` and `V` intersect at `(15,15),(45,15),(15,45),(45,45)`. Ordered-token BFS from the **current** state under `H±,V±` gives a unique 12-move optimum: `H+×4, V-×1, H+×7`.
  - Four `H+`: color11 `(42,15)→(45,15)→(48,15)→(51,15)→(9,45)`.
  - One `V-`: color12 `(15,48)→(15,45)`; if `V` is global, `(45,51)` simultaneously becomes old `(15,9)=10`.
  - Seven `H+` then move both bottom-row tokens together to color11 `(45,45)` and color12 `(51,45)`.
- Next plan: execute the four checked `H+` moves, then use the optimal `V-` as a deliberate global-vertical probe. If its token and far-column expectations pass, commit the final seven `H+` clicks.
- No undo is available. The already-spent mistaken probe still advanced color11, so continuing costs 12 more actions; resetting would not improve total action count.
