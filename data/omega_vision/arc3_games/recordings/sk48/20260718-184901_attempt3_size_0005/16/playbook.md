# sk48 playbook

## Working model
- **Checked through level 2:** Ordered retractable-chain collector on a 6-pixel logical grid. Bottom-panel colors give the required order; hollow centers mark currently secured colors. ACTION1/ACTION2 move the horizontal assembly up/down, ACTION4 extends/moves right, ACTION3 retracts/pulls left, ACTION7 undoes.
- **Checked ordinary free-target behavior (levels 1-2):** Once a target is securely on the horizontal chain, horizontal motion pulls/pushes the contiguous colored suffix. The assembly spans logical columns `0..t`; vertical motion pushes destination-row targets at columns `<=t` one row in the move direction. Targets outside that interval remain.
- **Level-3 added mechanic, visually checked:** All four targets begin threaded on a second, vertical 2/3-patterned line at col3, anchored by color11 above the room. This constraint was absent in levels 1-2 and invalidates the prior ordinary-block simulator.
- **Checked level-3 crossing behavior (steps 56-61):** A bare horizontal cable can cross a vertically threaded target without moving it. Crossing a wrong-order target only adds pass-through connectors and the cable can continue beyond it. Crossing next-required red hollowed red's panel marker while red stayed at the intersection.
- **Checked correction (step 62):** ACTION3 immediately after that crossing did **not** pull red left: it removed red's horizontal connectors and refilled its panel marker, leaving red on the vertical line. Thus crossing a required bead is only temporary while it remains constrained on the vertical strand; the old `k=1` pull model and its claimed 30-action optimum are falsified.
- **Current transfer hypothesis, not yet checked:** Keep red cross-threaded and move the horizontal assembly down. It should slide red down one row while pushing color12 from row3 to row4. Once red reaches the former bottom position of the vertical strand and color12 is below it, ACTION3 may pull red left permanently instead of merely unthreading it. This is the next discriminating probe.
- **HUD:** y=53 is a loose step budget; the thin strip beside the magenta anchor is its rail.

## Working memory
- Level 3, 2/8. Targets/order: green14 row0 col3, blue9 row1 col3, red8 row2 col3, color12 row3 col3; order red8, color12, blue9, green14.
- Current step62: red was just unthreaded by ACTION3; all targets are back at their original cells, all panel markers solid, horizontal assembly row2 with terminal just left of red (`t=2`).
- Next: ACTION7 should restore step61's cross-threaded red and hollow panel. ACTION2 should move red to row3 and push color12 to row4. Then probe ACTION3: predict red pulls left to col2 and remains hollow if reaching the bottom/free portion releases it; if red instead stays and refills, derive the vertical-strand transfer rule from that failure rather than extending the old model.
