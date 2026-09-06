# Working model

- **Checked through level 3:** ACTION1/2/3/4 are up/down/left/right. Selected green pieces move one logical tile = 3 board cells per arrow, restoring exact static terrain beneath them. Color1 is floor; color2/color15 block direct selected movement.
- **Checked through level 2:** Green core0 is selected. ACTION6 on another green core selects it (clicked core ->0; former selected core ->4). Initial inactive cores may be5. Shell clicks are inert.
- **Checked through level 3:** Color4 frames are goals sized two pixels larger than the intended piece bounding box. Levels complete automatically when all movable/passive pieces occupy matching frame interiors; placements do not individually lock.
- **Checked through level 3:** Contacting any occupied edge/arm of an inactive green piece or passive color11 polyomino launches the whole object in the push direction while the selected pusher stays fixed. All observed launches moved exactly five logical tiles/15 cells; inactive core state was preserved and objects could animate through color15. Sparse shape corners can provide a pushing stance even when the bounding box touches a wall.
- **Unresolved extension:** No prior launch ended with a large passive object partially embedded in color15. Level 4 will distinguish strict five-tile landing from continuing until the object clears the barrier; do not assume either after the probe.
- **HUD:** row63 color4 is a level-resetting time/action budget. Avoid no-ops. Frame cells restore color4 when uncovered.

# Working memory

- Level 4 of 7, fresh after step108; budget64. Upper floor is x5..58,y20..37 plus top-right alcove x33..58,y6..19. Lower floor is x5..43,y44..58. Solid barrier x5..43,y38..43 separates them.
- Upper green pieces: selected A center(21,30), inactive/core5 B center(30,33). Passive color11 plus is lower center(24,54), bbox20..28,y50..58.
- Goals: plus interior bbox35..43,y8..16 (center39,12) in top alcove; green goals centered(51,30) upper and (39,54) lower.
- Likely structure: use A to launch B down through the barrier; select B below to manipulate/launch the plus upward; upper A then continues plus handling while the two greens finish one goal per region.
- Current planned probe: move A right3 to (30,30), press down to launch B center(30,33)->(30,48), select B, move it down3/left1 to (27,57) below the plus's right arm, and press up. Strict observed launch rule predicts plus center(24,54)->(24,39), bbox y35..43, while a possible new clear-barrier rule would continue farther upward. Inspect exact frames/settled landing before any continuation.
