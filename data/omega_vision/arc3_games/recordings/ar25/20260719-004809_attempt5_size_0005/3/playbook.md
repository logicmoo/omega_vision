# Working model

- **Checked through levels 1-4:** Color-5 patterned shapes are movable sources; color-4 images are reflections across color-10 mirror lines. Logical cells are 3x3 pixels. Covering every required color-11 target footprint completes a level; partial coverage does not.
- **Selection:** Black color-0 centers identify the selected entity. ACTION5 cycles through mirrors and sources. Selected source centers are black; unselected centers are background9. Selected mirror slots are black; unselected slots are background9. On a goal, source/reflection borders stay color5/4 while centers show underlying color11.
- **Controls:** ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right, ACTION5=next selection, ACTION7=undo. ACTION6 remains untested. Undo restores geometry but not spent timer cells.
- **Reflection dynamics:** Moving a source by `(dx,dy)` applies the corresponding reflected displacement to every image. Moving a mirror one cell along its normal leaves sources fixed and moves images involving that mirror by two cells. With perpendicular mirrors, expect source plus horizontal-only, vertical-only, and double-reflected images.
- **Multi-object targets:** Goal components can overlap. Decompose color11 into normalized source transforms. Some transformed images may have only sparse marker cells rather than a full silhouette; the apparent win condition is coverage of all yellow cells, while extra image cells over background are allowed.
- **HUD:** y=63/x=63 are HUD; ordinary moves/selections consume one right-edge cell. Consumed color varies. Ignore HUD as gameplay; about 64 actions are available.

# Working memory

- Level 5/8 began at step91. There are perpendicular mirrors: vertical x=9..11 (axis10, unselected) and horizontal y=15..17 (axis16, selected). One 11-tile source S is at x=42..56,y=36..50, unselected. All three reflections are initially off-screen.
- Source normalized logical footprint (5x5): `(0,0),(1,0),(2,0),(3,0),(3,1),(3,2),(4,2),(4,3),(2,4),(3,4),(4,4)`.
- Yellow set decomposes exactly as: a full S goal at macro base (4,5), pixel bbox x=12..26,y=15..29; a full double-flipped HV goal at base (8,9), bbox x=24..38,y=27..41; plus single-cell markers at macro (12,5) and (4,13) that lie in the predicted horizontal-only and vertical-only images.
- **Strongly supported solution geometry:** Put source on S goal (10 left, 7 up), vertical mirror axis at x=25 (5 right), and horizontal mirror axis at y=28 (4 down). Then H/V/HV image bboxes are respectively x=24..38,y=15..29; x=12..26,y=27..41; x=24..38,y=27..41, covering every yellow cell. Total expected cost is 28 actions including two selection changes.
- Current next step: selected horizontal mirror needs 4x ACTION2. This should move its vertical-only image down 6 pixels/action, from internal bbox y=-18..-4 to final y=6..20 while source stays fixed. Then stop to identify ACTION5 cycle order between the vertical mirror and source.
