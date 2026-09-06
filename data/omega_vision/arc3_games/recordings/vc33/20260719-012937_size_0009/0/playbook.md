# Working model

- **Checked:** The game has 7 levels; current level is 1 (`LEVELS 0/7`). Only coordinate click `ACTION6` is available on the opening frame.
- **Checked:** The top row is a uniform color-7 border/HUD strip; treat it as non-gameplay unless later evidence shows otherwise.
- **Checked:** Level 1 contains a single bright color-4 asymmetric object embedded in the large color-3 region at x=46..49, y=44..49 (a 2-pixel-scaled left-pointing key/arrow-like shape), with a color-11 bar immediately to its right at x=50..51. A second color-11 bar interrupts the horizontal color-5 passage at x=38..39, y=28..31. Two color-9 blocks bracket the passage near the far right.
- **Assumed, not yet tested:** The color-4 key/arrow is the primary clickable control or token; the passage marker and far-right brackets may be a lock/target/exit. Clicking the bright object is the cheapest first discriminator.
- **Objective unknown:** likely manipulate/collect the bright token and then use the passage/target; do not commit beyond the first probe.

# Working memory

- Level 1, fresh attempt at step 0. No avatar movement controls exist; only point-and-click.
- Next probe: click the center of the unique color-4 object at (48,46). Hypothesis: it is selected/collected/activated; predicted local cells change, with clicked cell likely vacated to underlying color 3. If not, re-derive from the exact diff rather than repeat.
- Ruled out: nothing yet.
