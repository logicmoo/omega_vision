# Working model

- **Checked (levels 1-2):** Rows 0-9 are informational HUD and do not respond to clicks; row 63 is a deadline bar. Each playfield click removes two of its 64 cells, giving about 32 actions/level. Invalid playfield clicks only ripple and spend timer. ACTION6 is coordinate click; ACTION7 is untested (probably undo).
- **Checked:** A blank/marked click within movement range relocates the nearest compact field piece, with the click becoming its logical anchor. Repeated anchor displacements up to 4 in each axis work; far clicks are no-ops. Rendered footprint by stage: color10 size1 at anchor; color6 size2 bbox `[x-1..x,y-1..y]`; color15 size3 bbox `[x-1..x+1,y-1..y+1]`; color11 size4 bbox `[x-2..x+1,y-2..y+1]`.
- **Checked (level 2):** The top-left strip is the upgrade ladder: 1x1 color10 -> 2x2 color6 -> 3x3 color15 -> 4x4 color11. Moving a piece close enough to another same-stage piece automatically consumes both and creates the next stage at the mover's clicked anchor. Confirmed merge geometry includes four empty cells between aligned footprints (anchor separation 6 for size2, 7 for size3); do not waste a separate merge click.
- **Checked:** Large centered HUD shapes specify the pieces that must be produced. A completed required piece must then be moved until its footprint **overlaps** a round color9 endpoint; mere edge adjacency does not complete. Level 1 required one size3; level 2 required one size4. When multiple HUD shapes/blobs appear, strongly infer one output per shape/blob.
- **Checked:** Level 2 completed after building one size4 and moving it into the blob. Color0 cross/contact objects may disappear at adjacency, but color9 endpoints require overlap.

# Working memory

- Level 3/9, fresh after step 32; deadline 64/64.
- HUD upgrade ladder unchanged. Required centered HUD shapes: one size4 color11 bbox (30,3)-(33,6) and one size3 color15 bbox (36,4)-(38,6). Two identical color9 round endpoints centered (9,50) and (23,50), bboxes (5,46)-(13,54) and (19,46)-(27,54).
- Initial field pieces: singles color10 at A=(31,15), B=(31,22), C=(12,23), D=(55,23), E=(61,23), F=(8,28); size2 color6 anchors QL=(19,17), QR=(47,23), QC=(31,33). Total leaf-equivalent mass is 12 = size4 (8) + size3 (4), exactly matching HUD.
- Planned hierarchy: merge singleton pairs AB, DE, CF into three more size2s; pair generated AB with QC (center), DE with QR (right), CF with QL (left) to make three size3s; merge center+right to size4 and retain left size3; deliver retained left piece to left blob and size4 to right blob.
- Next three checked-style merges: click (31,19) so nearer B merges with A -> color6 anchor (31,19); click (57,23) so D merges with E -> anchor (57,23); click (9,27) so F merges with C -> anchor (9,27). Then compute bounded routes for stage2 pairs.
- Ruled out this level: nothing yet; multi-output interpretation is strongly supported by exact mass accounting but not yet completed.
