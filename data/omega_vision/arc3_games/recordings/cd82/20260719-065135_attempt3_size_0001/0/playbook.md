# Working model
- [Checked through level 2] The central x=27..36,y=34..43 region is a 10x10 canvas; x=3..12,y=3..12 is the exact target. A color-2-bracketed 10x5 object is the main paint stamp. ACTION5 drives it into the canvas, overwrites a directional half-plane with its color, then returns it; the level completes as soon as the canvas equals the target.
- [Checked masks] Main-stamp poses/masks in local canvas coordinates: N paints `y<=4` (50 cells); SE paints `x+y>=9` (55). By symmetry the 8 masks are N/S/W/E halves and NW/NE/SW/SE inclusive diagonal halves.
- [Checked movement] ACTION2=down, ACTION3=left, ACTION4=right; ACTION1 is strongly expected up. Cardinal inputs move/roll the main stamp through 45-degree poses around the canvas. Verified ring route: N --L--> NW --D--> W --D--> SW --R--> S; reflected route N --R--> NE --D--> E --D--> SE also solved level 2.
- [Checked palette] ACTION6 on a framed top swatch selects that color, recolors the active brush, and moves the marker beneath the swatch. ACTION6 on the canvas does nothing. ACTION5 stamps without changing palette color.
- [Checked] The full-width y=63 color-4 strip is an action/deadline budget and resets each level; its exact update cadence varies, so ignore it as movement evidence.
- [New in level 3, checked geometry] A second small bracketed object appears north of the main stamp. Its 4x3 color-fill rectangle matches a required 4x3 target patch exactly, strongly indicating a separately usable small stamp. Its selection/control semantics are not yet known.

# Working memory
- Level 3, step 12, 2/6 complete; fresh 64-cell budget. Canvas is all color 0. Main stamp is color 15 at N (fill x=26..37,y=25..31). Small north object has a 4x3 color-15 fill at x=30..33,y=20..22 plus a 2-cell color-0 handle. Palette swatches: 0@(23,4), 15@(29,4, selected), 12@(35,4), 11@(41,4), 14@(47,4), 8@(53,4), 9@(59,4).
- [Computed exact decomposition] The target is produced from all-0 with only these paints, in order: main SE color14 (`x+y>=9`); main W color8 (`x<=4`); main NW color15 (`x+y<=9`, restoring overlap); and small N color12 on local rows0..2,cols3..6. This reproduces all 100 target cells exactly; no initial N/S fill is needed.
- Next deliberate probe/productive step: click color14 swatch (47,4). Prediction: at least the main brush changes 15->14 and canvas stays 0. Inspect whether the small 4x3 fill also recolors; that distinguishes shared versus separate brush selection before committing movement.
- Once main is confirmed color14, intended route N->SE is ACTION4,ACTION2,ACTION2 then ACTION5. Later main route SE->W can use left,left,up; W->NW is up. Small-stamp activation remains to discover.
- Ruled out this level: nothing yet.
