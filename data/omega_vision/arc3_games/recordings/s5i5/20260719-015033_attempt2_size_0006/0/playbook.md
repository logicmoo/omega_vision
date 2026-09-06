# Working model

- **[Checked, level 1]** Only `ACTION6` is exposed. Matching bordered panels are controls for 3-cell-thick telescoping bars. Clicking the panel button on the extension side keeps the gray cap/base fixed, adds one 3×3 body unit away from that cap, changes the old magenta center to body color, and advances the active magenta center by 3 cells. Level 1 confirmed rightward green and downward yellow extension; opposite-side buttons are very likely retraction but remain untested.
- **[Checked, level 1]** Objective: bring every active magenta center to the blank center of a collinear hollow magenta cross. On contact, the incoming unit fills the four background corners, the center becomes magenta, and the four existing magenta arms remain, making a solid plus. The level changes when all targets are docked.
- **[Checked]** Bottom row is a per-level action-budget bar, not gameplay. It resets on level transition and fills color 4 from the right at roughly 1–2 cells/action.
- **[Strong level-2 inference, awaiting one probe]** Multiple differently colored actuators can be serially linked. A non-head actuator should extend by inserting a 3×3 unit and translating every downstream actuator/head by 3 in its cap-defined direction. Level-2 static geometry is exactly a four-link chain and its obstacle layout has a unique-looking routing solution under this model.

# Working memory

- Level 2/8 began at global step 13; fresh HUD. One four-link chain starts near x=9..17,y=36..41, with hollow target center (52,31). From base to head, cap-defined extension directions are:
  1. color 12/blue: east; cap x=9, downstream starts east of it;
  2. color 10: north; gray cap y=41;
  3. color 11/yellow: east; gray cap x=12 (translated by upstream links);
  4. color 14/green head: south; gray cap y=36; active center initially (16,37).
  Four horizontal control panels at y=54..60 correspond left-to-right to colors 12,10,11,14. As in level 1, their right/second glyph should extend; representative colored click cells are (12,56), (27,56), (42,56), (57,56).
- Obstacles (color 15): roof x=33..56,y=9..11; left vertical x=33..35,y=9..26; right vertical x=42..44,y=15..44. They create a 3-row passage y=12..14 and 6-column riser x=36..41.
- Derived candidate solution under serial-link mechanics: extend blue east 8, actuator-10 north 8, yellow east 4, then green south 6. This moves head `(16,37) + (24,0) + (0,-24) + (12,0) + (0,18) = (52,31)`. Order matters: blue×8 first parks later links at x=36..41 below the walls; blue×9 would collide with the right wall. Raising next places yellow in y=12..14, then it crosses over the right wall, and green descends on its right. Total 26, within budget.
- Next deliberate probe: click blue right glyph (12,56). Prediction: blue inserts x=12..14,y=39..41; the other three links and head shift +3 x, moving magenta (16,37)→(19,37). If confirmed, batch the remaining seven blue extensions only as far as the computed safe x=36..41 configuration.
- Ruled out this level: no live probes yet. Do not commit the 26-action route until serial downstream translation is confirmed.
