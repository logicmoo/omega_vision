# Working model
- **Checked:** Control is only `ACTION6(x,y)`. A tethered system has one colored 5×5 player (color-6 core), N endpoint blobs, and straight color-1 tethers. Its player coordinate is `floor(componentwise mean(endpoint centers))`; this has held for N=2, 3, and 4.
- **Checked:** Exactly one endpoint globally is active, shown by a color-0/white body. A normal field click relocates that active endpoint center exactly to the click, with no short range limit, then recomputes its system. Ordinary clicks do not cut ropes or choose the nearest endpoint.
- **Checked:** Clicking any body cell of an inactive color-3 endpoint selects it: that body changes 3→0 and the old active body changes 0→3 without moving coordinates. Moving a different endpoint therefore normally costs a select click plus a destination click.
- **Checked:** Put each player's color-6 core at the center of its matching dotted ring. On multi-player levels every ring must be solved. A solved ring flashes and settles with its perimeter color changed to 0; its assembly remains in place until the entire level completes.
- **Checked:** Color 2 is wall terrain. The x=0 strip is a fresh 64-action timer per level, filling one cell 0→5 per action; it is not gameplay.
- **Conservative model, strongly supported by successful routes but collision itself unprobed:** Treat color-10 regions as forbidden terrain and require every endpoint/player 5×5 shape and every straight tether to avoid colors 2 and 10. Also avoid overlap with other assemblies. Computed collision-free routes have worked exactly, so do not spend actions testing collisions.
- **Planning method checked through level 2:** For a proposed endpoint move, calculate the new floored mean and rasterize every endpoint-to-player segment over the logged board. Maze levels can require temporarily moving an endpoint and selecting it again; a final endpoint sum in `[N*T, N*T+N-1]` per coordinate puts the mean at target T.

# Working memory
- Level 3 starts after step 17; counter 2/6 and fresh timer.
- C14 system (4 endpoints): active A0=`(14,16)`, inactive A1=`(34,9)`, A2=`(39,16)`, A3=`(23,21)`; player=`(27,15)`; target T14=`(55,53)`.
- C15 system (2 endpoints): B0=`(37,34)`, B1=`(52,40)`, both inactive; player=`(44,37)`; target T15=`(34,57)`.
- Immediate 5-action plan: use the currently active A0 once, moving it to `(12,29)` → C14 `(27,18)`. Then solve C15: select B0 and move to `(44,60)` → C15 `(48,50)`; select B1 and move to `(25,54)` → exact target `(34,57)`. All states are clear of colors 2/10 and the other assembly.
- After C15 is confirmed solved, the precomputed C14 route is:
  1. select A2, move `(10,38)` → C `(19,24)`;
  2. select A1, move `(35,36)` → C `(20,31)`;
  3. select A3, move `(55,38)` → C `(28,35)`;
  4. select A2, move `(58,44)` → C `(40,36)`;
  5. select A0, move `(59,61)` → C `(51,44)`;
  6. select A1, move `(51,61)` → C `(55,51)`;
  7. select A3, move `(52,46)` → C `(55,53)` and finish level 3.
  Final A endpoints sum `(220,212)`, exactly `4*(55,53)`. The route was found by a bounded beam search and each full configuration was independently checked for static collisions, endpoint/player separation, and intersections with the planned solved C15 assembly.
