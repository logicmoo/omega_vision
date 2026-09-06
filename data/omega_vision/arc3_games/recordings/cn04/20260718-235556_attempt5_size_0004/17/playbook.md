# Working model

- **Checked through levels 1-2:** Boards use a 3x3-pixel logical-cell lattice. ACTION1/2/3/4 move the selected piece one logical cell up/down/left/right. ACTION5 rotates it 90° clockwise, preserving its top-left anchor and swapping matrix dimensions. Only the selected piece moves, never a temporarily connected group.
- **Checked through levels 1-2:** Color8 blocks are ports. Exact port/port overlay displays color3; even one lone overlap does so. Edge adjacency does not count. Moving away restores both layers, and completion occurred when all intended ports were simultaneously matched.
- **Checked on level 2:** Pieces may pass through/overwrite bodies and ports. A moving port over ordinary body stays color8; only a true target port yields color3. ACTION6 selects a body: the new active body becomes color0, the former active restores its inactive color, while ports persist.
- **Checked:** The color4 strip `(16..47,0)` is deadline HUD. Ignore it in gameplay and expectations.
- **Strong level-3 model, pending one selection test:** All three path-shaped components may be movable pieces. Exactly one is active/revealed as color14 body + color8 ports; inactive pieces are uniformly color4, hiding both body and ports. ACTION6 on the currently active piece appears to deselect it (all becomes color4), explaining why subsequent movement was inert; ACTION6 on another yellow component should reveal/select that piece. This supersedes the earlier mistaken “irreversible commit” interpretation.

# Working memory

- Level 3 of 6, current log step 52, background12. Active 15-block source shape is at origin `(20,14)` after four right moves; its ports are `(32,14)` and `(32,32)`.
- Top yellow component is a 7-block path with inferred hidden endpoint ports `(32,14)` and `(47,11)`. Bottom yellow component is a 22-block path with inferred hidden endpoint ports `(32,29)` and `(47,44)`.
- **Checked latest:** source top port over `(32,14)` displays green3, proving that yellow can hide a true port. Source lower port over ordinary yellow `(32,32)` stays color8. Thus only one match exists and level remains 2/6. Earlier source port over `(29,32)` also stayed color8.
- Geometry supports the multi-piece model: likely port vectors in logical cells are source `(0,6)`, top `(5,-1)`, bottom `(5,5)`; rotated/oriented vectors can sum to zero, so the three two-port paths can form a cycle with all six ports paired after moving pieces.
- Next deliberate probe: ACTION6 on unoverlapped bottom body `(36,36)`. Predict current source becomes inactive color4 and bottom becomes active color14 with endpoint ports color8 at `(32,29)` and `(47,44)`. If confirmed, derive the shortest all-port cycle placement in Python before further movement.
