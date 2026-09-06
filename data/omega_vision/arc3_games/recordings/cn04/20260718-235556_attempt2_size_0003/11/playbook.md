# Working model

- **Checked on level 1:** The board uses a 3x3-pixel logical-cell lattice. ACTION2 moves the active piece/group down one logical cell (+3 y); ACTION4 moves right (+3 x). ACTION1=up and ACTION3=left are strongly supported by the standard mapping but not yet directly observed. ACTION5 rotates the active piece/group 90° clockwise, keeps its top-left anchor fixed, and swaps matrix dimensions. ACTION6 is unused and may select among pieces/groups on later levels.
- **Checked on level 1:** Color-8 3x3 blocks are connectors. Completion required the movable connector blocks to **exactly overlap** corresponding target connectors; edge adjacency did nothing. On successful overlap, the two connector blocks became color 3 in the pre-transition success frame. The moving body did not overlap the target body.
- **Checked:** The 32-cell color-4 strip at `(16..47,0)` is deadline HUD, not gameplay. It gradually fills color 0 at an irregular cadence (6/32 by level-1 action 13) and resets each level. Never include HUD cells in action expectations.
- **Strong level-2 structural inference (computed from connector vectors):** There are four body assemblies forming a chain by two-connector interfaces: endpoint A (color 0, 2 ports) → middle C (color 11, 4 ports) → middle B (color 14, 4 ports) → endpoint D (color 9, 2 ports). Matching interface vectors are A/C `(-1,+2)`, C/B `(-2,+5)`, and B/D `(0,+2)` after rotating D counterclockwise. Likely connected pieces become one movable group and/or ACTION6 selects another group; test this from the board after the first partial dock rather than assuming.

# Working memory

- Level 2 of 6, just loaded at step 14; background is color 12 and HUD reset.
- Active color-0 endpoint A has logical matrix at top-left `(11,11)`: `000 / 0.0 / 0.0 / 0.R / 0.. / 0R.`. Its ports are relative `(2,3),(1,5)`.
- Color-11 middle C is below, with matching left ports at absolute logical blocks `(17,38)` and `(14,44)`. Moving A down exactly 6 times to top-left `(11,29)` overlays both ports with no body collision. Based on level 1, predict those matched blocks turn color 3 while level count remains 1.
- Remaining planned chain geometry (do not execute until partial-dock behavior/selection is observed): C's other ports `(32,38),(26,53)` match color-14 B ports `(44,14),(38,29)` after translating the A+C group +4 logical x and -8 logical y. B's remaining ports `(50,20),(50,26)` match color-9 D after D is rotated CCW (3 clockwise ACTION5s) and moved up 10 logical cells.
- Next: six guarded ACTION2 moves to make the first A–C dock.
- Ruled out from level 1: adjacency as goal, one-pixel movement, click-selection being required when only one active piece exists, and ACTION5 being CCW/center-anchored.
