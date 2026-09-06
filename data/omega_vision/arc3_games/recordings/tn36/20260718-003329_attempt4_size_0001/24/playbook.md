# Working model

- **Checked:** The color-11, 14-pixel notched shape is transformed by a four-column program and must exactly enter the larger color-11 catcher. In level 2 it starts at logical `(3,5)` with an UP notch; the matching catcher is at `(3,1)`, so the required net effect is four cells UP with the notch UP.
- **Checked controls:** Each T has independently toggled head/stem colors `1↔5`; encode `(11,15,51,55)` as base-4 digit `(0,1,2,3)`. A three-T column is conveniently named by little-endian value `top + 4*middle + 16*bottom`. Columns execute left-to-right and are highlighted. RUN is the color-9 button around `(46,58)`. A failed run restores the starting shape but preserves controls. Timer row `y=1` loses one color-9 cell per action.
- **Checked level-1 primitive table:** With one T per column, `0=stay`, `1=right`, `2=left`, `3=down`; five digit-3 columns solved level 1.
- **Checked level-2 mask effects (names are only observational):** value0 leaves the shape unchanged; value4 `[11,15,11]` nearest-neighbor enlarges by one scale factor per use; value8 `[11,51,11]` is visually unchanged on the horizontally symmetric UP-notched source; value10 `[51,51,11]` changes UP notch to RIGHT in place; value32 `[11,11,51]` changes UP notch to LEFT in place; value9 `[15,51,11]` also changes this source to LEFT in place. Values9 and32 may be different transforms that coincide on this symmetric source.
- **Falsified:** value4 is not UP; value9 is not UP. Earlier labels `8=horizontal reflection`, `10=CW`, `32=CCW` are plausible but not fully distinguished by this source. Do not use `scratch/tn36_level2.py` operation/search table for live planning.
- **Checked static clue geometry:** The locked left matrix is four identical columns with **all three** T pairs `[51,51,51]`, i.e. value42—not value2 as previously recorded. Below it are a color-9 outlined icon with yellow on its LEFT and a color-2 outlined icon with yellow on its TOP; exact relation to the matrix remains uncertain.
- **Assumption under test:** The conspicuous four-column value42 locked matrix likely demonstrates the needed four-UP program, so value42 is the best untested candidate for UP. This is not yet safe enough for a full copy without one frame probe.

# Working memory

- Level 2, 1/7 complete, settled after step 44. Current editable values are `[9,4,4,4]`; source is restored at pixel bbox `(45,24)-(48,27)`. Timer remains color9 through `x=43` (43 actions available).
- Latest run frame 1 proved value9 changes mask `#..#/####/####/####` to `####/.###/.###/####` at the same bbox; subsequent value4 columns enlarged it, then failure restored it.
- Ruled out: 0,4,8,9,10,32 do not move this source UP in their observed first application (8 may hide a symmetry only).
- Next probe: convert only column 1 from value9 to value42 with `(39,33),(39,36),(39,45)`, then RUN. Prediction from the locked clue is first execution frame at bbox `(45,20)-(48,23)` with the original UP-notch; settled board will restore if later value4 columns fail. If confirmed, convert columns 2-4 to42 and run.

[END PLAN]