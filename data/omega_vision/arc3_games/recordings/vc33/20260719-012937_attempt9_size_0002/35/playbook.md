# Working model

- **Checked through Level 6:** Coordinate-click boundary-transfer/cargo-routing puzzle; 7 levels. Color7 border is the timer. Completion requires every mobile cargo to reach the required remote slab adjacent to its same-colored fixed marker and align on the transfer axis.
- **Checked controls:** A color9 control transfers one boundary unit from its own-side donor slab to the slab across the divider. Donor loses fill (boundary moves inward), receiver gains fill (boundary moves outward), subject to capacities. Units observed: 4 (L1-2), 2 (L3), 3 (L4-6); infer each level from geometry.
- **Checked portals:** Color1 becomes color12 iff cargo is adjacent, both linked boundaries are equal, and the mobile marker is flush with the portal edge on its fill side. Left/top-filled uses the high/far edge; right/bottom-filled uses the low/near edge. Clicking color12 transfers the whole glyph without changing boundaries. Multiple eligible cargos swap simultaneously.
- **Checked method:** Represent arbitrary branching layouts as a bounded flow graph plus portal transitions, then search boundary/cargo states. L6 confirmed that one shared slab may connect several leaves.

# Working memory

- **Level 7 (`LEVELS 6/7`), fresh at step212.** Apparent five-slab star, all bottom-filled, likely unit2. Boundaries `(A,B,C,D,E)=(28,16,14,40,42)`: A top-left y8..29; B central x24..39 spanning y8..55; C top-right y8..29; D bottom-left y32..55; E bottom-right y32..55.
- Controls (donor side): A→B `(20,8)`, B→A `(24,8)`; B→C `(38,8)`, C→B `(42,8)`; D→B `(20,32)`, B→D `(24,32)`; B→E `(38,32)`, E→B `(42,32)`. For bottom-fill, donor q rises2 and receiver q falls2.
- Portals: pC B↔C at x40..41,y16..23, predicted activation `qB=qC=16`; pD D↔B at x22..23,y38..45, coordinate38; pE B↔E at x40..41,y38..45, coordinate38. Edge A-B has controls but no portal.
- Mobile/fixed inference: mobile 15 starts C at qC14, target fixed15 on D wall y50 => goal D,qD50. Mobile11 starts D qD40, target fixed11 on C wall y26 => goal C,qC26. Mobile14 starts E qE42, target fixed14 on A-B wall y18; A-B is impassable, so goal B,qB18.
- Cargo occupancy start `(B empty,C15,D11,E14)`. A four-click routing sequence `pC,pD,pC,pE` yields final `(B14,C11,D15,E empty)`.
- Event-state optimization over physical bounds A/C 8..30, B 8..56, D/E 32..56 and conserved q-sum140 gives a 49-action candidate (45 controls + 4 portals), with waypoints: pC `(26,16,16,40,42)`; pD `(8,38,14,38,42)`; pC `(8,16,16,48,52)`; pE `(8,38,8,48,38)`; final `(8,18,26,50,38)`.
- **All Level-7 mechanics/targets are still inferred, not checked. Next 2-action discriminating probe:** C→B `(42,8)` then B→A `(24,8)` should use unit2, reach first pC waypoint, move mobile15 marker to y16, and turn pC color1→12 only after action2. Both controls are on the optimized route; stop before portal click.
