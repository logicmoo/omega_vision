# Working model

- **Checked (step 0):** Board is 64x64 with background color 10. A 32-cell color-4 strip at `(16..47,0)` is probably the action budget/HUD, not a piece.
- **Checked (step 0):** One candidate movable assembly occupies `x=11..25,y=11..28`: color 0 body (135 pixels) plus two 3x3 color-8 contacts at `x=14..16` and `20..22`, `y=26..28`. On the 3x logical lattice its body/contact pattern is 5 columns x 6 rows.
- **Checked (step 0):** A likely fixed target occupies `x=38..49,y=29..49`: a color-14 hollow frame at `x=41..49` plus two 3x3 color-8 contacts at `x=38..40,y=35..37` and `y=41..43`.
- **Assumed, not yet tested:** ACTION1/2/3/4 are up/down/left/right, likely translating the color-0+8 assembly by one 3-pixel logical cell; ACTION5 likely rotates it; ACTION6 may select/click. The likely objective is to rotate/move the assembly so its two color-8 contacts mate with the target contacts. Do not build a long plan until controls and exact goal geometry are observed.

# Working memory

- Level 1 of 6, fresh attempt at step 0. Movable candidate bbox `11..25,11..28`; target bbox `38..49,29..49`; budget strip length 32.
- Next probe: ACTION4 under the standard right-control hypothesis. Predict the whole movable assembly shifts exactly +3 x: e.g. old body cell `(11,11)` becomes background and `(14,11)` remains/becomes body. If not, re-derive mapping/selection from the resulting diff rather than repeating.
- Ruled out: nothing yet.
