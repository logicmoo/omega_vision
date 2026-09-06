# Working model

- **[Checked, initial board]** The run has 6 levels; level 1 starts with actions ACTION1–ACTION4 and coordinate click ACTION6 available.
- **[Checked visually against cells, function still assumed]** Bottom-left is a cross/D-pad panel: purple 2x2 pads centered near N=(15.5,51.5), W=(12.5,54.5), E=(18.5,54.5), S=(15.5,57.5). Clicking these is the cheapest way to test known spatial directions before mapping ACTION1–ACTION4.
- **[Checked geometry, function assumed]** The main object is at x=12..42, y=17..22: cyan/blue left block, gray asymmetric horizontal body, and blue/cyan right cap. It may be a movable key/rod; the outside model's claim that it should reach the right edge is not yet established.
- **[Checked geometry, interpretation unknown]** Bottom-right is a framed 3x3 status/puzzle display with gray cells in an X pattern (corners + center) and black cardinal cells.
- **[Checked geometry, interpretation unknown]** x=62..63 is a full-height bright-green strip. Because it hugs the entire border it may be a budget/timer rather than a goal; do not infer success from it until step diffs show its behavior.

# Working memory

- Level 1, fresh state (step 0), 0/6 complete. No controls have yet been tested.
- Deliberate first probe: click the east purple D-pad at (18,54). Hypothesis: it commands the main key/rod right; if movement/extension is 1–2 board cells, newly occupied cell (43,19) should be cyan (10). Inspect the full diff and animation after the probe before planning further.
- Ruled out: nothing yet.
