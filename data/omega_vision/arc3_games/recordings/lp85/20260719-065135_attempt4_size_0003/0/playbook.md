# Working model

- **[Checked through level 3]** Only `ACTION6(x,y)` is used. Arrow buttons rotate their associated closed track by one slot. A spatial left/up arrow shifts along the track in that direction; right/down shifts oppositely. Tracks may be drawn as rectangles/rounded loops or straight slot sequences.
- **[Checked through level 3]** Tracks can intersect at shared slots. Rotating a selected track permutes all of its tiles, including intersection slots, while other slots remain fixed; special tiles transfer between tracks at intersections.
- **[Checked through level 3]** Each special tile must occupy the corner-marked slot of the *same color*. Level 3 confirmed distinct color-11 and color-12 tokens are not interchangeable.
- **[Checked]** The full-height `x=0` strip is a level-resetting action budget with level-dependent rate; short top marks are progress (now 3/8). Ignore both as pieces.
- **[Method]** Ordinary colors do not affect the goal. Infer each track as an ordered coordinate cycle, then BFS only the ordered positions of special tiles. Preserve token identity when marker colors differ.
- **[Strong level-4 structural inference, untested]** A single logical track can be rendered as two separated five-slot segments with duplicate arrow controls around both segments. The exact 36 level-4 tile slots equal the union of four inferred 10-cycles below; this connectivity is necessary for the target placement but must be verified by the first move.

# Working memory

- Level 4, 3/8 complete, fresh board at step 29. Special tokens: color11 `(39,15)`, color12 `(15,48)`. Matching targets: color11 `(45,45)`, color12 `(51,45)`.
- Inferred 10-slot cycles, each ordered in increasing screen coordinate across a large visual gap:
  - `HT`: `[(x,15) for x in 9,12,15,18,21,39,42,45,48,51]` (top horizontal). Left controls `(6,16),(36,16)`; right controls `(25,16),(55,16)`.
  - `HB`: same x list at `y=45`. Left controls `(6,46),(36,46)`; right controls `(25,46),(55,46)`.
  - `VL`: `[(15,y) for y in 9,12,15,18,21,39,42,45,48,51]`. Up controls `(16,6),(16,36)`; down controls `(16,25),(16,55)`.
  - `VR`: same y list at `x=45`, with up `(46,6),(46,36)` and down `(46,25),(46,55)`.
  - Intersections are the four centers `(15,15),(45,15),(15,45),(45,45)`.
- Ordered-token BFS under these four ±1 cycles gives optimal distance 11. Simple phase plan: `HT+×2` puts color11 at top-right intersection `(45,15)`; `VL-×1` puts color12 at bottom-left intersection `(15,45)`; `HB-×3` wraps color12 left to target `(51,45)`; `VR-×5` wraps color11 upward to target `(45,45)`. These phases may be interleaved.
- Next optimal probe: click top row's rightmost right arrow `(55,16)`. Predicted global `HT+`: color11 `(39,15)→(42,15)` **and** opposite left segment changes `(9,15):1→15`, proving both separated segments form one 10-cycle. If confirmed, commit the remaining 10 moves.
- Ruled out: none on level 4 yet. Eight independent five-slot cross arms would make the displayed cross-quadrant targets unreachable, whereas four global 10-cycles explain all 36 slots and token routes exactly.
