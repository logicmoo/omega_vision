# Working model

- **Checked (level 1):** The board uses a 16×16 logical lattice of 4×4-pixel tiles. `ACTION1/2/3/4` are up/down/left/right; `ACTION5` toggles grab/release. Normal translation is one logical tile.
- **Checked (level 1):** An unladen agent faces via its color-0 edge. A directional move rotates it to that direction; if the destination is occupied, translation is blocked but the turn still occurs. A framed cargo piece (ring 4, color-9 core) highlights ring `4→3` only when immediately on the facing side.
- **Checked (level 1):** `ACTION5` grabs highlighted cargo (`3→0`). While carrying, all directional moves translate the rigid agent+cargo pair without rotating or changing their relative offset. `ACTION5` releases cargo in place (`0→3`); moving/facing away restores it to ring 4.
- **Checked (level 1):** Cargo and agent cannot move through free/placed cargo. The color-9/color-2 framed target is passable to held cargo and is layered: moving cargo away restores underlying target pixels. Filling its slots with all cargo and releasing the last piece completes the level.
- **Checked (level 1):** Cargo can be approached, grabbed, carried, and deposited with the offset above the agent. **Symmetric pickup from other sides is strongly inferred but not yet directly checked.**
- **Checked:** Bottom row `y=63` is HUD/deadline, not terrain. It advances only on some actions (roughly one segment per several actions); keep routes short. Level transitions reset it.
- **Assumed for level 2:** A solid color-12 logical tile is a wall/obstacle. Avoid it until collision behavior is naturally tested.

# Working memory

- Level 2 of 9, step 29 (fresh board after level-1 completion). Agent `(3,2)`, facing up. Five cargo pieces: `(10,5)`, `(12,6)`, `(9,7)`, `(12,8)`, `(11,10)`. Target is the 2×3 rectangle `x=3..4,y=7..9` (six slots). Solid color-12 tile at `(6,9)`.
- **Likely but not yet checked:** Goal is to place all five cargo pieces anywhere in the six-slot target, leaving one slot empty; color-12 is a routing obstacle rather than sixth cargo.
- A bounded macro-state search under those assumptions found a 93-action direct-delivery route (no temporary drops/re-picks):
  1. Cargo `(10,5)` → target `(3,7)`: navigate `D,R×7,D`, grab it below the agent, carry `D,L×2,D,L×5`, release.
  2. Cargo `(9,7)` → `(4,7)`: navigate `R×6,D`, grab below, carry `L×5`, release.
  3. Cargo `(12,6)` → `(4,9)`: navigate `R×7`, grab on agent's right, carry `D,L,D,L×6,D,L`, release.
  4. Cargo `(12,8)` → `(4,8)`: navigate `U,R×8`, grab on right, carry `L×8`, release.
  5. Cargo `(11,10)` → `(3,9)`: navigate `D×2,R×7`, grab on right, carry `L×8,U`, release. This leaves target `(3,8)` empty.
- Current next plan only navigates to and grabs cargo `(10,5)`: `D,R×7,D,ACTION5`. This deliberately tests unladen down-facing and grabbing cargo below before relying on the conditional 93-action solution.
- Level 1 ruled out: pushing by movement, orientation-free proximity highlighting, and sprite rotation while carrying.
