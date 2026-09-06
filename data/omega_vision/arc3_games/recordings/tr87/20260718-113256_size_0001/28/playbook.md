# Working model

- **Checked board/controls:** Six cyan→pink training pairs occupy the top (IDs 0..5 row-major). Five lower cyan tiles are fixed; five lower pink tiles are editable with a bracket cursor. ACTION3/ACTION4 move left/right. ACTION1 advances the selected pink through a global option cycle; ACTION2 reverses it.
- **Checked lower cyan recognition:** Shapes are recognized up to D4; level-1 lower cyan IDs are `[3,4,0,1,2]`.
- **Checked option-cycle edges only (do not assume cycle length):** ACTION1 edges observed or exactly reversed from ACTION2 are `B4 -> B2 -> B5 -> B0 -> B1 -> U`, where `U` is the 17-cell decoy mask `#####/#...#/#####/.#.#./.###.` that is not a D4 copy of any training pink. ACTION2 gives the reverse edges. Earlier claiming a six-state cycle `U->B4` was unsupported: that edge has never been observed.
- **Current best objective hypothesis:** Choose the paired training-pink identity for each lower cyan, ignoring presentation rotation. Four target identities can be made exact D4 matches. The only apparent failure came from incorrectly treating decoy U as B3. Crucially, actual training pink B3 has never appeared in any observed lower state. The most economical completion of the option cycle is `... B1 -> U -> B3 -> B4 ...`, i.e. seven options (six answers plus one decoy). This is a one-step hypothesis to test, not yet checked.
- **Falsified:** black-cell count as target; six-option assumption; commit-on-cursor-departure (step 27 merely moved the cursor); ACTION1 as rigid rotation.
- **HUD:** y=63 fills color 4 from right to left every two actions (~128-action timer).

# Working memory

- Level 1/6 after step 27; cursor moved from column 0 to column 1. Current lower pink states are `[U,B4,B0,B1,B2]`; columns 1..4 exactly match paired targets, while col0 needs actual B3.
- All history is consistent with a seven-state cycle `B4→B2→B5→B0→B1→U→B3→B4`; only `U→B3` and `B3→B4` remain unobserved.
- Next discriminating plan: ACTION3 back to col0, then ACTION1. Predict U changes to actual B3 and level 1 completes. If instead it becomes B4 or another state with level 0, the dictionary objective is falsified; identify the new mask and re-derive rather than adding another commit rule.
