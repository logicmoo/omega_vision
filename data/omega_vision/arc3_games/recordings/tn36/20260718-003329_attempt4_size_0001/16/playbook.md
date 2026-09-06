# Working model

- **Checked:** The 14-pixel yellow notched shape is the mover; the larger yellow outline is its catcher. The notch points toward the intended route/catcher in levels 1-2.
- **Checked:** A T token has a 3-pixel head and 3-pixel stem; clicking either toggles that whole component `1↔5`. Interpret `(head,stem)` as a 2-bit/base-4 digit: `11=0`, `15=1`, `51=2`, `55=3` (head is the 2-bit, stem the 1-bit).
- **Checked/generalized:** A command column with multiple stacked T tokens is a little-endian base-4 integer: `code = d(top) + 4*d(next) + 16*d(next)...`. Level 1 had one digit. Level 2 has three digits per command.
- **Checked command codes:** `0=STAY`, `1=RIGHT`, `2=LEFT`, `3=DOWN`. Level-1 animations directly established these. Level 2's static worked example has `[51,11,11]`, decoding to 2, alongside a left-notched mover—independent confirmation of `2=LEFT`. The natural next code `4=UP` is represented by `[11,15,11]`.
- **Checked level-2 invalid-code retrodiction:** Runs with first-column stacks `[11,51,11]`, `[51,51,11]`, and `[11,11,51]` decode to 8,10,32 and all produced zero displacement; all-11 decodes to0 and also stays. This exactly explains every failed probe without modifiers or one-hot special cases.
- **Checked:** Clicking the large color-9 mouse body is RUN. It executes command columns left-to-right, highlighting each. Failure restores mover and preserves controls. Direct board/piece clicks do nothing. Each non-RESET action consumes one timer cell at y=1, right-to-left (9→3).
- **Level-1 executable model:** `scratch/tn36_sim.py` exactly retrodicted all 36 pre-solution frames; all five code-3 commands reached the catcher.
- **Level-2 executable/search model:** `scratch/tn36_level2.py` decodes stacked commands and BFSes component toggles. It retrodicts run codes 0,8,10,32 as inert. From the current state, bounded BFS finds five toggles yielding four code-4/UP commands and positions `(3,4),(3,3),(3,2),(3,1)`.

# Working memory

- Level 2, 1/7 complete, step 34. Right playfield is 7x7; mover `(3,5)`, catcher `(3,1)`. Four command columns are centered x=39,44,49,54; digit-row head/stem y pairs are 33/36, 39/42, 45/48. RUN is `(46,58)`.
- Current stacks: column1 `[11,11,51]` (code32), columns2-4 `[11,11,11]` (code0). Timer cells x61..53 are spent.
- BFS shortest setup from current state: click `(39,42)` to make middle digit15, click `(39,45)` to restore bottom digit11, then click middle stems `(44,42),(49,42),(54,42)`. Final stacks all `[11,15,11]`, code4. RUN predicts four UP steps and level completion.
- Bottom-left square icons remain semantically unexplained, but the numeric code model already retrodicts all live evidence and yields a unique shortest route; do not probe them.

[END PLAN]
