# Working model
- **Checked (opening board only):** 64x64, level 1 of 6; available controls are ACTION1–4 and coordinate ACTION6. No timer change has yet been observed.
- **Checked geometry:** playfield is bounded by rows 0–9 and 54–62; left and right backgrounds meet at x=32/33 with a dashed color-0 divider. Right-side outlined targets are color 8 at bbox (42,17)–(54,21) and color 9 at (42,34)–(54,38).
- **Checked geometry:** left-side assemblies include (a) a color-2 6x6 body at x22–27,y18–23 with color-11 2x2 core and color-9 4x4 extension to its left; (b) a color-2/14 body around x8–13,y38–43 connected visually upward to a horizontal color-8/13 assembly at y30–33.
- **Assumed, not tested:** color 8/9 extensions correspond to the same-color right targets; one assembly is a controllable avatar/cannon. Conventional mapping may be ACTION1=up, ACTION2=down, ACTION3=left, ACTION4=right. ACTION6 may select or aim/fire. Do not build a multi-step solution on this yet.

# Working memory
- Level 1, initial state (step 0), 0/6 complete. Candidate controllable green-cored body is centered near (10.5,40.5); yellow-cored body is near (24.5,20.5).
- Next: one deliberate ACTION1 probe. Hypothesis: it is Up and will move/reorient the green-cored assembly upward; inspect settled diff and animation before any further action.
- Ruled out: nothing yet.
