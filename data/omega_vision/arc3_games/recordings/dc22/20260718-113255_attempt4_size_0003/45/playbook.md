# Working model
- **Checked movement/objective:** The color-14 traveler is 2x2 and normally moves one 2x2 tile per directional action: ACTION1 up, ACTION2 down, ACTION3 left, ACTION4 right. It traverses contiguous non-background paths, restores underlying colors when leaving, and completes a level by entering the color-11/yellow 2x2 goal.
- **Checked blue/connectors:** A matching large control toggles linked checker paths between solid/open and background-checkerboard/closed. Closed paths block movement; blocked moves have `[DIFF] none` and do not advance the bottom HUD budget.
- **Checked rotating arms:** A matching large control rotates rectangular arms 90° around a fixed joint; a traveler on the fixed joint stays safe.
- **Checked physical keys:** Contact with a small colored arrow embedded in gray consumes it and reveals a matching large control. Remote clicking such a key is ineffective.
- **Checked paired transfer marks:** A color-6 control swaps 6↔7 in two complementary 2x2 marks. If the traveler is parked on either mark, clicking the control transfers it to the other; entry or directional movement alone does not transfer.
- **Checked HUD:** The bottom row counts successful actions; no-op movement does not fill it. Controls can remain usable after outlines change.
- **Level 3 distilled:** Reach the top transfer mark through red/blue phases, click color 6 while parked to reach the lower mark, collect the magenta key through the lower blue gate, open magenta, rotate red vertical, and cross magenta/red to the goal.

# Working memory
- **Level 4 fresh, 3/6 complete.** Traveler is x4–5,y18–19; goal is x30–31,y44–45. Timer is empty. Available: movement and ACTION6.
- **Checked board geometry:** Ordinary 2x2 passability currently forms four disconnected components: (A) start node, a long color-5 bridge at y20, and right gray column x24–27,y18–29; (B) lower-left gray network with color-1 bars and the top 6/7 mark x4–5,y24–25; (C) isolated 4x4 node x16–19,y30–33 with the other 6/7 mark; (D) color-12 bar x16–31,y40–41 and goal node x28–31,y42–45.
- Component B→C is solvable by the checked color-6 transfer control centered ~(52,19). How A→B and C→D connect is unresolved and likely introduces the level's new mechanic.
- The right panel also shows a nonstandard color-11 L-shape x43–49,y25–31 and a gray 6x6 square x54–59,y26–31. They do not match the established 47-cell button shape, so whether either is actionable is unproven; do not click blindly.
- **Next deliberate movement check:** move DOWN from x4,y18 to x4,y20 (known valid), then attempt DOWN toward the single missing tile at y22. Standard movement predicts `[DIFF] none`; an unexpected jump to the top transfer mark would identify a new gap-crossing mechanic. From x4,y20, RIGHT remains available toward the long upper bridge if blocked.
