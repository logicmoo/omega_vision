# Working model

- **Checked through levels 1-3:** Color-5 patterned shapes are movable sources; each has a solid color-4 reflection across a color-10 mirror line. Logical cells are 3x3 pixels. Exact full-footprint overlap with all corresponding color-11 goals completes a level; mere contact/partial overlap does not.
- **Checked selection:** Black color-0 centers identify the selected entity. ACTION5 cycles `mirror -> source A -> source B -> ...` (with only existing sources). Selected source centers are black; unselected centers are background 9. Selected mirror slots are black; unselected slots are background 9. When a source/reflection exactly overlays a goal, its border remains color5/4 but tile centers show underlying goal color11, hiding selection marks.
- **Checked controls:** ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right, ACTION5=next selection, ACTION7=undo. Undo restores gameplay geometry but not spent timer cells. ACTION6 remains untested.
- **Checked reflection dynamics:** Moving a source by `(dx,dy)` moves its reflection by `(-dx,+dy)` across a vertical mirror and `(+dx,-dy)` across a horizontal mirror. Moving a mirror one cell along its normal leaves sources fixed and moves all reflections two cells in the same direction. Parallel movement of a mirror is irrelevant/not needed so far.
- **Checked multi-source objective (level 3):** Every source and its reflection must simultaneously occupy its same-orientation and flipped-orientation goals. Several source-goal footprints can overlap into one composite color-11 component; decompose by normalized shapes rather than treating each color-11 component as one target.
- **HUD:** y=63 and x=63 are HUD. Ordinary moves/selections consume one right-edge cell from the top; consumed color varies by level. Never use a fixed HUD color as gameplay evidence. About 64 actions are available.

# Working memory

- Level 4/8 began at step69. A selected horizontal mirror is y=9..11 (axis y=10). Source A is a 7-tile U at x=12..26,y=18..23. Source B is a 6-tile vertical bar at x=18..20,y=30..47. Both are currently unselected/hollow.
- The two color-11 components at x=33..47 are composites. Decomposition:
  - A same-orientation U target x=33..47,y=18..23 and vertically flipped target x=33..47,y=33..38.
  - B vertical targets x=39..41,y=9..26 and x=39..41,y=30..47.
- Both pairs imply final horizontal mirror axis y=28. Thus shortest solution is mirror down 6 cells, then source A right 7, source B right 7, with two ACTION5 selections: 22 actions total.
- Current reflections are mostly above the screen: A internal bbox y=-3..2 (only two side tiles visible at y=0..2), B y=-27..-10 (fully invisible). Commit 6x ACTION2 on selected mirror; predicted final reflection bboxes are A y=33..38 and B y=9..26. Then stop to confirm the next selected source before moving it.
