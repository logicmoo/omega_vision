# Working model
- **Checked movement/objective:** The color-14 traveler is 2x2 and moves one 2x2 tile per directional action: ACTION1 up, ACTION2 down, ACTION3 left, ACTION4 right. It traverses contiguous non-background paths, restores underlying colors when leaving, and completes a level by entering the yellow 2x2 goal.
- **Checked blue connectors:** Clicking a color-9/blue control toggles its linked connectors between solid/open and background-checkerboard/closed. Closed checker paths block movement. Blocked moves have `[DIFF] none` and do not advance the bottom HUD budget.
- **Checked rotating arms:** Clicking a large matching-color control rotates rectangular arms 90° around a fixed 4x4 joint. A traveler on the fixed joint stays safe while arms rotate.
- **Checked physical keys:** A small colored arrow embedded in gray can be a physical key rather than a clickable control. Traveler contact consumes the arrow into gray and reveals a previously hidden large control of that color. Remote clicking the small arrow is ineffective.
- **Checked HUD:** The bottom row counts successful actions; no-op movement does not fill it. Large controls remain usable after their outlines change.
- **Checked on level 3:** The color-6 control swaps 6↔7 in two complementary 2x2 checker marks (top and bottom), with no geometry change. Their exact transfer rule remains unresolved; do not assume ordinary entry-trigger teleportation independent of polarity.
- **Level 2 lesson:** Disconnected key branches can be mandatory: switch routes, rotate joints, physically collect the key, activate its revealed control, and then traverse to the goal.

# Working memory
- **Level 3, 2/6 complete.** Traveler is x6–7,y16–17 on the top color-6/7 mark. Goal is x32–33,y38–39. Controls: red ~(51,18), blue ~(51,27), color 6 ~(51,36).
- **Current phases (checked):** red is horizontal. Blue alternate phase has top-left x4–7,y20–23 and lower x12–15,y40–43 solid/open, while central-left x8–11,y24–27 and top-right x24–27,y16–19 are checker/closed.
- **Ruled out:** With post-click polarity top=[6,7]/[7,6], entering the top mark did not transfer; pressing UP outward from it was also `[DIFF] none` (log step 112).
- **Revised polarity hypothesis (assumed, geometry-supported):** Before the color-6 click, top=[7,6]/[6,7] placed color 6 at that node's outer corner, while the bottom endpoint lacked color 6 at its outer corner; after the click this relation reverses. Thus the click may have made bottom→top active and disabled top→bottom. Restore the initial polarity, step DOWN off the mark, then re-enter UP to test active-entry transfer. Stop if any prediction fails.
- If transfer succeeds, move UP through the bottom gray node, then UP across the already-open lower blue connector and RIGHT into the magenta arrow key; activate the revealed magenta control, then re-plan the red/magenta route to the goal.
