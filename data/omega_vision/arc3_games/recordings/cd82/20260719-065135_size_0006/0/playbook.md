# Working model
- [Checked, step 0] The board is 64x64; level 1 of 6 is active. Available controls are ACTION1–ACTION6 (ACTION6 is a coordinate click).
- [Checked, step 0] The arena background is color 5. A full-width color-4 line at y=63 is likely a move/deadline HUD, not a piece.
- [Checked, step 0] A reference panel at x=3..12,y=3..12 shows color 0 above color 15 (each 10x5). Two framed color swatches (0 and 15) sit in the top bar.
- [Checked geometry; interpretation assumed] In the playfield, a color-15 region at x=26..37,y=25..31 is surrounded by a color-2 outline, while a color-0 rectangle occupies x=27..36,y=34..43. The outline plus the mark under the color-15 swatch likely denotes the currently selected piece. The likely objective is to rearrange the playfield colors to match the reference order (0 above 15), but this is not yet established.
- [Assumed, must probe] ACTION1–ACTION4 may be directional movement, ACTION5 may switch/confirm selection, and ACTION6 may directly select an object.

# Working memory
- Level 1, step 0, 0/6 complete. No actions have been tested.
- Current apparent selection: color 15 central region. Exact avatar/piece semantics and movement increments are unknown.
- Next deliberate probe: click the central color-0 rectangle at (31,38). Hypothesis: clicks select pieces; predicted qualitative result is that the color-2 selection outline transfers from color 15 to color 0 (and no level completion). If nothing changes, direct object selection by click is ruled out.
- Bottom timer line is initially color 4 across all 64 cells; compare it after every probe.
- Ruled out: nothing yet.
