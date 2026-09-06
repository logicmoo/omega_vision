# Working model

- **Checked (step 0):** Board is 64x64. Color 2 is the surrounding background; traversable-looking color-1 areas are two 15x21 rooms (left x=9..23, right x=39..53) plus a 9x3 corridor x=24..32,y=30..32. A solid color-15 barrier occupies x=33..38,y=21..41 between them.
- **Checked (step 0):** Two identical color-14 hollow 3x3 pieces are centered at (19,31) and (28,31). Their center cells differ: (19,31)=0 and (28,31)=5. Two color-4 hollow 5x5 frames, plausible goals, are centered at (13,34) and (46,28).
- **Checked (step 0):** ACTION1-4 and coordinate ACTION6 are available. Their semantics are not yet established.
- **Checked / likely HUD:** row y=63 is entirely color 4 and disconnected from the scene; treat it as a probable action/time budget, not a piece.
- **Assumed, untested:** Center color 5 marks the selected/active color-14 piece, center 0 an inactive piece; ACTION6 on a piece changes selection; ACTION1-4 then move the selected piece. The likely objective is to put the two 3x3 pieces into the two 5x5 frames, with doing so somehow handling/opening the barrier. Do not build a move sequence until selection and controls are verified.

# Working memory

- Level 1 of 7, initial state. Piece centers: inactive-looking (19,31), active-looking (28,31). Goal-frame centers: (13,34), (46,28). Barrier x=33..38.
- Next deliberate probe: click (19,31). Hypothesis: ACTION6 selects that piece, changing (19,31) 0->5 and (28,31) 5->0 (apart from possible HUD change). If this fails, re-derive click/center semantics rather than moving blindly.
- No actions beyond RESET have yet been tried.
