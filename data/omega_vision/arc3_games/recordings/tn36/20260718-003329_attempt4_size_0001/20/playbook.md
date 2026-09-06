# Working model

- **Checked:** The 14-pixel yellow shape is transformed by a program and must enter/fit the larger yellow catcher. A T has head/stem bits toggled `1↔5`; `(head,stem)` is a base-4 digit `11=0,15=1,51=2,55=3`. A stacked command decodes little-endian: top digit + 4·middle + 16·bottom.
- **Checked program execution:** Color-9 mouse body is RUN; command columns execute left-to-right and are highlighted. Failed runs restore the initial yellow shape and preserve controls. Timer y=1 spends one cell per action.
- **Checked operation codes from complete frame masks:** `0=identity/stay`, `1=translate right`, `2=translate left`, `3=translate down`. Level 1 used only one digit and solved with five code-3/down commands.
- **Checked level-2 transformations:** code8 (`[11,51,11]`) leaves the horizontally symmetric up-notched source visually unchanged; code10 (`[51,51,11]`) rotates its notch clockwise/up→right; code32 (`[11,11,51]`) rotates counterclockwise/up→left. Code4 (`[11,15,11]`) grows nearest-neighbor scale by one each use: four repeated code4 commands produced scale factors 2,3,4,5, clipped by the board. Earlier analysis that tracked only object bbox missed these shape changes; do not call a run inert without comparing masks.
- **Falsified:** Command IDs are not ordered as 4=UP, and the three rows are neither independent direction channels nor simple modifiers. The base-4 decoding remains strongly supported; decoded values select a transformation lookup table.
- **Static worked example:** The left matrix is four code-2 commands (`[51,11,11]`), and its left-notched source is placed so four left translations fit exactly across the panel. This confirms code2=LEFT.
- **Candidate clue interpretation:** Bottom diagrams pair a yellow-at-LEFT box of color9 with a yellow-at-TOP box of color2. Together with the code2 LEFT reference, this likely specifies the substitution `2→9` when rotating LEFT to UP; therefore code9 (`[15,51,11]`) is the strongest UP candidate.
- **Models:** `scratch/tn36_sim.py` exactly models level1. `scratch/tn36_level2.py` correctly decodes control values but its old `4=UP` delta is falsified and must not be used for live plans until updated.

# Working memory

- Level 2, 1/7 complete, step 40. Board mover starts `(3,5)`, catcher `(3,1)`, four commands. Current all four stacks are code4 `[11,15,11]`; failed scaling run restored the source. Timer cells x61..47 are spent.
- **Unexplained:** Exact full operation table; code8 identity vs horizontal reflection; why code10/32 have their particular IDs; exact meaning of the bottom diagrams; boundary behavior. Success requires an UP translation not yet observed.
- **Reachable/unvisited priority:** code9, code16, code5-7, exact code2 on this level, mixed operations, and any translated position above the source. Code9 is uniquely singled out by the visible 2↔9 left/top clue, so test it before inventing another transformation.
- **Next single discriminating run:** Change only column1 from code4 to code9 by toggling top stem `(39,36)`, middle head `(39,39)`, and middle stem `(39,42)`, then RUN. Predict frame1 translates the original 4x4 source one logical cell UP to bbox `(45,20)-(48,23)`; later code4 columns may scale it, but frame1 alone discriminates. If confirmed, convert all columns to9 via searched bit toggles and run.

[END PLAN]
