# Working model

- **Checked board structure:** Six cyan→pink training pairs occupy the top, numbered row-major B0..B5 on the pink side. The lower task has five fixed cyan glyphs above five editable pink glyphs and a white bracket cursor. Lower cyan identity is recognized up to D4 rotation/reflection; level-1 cyan IDs are `[3,4,0,1,2]`.
- **Checked controls:** ACTION4 moves cursor right one column; ACTION3 moves it left. ACTION1 cycles the selected lower pink forward through a fixed permutation of the six training-pink identities; ACTION2 is the exact reverse.
- **Checked option cycle from all recorded transitions:** ACTION1 order is `B4 -> B2 -> B5 -> B0 -> B1 -> B3 -> B4`. ACTION2 traverses it backward. This retrodicts every edit through step 18. Candidate presentation may rotate or deform: level-1's initial B3 mask is not a D4 copy of top B3, but its identity is fixed by the transitions `B1 --A1--> B3 --A1--> B4` (observed in reverse at column 3). Track cycle identity, not black count or exact pixels.
- **Strongly supported objective, pending first completion:** Set each lower pink identity to the training pink paired with the lower cyan identity; orientation/presentation is irrelevant. Thus target pink IDs equal the lower cyan IDs. The earlier black-count objective was **falsified**: step 18 had all proposed target counts `[15,19,16,15,14]` but did not complete. Do not revive it.
- **Checked HUD:** y=63 fills color 4 from right to left by one cell every two actions (~128-action timer), independent of gameplay success.

# Working memory

- Level 1/6 after step 18; cursor is at column 4. Target IDs are `[3,4,0,1,2]`.
- Retrodicting edit history through the checked cycle gives current IDs `[5,4,0,0,2]`: columns 1,2,4 are correct; only col0 B5→B3 and col3 B0→B1 remain.
- Shortest corrections: at col3 ACTION1 once (`B0→B1`); at col0 either direction costs 3, choose ACTION1×3 (`B5→B0→B1→B3`). From cursor col4, shortest known route is left to col3, fix, then left three times to col0, fix: `A3,A1,A3,A3,A3,A1,A1,A1` (8 actions), expecting level count 1.
- Ruled out: black-cell count as target; ACTION1 as geometric rotation; cycle in training spatial order; requiring exact D4 presentation for every pink candidate.
