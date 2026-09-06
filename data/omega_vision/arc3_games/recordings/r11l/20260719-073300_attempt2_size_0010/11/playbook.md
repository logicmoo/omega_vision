# Working model
- **Checked:** The only control is `ACTION6(x,y)`. Each tethered system consists of one colored central player (5×5 blob with a color-6 core), several endpoint blobs, and color-1 straight tethers. A dotted ring matching the player's body color is its goal.
- **Checked by level 1 transformations and level 2 geometry:** A system's player core is at the coordinate-wise floor of the arithmetic mean of all of that system's endpoint centers. Level 1 had 2 endpoints; level 2 demonstrates both a 3-endpoint system and a 2-endpoint system. Moving one endpoint changes only its system's mean.
- **Checked:** Exactly one endpoint globally has a color-0 (white) body and is active. An ordinary field click relocates that active endpoint center exactly to the clicked coordinate, with no short range limit; all tethers and the player are recomputed. It does not cut a tether and does not choose the nearest endpoint.
- **Checked:** Clicking the body of an inactive color-3 endpoint selects it: that endpoint's body changes 3→0 and the formerly active endpoint changes 0→3, with all coordinates unchanged. A following field click moves the newly active endpoint.
- **Checked on level 1:** Putting the player core at its matching ring center completes that goal/level. Level 1 was solved by selecting each needed endpoint and choosing positions whose mean was the ring center.
- **Strongly supported:** On levels with multiple colored players/rings, every player must be put in its matching ring before the level completes.
- **Checked:** Color 2 is irregular wall terrain. The x=0 strip is a per-level action timer: one cell changes 0→5 per action and it is not gameplay.
- **Assumed from level-2 layout, not yet collision-tested:** Large color-10 regions are additional forbidden terrain. Plans conservatively keep endpoint/player bodies and every tether segment off both colors 2 and 10. Do not intentionally collide merely to test this.

# Working memory
- Level 2 begins after step 5; counter 1/6 and fresh timer.
- System C12: active E0=`(17,6)`, inactive E1=`(49,9)`, inactive E2=`(8,21)`, player=`floor((E0+E1+E2)/3)=(24,12)`, target ring center T12=`(40,51)`.
- System C15: inactive F0=`(45,35)`, inactive F1=`(54,48)`, player=`(49,41)`, target T15=`(57,18)`.
- Obstacles form a barrier across the middle and a right-side block. Conservative geometry checks use endpoint/player 5×5 shapes plus straight tether rasterization against colors 2 and 10.
- Immediate plan (checked geometrically): solve C15 first to clear its assembly from the lower-right corridor. Select F1 at `(54,48)` by clicking body cell `(54,46)`, move it to `(60,11)` → player `(52,23)`; select F0 via body `(45,33)`, move it to `(54,25)` → exact target `(57,18)`. Every intermediate body/tether is clear of colors 2/10.
- Computed safe route for C12 after C15 is cleared (do not launch until current plan confirms C15 behavior): select E0; move E0 `(45,29)` → C `(34,19)`; select E2 and move it `(27,61)` → C `(40,33)`; then reselect/move E0 and move E1 to a final triple averaging `(40,51)`. Final/intermediate endpoint choices still need to be chosen to avoid overlap with whatever solved C15 leaves behind.
