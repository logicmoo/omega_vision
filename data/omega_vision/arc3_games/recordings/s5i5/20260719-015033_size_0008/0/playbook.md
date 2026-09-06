# Working model

- **[Checked, step 0]** The only control currently exposed is `ACTION6` (coordinate click). The 64×64 board uses color 5 as the main background and has no changing edge/HUD strip visible initially.
- **[Checked, static geometry]** There are two likely movable keyed objects: a horizontal 3×6 composite at x=27..32,y=9..11 (gray cap x=27, green/color-14 body, magenta/color-13 anchor at (31,10)); and a vertical 3×9 composite at x=9..11,y=27..35 (gray cap y=27, yellow/color-11 body, magenta anchor at (10,34)). Hollow magenta crosses are centered at (52,10) and (10,52), exactly collinear with the corresponding embedded anchors.
- **[Checked geometry; function still assumed]** Two bordered panels look like paired direction controls: horizontal green glyphs in left/right chambers centered near (39,21)/(45,21), and vertical yellow glyphs in up/down chambers near (24,38)/(24,44). Their colors match the two keyed objects. Strong hypothesis: clicking a glyph moves its matching object one cell in that panel direction, with the objective of aligning its embedded magenta anchor to the corresponding hollow-cross center. This has not yet been tested.
- **[Assumed]** Panel spatial order maps directly to direction (right chamber = right; bottom chamber = down), and a move translates the full capped object by one cell. Do not build a long plan until the first click confirms this.

# Working memory

- Level 1/8, attempt fresh at step 0. Green anchor (31,10) needs +21 x to cross center (52,10); yellow anchor (10,34) needs +18 y to cross center (10,52), if the alignment model is right.
- Next deliberate probe: click a colored cell of the right green glyph, (45,20). Prediction under the leading model: the entire horizontal source translates +1 x, so gray cap moves x27→28, embedded anchor (31,10)→(32,10), and body gains x=33. If instead no/source-unrelated change occurs, re-derive button semantics from the diff/frames rather than repeating.
- Ruled out: nothing yet; only static evidence is available.
