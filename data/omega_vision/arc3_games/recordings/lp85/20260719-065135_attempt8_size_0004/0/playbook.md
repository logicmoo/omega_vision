# Working model

- **[Checked through level 7]** Only `ACTION6(x,y)` has been needed. Buttons apply fixed cyclic permutations to tile slots; an action may couple visually separated cycles, and different actions may overlap at transfer slots. Infer membership/direction from exact diffs, never from button proximity or reused arrow shape alone.
- **[Checked through level 7]** Completion requires every special tile to occupy a corner-marked slot of the same color. Same-colored tokens are interchangeable; ordinary tile colors matter only for reconstructing permutations.
- **[Checked level 7]** Opposing arrow buttons can be exact inverses. Routing may require parking a token off one cycle through an overlap while operating another cycle; model token states and use BFS for the shortest word once permutations are known.
- **[Checked level 7]** Arrow geometry is contextual: a right button simultaneously shifted one 8-cycle right and rotated a separated square clockwise, while vertical buttons affected only an overlapping 3-cycle. Do not infer disconnected membership or direction from shape/color class.
- **[Checked]** `x=0` is a move-budget strip and top bars show progress (now 7/8), not pieces.
- **[Method]** Read exact diffs first, reconstruct generators, then search only special-token states. Probe a genuinely unknown generator once with a forward prediction; inverse buttons can unwind a harmful probe.

# Working memory

- Level 8/final began at settled step 80, 7/8 complete. Tiles are 2x2. Three color-11 tokens start at `(18,9),(18,18),(18,27)`. Three marked color-11 targets are `(24,51),(30,51),(36,51)`.
- There are 69 slots total. Upper 40 slots occupy a diagonal/winding pattern through `y=6..30`; lower 29 slots contain a complete 4×7 grid at `x={24,30,36,42}`, `y={33,36,39,42,45,48,51}`, plus extra `(39,48)`.
- Four inverse arrow pairs/generators: left/right pairs near `(49/53,25)`, `(49/53,30)`, `(49/53,35)`, and bottom `(31/36,58)`. Exact memberships are untested. The three right-side pairs plausibly control three interwoven local tracks; the bottom pair plausibly controls lower-grid/target routing, but this is only a hypothesis.
- Three obvious token-to-target geometric branches run diagonally down-right then vertically: token `(18,9)` toward column `x=36`/target `(36,51)`, `(18,18)` toward `x=30`/target `(30,51)`, and `(18,27)` toward `x=24`/target `(24,51)`. These cover 45 slots including targets; 24 remaining slots likely form return branches. Do not assume these are operation cycles until a diff confirms them.
- Next deliberate probe: bottom-right button `(36,58)` while all tokens are outside the lower grid. Leading prediction is a rightward 4-cycle on each lower-grid row, at least on the target row: old `x24→x30→x36→x42→x24`. Thus target-row values `[2,9,15,9]` should become `[9,2,9,15]`; if all rows participate, y45 `[10,9,15,9]` becomes `[9,10,9,15]`. Other hypotheses (bottom row only or a winding/global cycle) will be separated by the exact diff.
