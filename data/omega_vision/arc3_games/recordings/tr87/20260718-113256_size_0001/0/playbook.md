# Working model

- **Checked (step 0):** Board is 64x64. Six training pairs occupy the top: each cyan 7x7 tile is connected horizontally to a pink 7x7 tile; each has a black 5x5 glyph. The lower task area has five contiguous cyan tiles (y=40..46) over five pink tiles (y=51..57), plus a white bracket cursor around lower column 0. Only ACTION1..ACTION4 are available. A full-width color-1 row at y=63 is likely the action/deadline HUD, not a piece.
- **Checked computationally:** Every lower cyan glyph is exactly a rotation/reflection of a training cyan glyph. In lower order they come from training pair indices `[3,4,0,1,2]` (training pairs numbered row-major 0..5). Four lower pink glyphs are exact D4 copies of training pink indices: lower positions 0,1,2,4 are `[2,5,4,0]`; lower position 3 is not a D4 copy of any training pink glyph. Thus a naive "just pair identical dictionary entries" account does **not** explain the initial lower rows.
- **Checked computationally:** Cyan training masks are connected 4-neighbor trees; pink masks are connected and have cycle rank 1 or 2. No single rotation/reflection maps cyan to its paired pink, and simple count/perimeter/hole equality does not hold across all six examples.
- **Assumed, pending control probe:** ACTION3/ACTION4 are left/right cursor movement, likely by one 7-cell tile; ACTION1/ACTION2 alter or manipulate the selected pink tile. Objective probably requires arranging or editing the lower pink row so its five entries correspond to the fixed cyan row under the demonstrated relation. Hold this loosely.

# Working memory

- Level 1 of 6, fresh attempt at step 0; cursor visibly brackets lower column 0 (tile center x=17).
- Initial source IDs: cyan `[3,4,0,1,2]`; recognizable pink `[2,5,4,?,0]`. Exact masks and descriptors can be re-extracted from step 0 with arclog; do not eyeball them.
- Next deliberate probe: ACTION4, predicted to move the white cursor one tile right (marker x=15..19 -> x=22..26) without changing glyphs. This tests the directional-control assumption safely. If contradicted, re-derive controls from the resulting diff rather than repeating.
- Ruled out from step 0 alone: direct fixed D4 geometric transform; direct pairwise equality of basic black-count/perimeter/hole descriptors; naive bottom dictionary alignment.
- Timer/action budget is unknown; track y=63 separately from gameplay diffs.
