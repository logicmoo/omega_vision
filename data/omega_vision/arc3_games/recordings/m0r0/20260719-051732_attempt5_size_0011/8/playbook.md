# Working model

- **Confirmed objective (L1–L3):** two cyan pieces move synchronously by one lattice tile; a level completes when both finish an input on the same tile and merge.
- **Confirmed normal controls:** ACTION1=up, ACTION2=down. ACTION3 is mirrored outward (left-origin piece left, right-origin piece right); ACTION4 is mirrored inward (left-origin right, right-origin left). Each piece is blocked independently, enabling desynchronization.
- Gray 5 is floor; solid side-colored tiles are walls (colors vary by level). **Confirmed hazard:** gray/azure 5+8 checkerboard is enterable, but landing either player on it blinks that player and soft-resets both to their level starts while preserving timer use. Avoid all such landings.
- **Confirmed movable-marker mechanic (L3):** maroon 9 markers block players. ACTION6 on one selects it: selected marker becomes yellow 11 and players become inactive blue 1. Directional keys then move only that marker literally (ACTION1 up, ACTION2 down, ACTION3 left, ACTION4 right). Walls, markers, and players block it. ACTION6 on another marker switches selection directly; ACTION6 on a player or empty tile deselects and restores markers 9 / players 10. ACTION5 does nothing here.
- Timer is the advancing top/bottom border, roughly one cell per two actions; it is HUD, not gameplay.

# Working memory

- Level 4, 3/6 complete, fresh board. Lattice origin `(4,4)`, tile size 5, 11×11. Players: left `(2,6)`, right `(8,4)`. One blocker at center `(5,5)`. Walls enclose two rooms; safe crossing is row 5. Hazard stripes occupy `(1..3,1)`, `(7..9,1)`, `(4..6,4)`, `(4..6,6)`, `(1..3,9)`, `(7..9,9)`; avoid them.
- Safe-floor map (`.` safe, `x` hazard, `#` wall): `########### / #xxx###xxx# / #...###...# / #...###...# / #...xxx...# / #.........# / #...xxx...# / #...###...# / #...###...# / #xxx###xxx# / ###########`.
- A combined BFS restricted to safe tiles found an 11-action solution: normal `U`; select center marker; marker `L,L,D` to park at `(3,6)`; deselect by clicking left player; normal `I,D,D,I,I`. The first two downs leave the left player blocked by the parked marker while the right descends to row 5; final merge is center `(5,5)`. This avoids testing whether markers can safely occupy hazards (an unsafe assumption that would save only one action).
- Current timer is fresh. Execute the full route with expectations; predicted level count after final inward move is 4.