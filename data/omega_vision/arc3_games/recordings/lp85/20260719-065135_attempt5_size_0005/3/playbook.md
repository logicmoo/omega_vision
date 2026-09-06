# Working model

- **[Checked through level 4]** Only `ACTION6(x,y)` is used. Arrow buttons rotate an associated ordered coordinate cycle by one slot. Tracks may overlap; selected-track rotation moves all its contents, enabling special tiles to transfer/re-space where another track overlaps.
- **[Checked through level 4]** Each special tile must occupy a corner-marked slot of the same color. Same-colored tokens are interchangeable; preserve identities only for differing target colors.
- **[Checked levels 4–5]** A logical cycle can be rendered as multiple separated or winding segments. Infer membership and wrap from exact diffs, not apparent local continuity. One track may contain most/all board slots while another overlaps a subset.
- **[Checked]** `x=0` may be an action budget and top short marks show progress (4/8); neither is a piece.
- **[Method]** Ordinary colors do not affect completion. Reconstruct exact permutations from action diffs, then BFS special-token positions. If a diff contradicts connectivity, discard that connectivity model immediately.

# Working memory

- Level 5, 4/8 complete, step 43. Two color-11 tokens are now at `(23,18)` and `(23,54)` after one mistaken-but-useful lower-left click. Targets are `(17,6)` and `(41,6)`.
- **Falsified:** the lower controls do not rotate only a 17-slot serpentine cycle sharing one top slot. Step 43 changed every one of the 21 tiles. Exact old→new mapping proves lower-left `(12,38)` advances this 21-cycle `Q` by `+1`:
  `[(41,6),(35,6),(29,6),(23,6),(17,6),(17,12),(17,18),(23,18),(29,18),(29,24),(29,30),(23,30),(17,30),(17,36),(17,42),(23,42),(29,42),(29,48),(29,54),(23,54),(17,54)]`.
  Thus the five top slots run right-to-left in `Q`, followed by the full winding lower path. Lower-right `(38,38)` is strongly expected to perform `Q-` but is not yet tested.
- A second, overlapping top cycle is strongly inferred from its own arrow pair but not yet tested: `T=[(17,6),(23,6),(29,6),(35,6),(41,6)]`; top-left `(10,8)` should perform `T-`, top-right `(52,8)` `T+`. `T` shares all five of its slots with `Q`, rather than only one.
- BFS on unordered token positions under `Q±,T±`:
  - Fresh optimum was 9 actions and uniquely began `Q-`; the exploratory `Q+` was not optimal.
  - From the current post-probe state, optimum distance remains 9. One simple path is `Q+×2, T-, Q-, T+, Q-×4`.
  - Current path positions: after two `Q+`, tokens become `(29,24)` and `(41,6)`; proposed `T-` then gives `(29,24)` and `(35,6)`.
- Next plan: execute two already-confirmed `Q+` clicks at `(12,38)`, then use top-left `(10,8)` as an optimal probe of the inferred five-slot `T-`. If exact, solve the remaining six actions after recomputing/confirming controls.
- No undo is available; continuing from the useful probe is cheaper than resetting.
