# Working model

- **[Checked, levels 1–2]** `ACTION6` clicks paired colored control panels for 3-cell-thick telescoping actuators. The second/right (or lower) glyph extends one 3×3 unit away from the actuator's gray cap; its fixed cap stays put. Extension shifts every recursively downstream touching link/head by 3 and inserts body color. An active magenta center shifts with the head.
- **[Checked, levels 1–2]** Objective is to bring each active magenta center into a hollow magenta-cross center. Contact fills the four background corners and center while preserving the four arms, yielding a solid plus; all heads docked completes the level.
- **[Checked, level 2]** Serial-link motion is recursive across differently oriented links. Obstacles of color 15 were avoided and behave as fixed barriers for planning.
- **[Strong inference, level 3]** The first/opposite glyph retracts one previously extended unit, pulling all downstream objects 3 toward the cap and erasing the far body unit. This is not yet live-tested. Long actuators' body lengths encode how many retractable units they contain.
- **[Strong inference, level 3]** Color-1 rectangles are movable blocks/walls (contrasting with fixed color-15) and should be pushable/pullable as downstream objects. A one-action probe is required before relying on this.
- The bottom row is an action-budget HUD; ignore its color-4 changes when evaluating mechanics.

# Working memory

- Level 3/8 began at global step 39. Two active heads and targets:
  - color 10 horizontal head: gray west cap x=6, active center (7,28), target center (43,28): eventually 12 east extensions if its route is clear.
  - color 7 vertical head: gray north cap y=3, active center (49,4), target center (49,28): eventually 8 south extensions if clear.
  - fixed color-15 block x=45..47,y=27..29 separates the two target crosses centered (43,28) and (49,28).
- Two movable color-1 blockers currently obstruct those direct paths: horizontal wall H=x27..50,y15..17, and vertical wall W=x36..38,y21..38.
- Auxiliary chain R→E→H: color-9/R is a minimum west-extending link at x30..32,y36..38; color-8/E is a north actuator x27..29,y18..38 with south cap and 6 pre-existing extensions; H touches its top. Controls: E panel top-left, clicks left/right around (10,47)/(16,47); R panel bottom-left, (10,56)/(16,56).
- Auxiliary chain N→B→W: color-14/N is a minimum north link x54..56,y24..26; color-12/B is a west actuator x39..56,y21..23 with east cap and 5 pre-existing extensions; W touches its left. Controls: B top-right (48,47)/(54,47); N bottom-right (48,56)/(54,56).
- Active controls: color-10 top-middle right/extend (35,47); color-7 bottom-middle right/extend (35,56).
- Candidate routing if movable-wall and retraction models hold: retract B once (moves W x36..38→39..41, still clear of targets), extend R to total 4 (moves E/H left; H ends x15..38 adjacent to W), extend N 4 (raises B/W so W ends y9..26), retract B 4 more (W→x51..53 and B shrinks clear of vertical-head columns), retract E 5 (pulls H down to y30..32 and shrinks E to y33..38). Then both head paths are clear; extend color10 east 12 and color7 south 8. Estimated 38 actions.
- Next deliberate probe (also useful): extend R once via (16,56). Predict R inserts at x27..29,y36..38 and recursively shifts E plus H left 3: E→x24..26, H→x24..47, so (48,15) clears. If H does not shift, discard the movable-downstream model and re-derive before further actions.
