# Working model

- **[Checked]** Six levels. Controls: ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right; ACTION6 clicks a coordinate.
- **[Checked]** A split cyan/dark cursor moves over fitting gray track; dark half points in the commanded direction. Blocked commands reorient without moving. Valid shifts equal cursor size (4 at 4x4; 2 at 2x2). Vacated cells restore underlying tiles, including colored markers.
- **[Checked]** A framed cyan block is the goal; moving into its cyan interior completed levels 1–3.
- **[Checked]** Colored-pip panels show black-slot patterns for a lower 3x3 mechanism. In single-panel levels, click each initially black 3x3 slot; clicks persist green until the last, then the grid settles gray and opens the route. Irrelevant clicks give a color-8 error flash.
- **[Checked, transformation varies]** L1 shrank 4x4→2x2; L2 teleported a same-size cursor; L3 removed main-field color6/color13 key/barrier cells while cursor stayed put. Always inspect the post-completion diff rather than importing the prior level's effect.
- **[Checked HUD]** x=62..63 is a decreasing budget reset each level. Move as far as safely possible with the larger cursor before transformations.

# Working memory

- Level 4, 3/6 complete, full budget. Cursor 4x4 at x=35..38,y=19..22 facing down. Cyan goal is far right x=51..54,y=35..38, blocked by color13 at x=47..49,y=35..38.
- Two colored hint panels now appear at upper left: purple15 plus pattern at x=0..9,y=0..9 (same as L1 shrink), and color6 vertical pattern at x=0..9,y=11..20 (same as L3 barrier-clear). Lower 3x3 is initially all gray, so a panel likely selects/loads its pattern; this multi-panel behavior is untested.
- Geometry suggests sequence: use purple shrink at the left bottleneck, traverse 2-high corridor to the color6 key at x=7..10,y=28..31, then use color6 stage to clear the color13 goal barrier.
- Safe pre-shrink position: ACTION3 twice to x=27..30, then ACTION2 twice to y=27..30, immediately above/aligned with the 2-high left corridor y=29..30. Then click a purple pip at (4,1) and inspect whether the bottom grid loads holes or another animation/state change occurs.
