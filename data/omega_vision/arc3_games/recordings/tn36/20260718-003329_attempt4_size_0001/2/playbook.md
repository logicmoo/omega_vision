# Working model

- **Checked on level 1:** The small 14-pixel yellow shape is the moving piece and the larger yellow shape is its catcher. Its 4x4 notch points toward the catcher/motion direction (level 1 notch down; level 2 notch up).
- **Checked:** Command controls are disconnected T shapes. Clicking a 3-pixel head or stem toggles that component 1↔5. A token's `(head,stem)` pair determines displacement: `55=DOWN`, `51=LEFT`, `15=RIGHT`, and `11` produced zero displacement in all observed level-1 frames.
- **Checked:** Clicking the large color-9 mouse body is RUN. It flashes and executes commands in display order, highlighting each; a failed run restores the moving piece but preserves controls. Direct piece/board clicks do nothing. Each non-RESET action spends one y=1 timer cell (9→3).
- **Checked level-1 solution:** Five `55` tokens executed D,D,D,D,D and reached the catcher. The success run showed positions `(4,2)..(4,6)` and raised levels 0→1.
- **Executable model:** `scratch/tn36_sim.py` implements level-1 `step(state,action)`, exactly retrodicted all 36 pre-solution frames, and its bounded exhaustive search over 4^5 configurations found the unique all-55 solution.
- **Caution:** Later levels add layouts/mechanics. Preserve the checked pair effects but do not assume control order or that `11` is universally a no-op without checking new run frames.

# Working memory

- Level 2, 1/7 complete, fresh board at step 25; full timer.
- **Checked geometry:** Right playfield is a 7x7 checkerboard, logical centers x=34,38,42,46,50,54,58 and y=5,9,13,17,21,25,29. Yellow mover is logical `(3,5)`, notch upward; catcher is `(3,1)`, four rows above.
- **Checked controls:** Right/below board is a 3-row × 4-column matrix of T tokens (column centers 39,44,49,54; row head/stem y pairs 33/35-37, 39/41-43, 45/47-49). All 12 begin `11`. RUN is the color-9 mouse centered `(46,58)`.
- **Checked clue/reference:** Left side shows the same 3×4 matrix: its top row is four `51` tokens and its other eight tokens are `11`. Above it is a color-4 copy of the mover rotated/open to the left. This strongly looks like a worked example encoding four LEFT moves, while the right task asks for four UP moves; how the three rows encode/transform direction is not yet known.
- **Unexplained/unvisited:** Level-2 RUN order, whether all 12 tokens execute or rows are channels, which state encodes UP, and the role of the two square icons at bottom-left. No level-2 token state or animation has yet been visited.
- **Next deliberate probe:** RUN the untouched all-11 right matrix at `(46,58)`. Under the inherited mapping predict no net/playfield motion and only timer change in the settled board; intermediate frames will reveal command order, active rows, and whether `11` gains an UP meaning here. This probe is required before editing a 12-token program.

[END PLAN]
