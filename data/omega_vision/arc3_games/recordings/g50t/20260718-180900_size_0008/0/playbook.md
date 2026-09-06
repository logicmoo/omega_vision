# Working model

- **Checked (step 0):** 64x64 board, colors `{0,1,5,8,9}`; available controls are ACTION1–ACTION5; win requires 7 levels. The full bottom border `y=63` is 64 cells of color 9 and is treated as HUD/timer, not terrain.
- **Checked (step 0):** Main color-5 track is laid out on logical centers `x=16+6k`, `y=10+6k`. A color-9 5x5 ring-like object is centered at `(16,10)` and a color-9 goal-like marker is centered at `(46,52)`. The obvious track route is down the left branch from `(16,10)` to `(16,52)`, then right to `(46,52)` (12 logical edges).
- **Checked (step 0):** A color-8 object/route runs from a 5x5 area centered `(16,40)` right along `y=40`, then up `x=40` to a 3x3 area centered `(40,10)`. Its role (hazard, moving obstacle, or static example/path) is unresolved.
- **Assumed, to test:** ACTION1/2/3/4 are up/down/left/right respectively and one directional input moves the blue object one logical 6-pixel edge; ACTION5 is interact/wait. Goal is likely to move blue to its matching marker while respecting/avoiding the red object/path.

# Working memory

- Level 1, fresh attempt at step 0; presumed blue position `(16,10)`.
- Next deliberate probe: ACTION2. Prediction under the leading control model: blue shifts down one tile to center `(16,16)`, restoring its old footprint to color 5; timer may also change. If confirmed, inspect all animation/diffs and red changes before committing a route.
- Ruled out: nothing yet.
