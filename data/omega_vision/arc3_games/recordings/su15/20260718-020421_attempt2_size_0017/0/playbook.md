# Working model

- **Checked (level 1, steps 0-13):** Playfield is rows 10-62; rows 0-9 are HUD and row 63 is a deadline bar. Every click consumes two of its 64 cells, so a level appears to allow 32 clicks. Invalid clicks make only a transient ripple plus timer loss. ACTION6 is coordinate click; ACTION7 remains untested (likely undo).
- **Checked (level 1):** A compact field piece whose color/shape matched the large centered HUD sample moved when an isolated trajectory marker was clicked. Clicking its current location or a distant marker/core was invalid. Repeated moves of two marker intervals (coordinate displacement (+4,-4) on that diagonal) reliably relocated the 3x3 piece and restored the old marker.
- **Checked (level 1):** The initial color-0 cross disappeared when the moving piece reached edge contact with it. The level completed when the piece's 3x3 footprint first overlapped the color-9 round object (piece center (44,19), one shell-cell overlap). Thus collision/contact with the round object is the endpoint objective; intermediate contact objects may be destroyed/collected.
- **Supported generalization:** Select or advance the HUD-indicated colored piece through marked field positions, in bounded moves, until it contacts the round color-9 endpoint. Later levels can add selection or routing mechanics.

# Working memory

- Level 2/9, fresh board after step 13; deadline reset to 64/64.
- Centered HUD sample is a 4x4 color-11 square at bbox (30,3)-(33,6). A top-left tray contains four 2x2 swatches: color 10 at (1-2,1-2), color 6 at (5-6,1-2), color 15 at (9-10,1-2), and matching color 11 at (13-14,1-2).
- Field has a solid round color-9 object centered (33,27) and eight isolated color-10 cells at (18,37),(41,37),(37,40),(16,41),(49,54),(14,55),(47,56),(16,57). No field piece matching the color-11 HUD sample is present yet.
- **Next probe:** click the tray swatch matching the centered HUD sample, color 11 at (13,1). Prediction: it selects/spawns the active color-11 piece or otherwise changes the board; this is more strongly cued than interacting with the color-10 field points.
- Ruled out on this level: nothing yet.
