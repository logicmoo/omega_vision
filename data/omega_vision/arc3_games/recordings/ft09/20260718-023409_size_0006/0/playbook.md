# Working model
- **Checked from step 0:** The board has four 3×3 panels. In each of the three unbordered reference panels, the eight large outer tiles are colors 8/9, and the center tile contains a 3×3 micro-map: micro-color 0 corresponds exactly to an outer color-8 tile, while micro-color 2 corresponds exactly to an outer color-9 tile. This relation holds at every one of the 24 reference positions.
- **Strongly supported inference, not yet live-tested:** The bordered bottom-right panel is the active puzzle. Its outer tiles start color 9; click outer tiles with ACTION6 to toggle/paint them so they match the center micro-map. Avoid the center and border. A full-width color-12 row at y=63 is likely a move/timer HUD.
- **Objective hypothesis:** Make all eight outer tiles of the active panel match its center micro-map; completing it should advance the level. This better fits all three references than treating the top pair as an analogy transformation.

# Working memory
- Level 1, 0/6 completed; only ACTION6 is available.
- Active outer tile origins are x={36,44,52}, y={36,44,52}, each 6×6. Current outer tiles are all 9. Center clue at x=44..49,y=44..49 encodes desired outer pattern `8 9 9 / 8 C 8 / 8 9 9`.
- Therefore intended changed tiles are top-left (36..41,36..41), middle-left (36..41,44..49), middle-right (52..57,44..49), and bottom-left (36..41,52..57).
- Next step is one deliberate control probe: click (38,38), predicting that top-left active tile becomes color 8. If confirmed, click the remaining three target tiles in a batch.
- Ruled out from static evidence: outside model's proposed red plus is not the bottom-right clue; the reference-center micro-maps exactly encode each panel's own outer pattern.
