# Working model

- [Checked, levels 1-6] Gravity navigation uses 6-pixel logical cells. Cyan (10) is open; patterned 5/3 is solid. ACTION3 moves/faces west and ACTION4 east. After a successful horizontal step, gravity carries the avatar to the next solid. Same-row solids block. Vertical travel recenters the camera at screen y39 when rising and y29 when falling.
- [Checked] ACTION6 removes green rounded blocks (14). Red (12) toggles individually: sparse 5-pixel X = traversable, rounded 21-pixel body = solid. Clicks target any visible object regardless of avatar distance; cyan/avatar clicks are inert.
- [Checked] White/yellow (15/11) bodies are immutable lethal hazards. Color-7 pluses are exits requiring physical contact; clicking hazards/exits is inert.
- [Checked] ACTION6 on a rounded gray (8) removes it and reverses gravity; each is one-use and its vanished location is inert. Level 6 confirmed that gray reversers can be hidden beyond the initial viewport.
- [Checked] ACTION7 restores the preceding substantive gameplay state (avatar, gravity, objects, camera) but still spends timer. Bottom row has served as a 64-action deadline. Need 9 levels total.
- [Solved level 6] Three grays at world (39,33), (27,87), and hidden (51,-93) were required. `scratch/level6_sim.py` plus `scratch/validate_level6.py` retrodicted all 954 recorded level-6 frames with zero errors; its searched route completed level 6 at step 259.

# Working memory

- Level 7, 6/9 complete, fresh board after step 259; timer/bottom row is 0. Avatar is centered at screen/world (21,39), facing east, with inferred initial gravity upward (solid immediately above at y33).
- Visible logical map uses x=3,9,...,57 and y=3,9,...,57. Avatar's chamber is x15..39 around y39/51; x45 is blocked there. Sparse red gates are at x27/33/39 for y=3,9,15,21,27 and at (39,39),(39,51). Immutable hazards are at (21,27),(45,27). No exit is currently visible.
- Eleven gray sprites form a vertical world column at x3, centers y=3,9,...,63 (the y63 one is clipped). A solid column at x9 separates them from the avatar, but remote clicking should still work. They do not yet behave like a changing HUD line; the conventional bottom timer row remains present.
- [Unexplored territory] World rows below y62 and above y0 are unseen. With inferred upward gravity the current chamber is static; reversing downward should settle the avatar at world y51, camera +22, and expose lower rows through world y84. This is the cheapest necessary territory reveal.
- [Next deliberate reveal] Click the topmost fully visible gray at screen (3,3). Based on the checked gray rule it should disappear, reverse gravity downward, carry avatar from world y39 to y51 above the y57 floor, and recenter it at screen (21,29). If this border column is instead non-gameplay HUD, the expectation will stop immediately.
