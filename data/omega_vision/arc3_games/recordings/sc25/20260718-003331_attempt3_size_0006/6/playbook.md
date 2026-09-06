# Working model

- **[Checked]** Six levels. Controls: ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right; ACTION6 clicks a coordinate.
- **[Checked]** A split cyan/dark cursor moves over fitting gray track; the dark half points in the commanded direction. Blocked commands reorient without moving. Valid shifts equal current cursor size (4 at 4x4; 2 at 2x2). Vacated cells restore their underlying tile, which may be a colored marker rather than gray.
- **[Checked]** The framed cyan block at a route end is the level goal. Moving into its cyan interior completed levels 1 and 2.
- **[Checked]** Lower-left colored pips are a hint for initially black slots in the lower-right 3x3. Click each black 3x3 slot; clicks persist green until the last, then the grid settles gray and transports/transforms the cursor through an impossible colored bottleneck. Irrelevant clicks give a color-8 error flash.
- **[Checked, effect varies]** L1 completion shrank 4x4→2x2 at a narrow stem. L2 completion teleported the unchanged 4x4 cursor from immediately before a yellow gate to a same-size destination outlined by the hint color. Therefore first move as far as possible on wide gray track, stop immediately before the colored gate, fill the indicated slots, then inspect the result.
- **[Checked HUD]** x=62..63 is a decreasing budget that resets each level. Use larger-cursor moves before transformations when possible.

# Working memory

- Level 3, 2/6 complete, fresh budget. Cursor is 4x4 at x=35..38,y=22..25 facing down. Standard cyan goal is bottom-left at x=23..26,y=38..41, but its route is blocked by a color-13 barrier at x=27..30,y=34..36.
- First transformation route goes right: wide gray destinations x=39..42 then x=43..46 are safe; yellow gate occupies x=47..50 around the 2-high corridor. Color-6 destination is at x=55..58,y=22..25 and encloses color13. Move right twice to immediately before yellow.
- Current lower-right black holes are vertical centers (30,50),(30,55),(30,60), matching the color-6 vertical hint. Fill them after reaching x=43..46. Hypothesis from L2: completion teleports/transforms the cursor into/through the color-6 destination; inspect before planning toward the color-13 barrier and final goal.
