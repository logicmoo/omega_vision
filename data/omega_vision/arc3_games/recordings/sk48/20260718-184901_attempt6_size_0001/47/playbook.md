# sk48 playbook

## Working model
- **Controls checked:** ACTION1/2 move the active horizontal needle one logical row up/down; ACTION4 extends it one 6-cell slot right, ACTION3 retracts one slot left; ACTION7 undoes. ACTION6 clicks on the level-5 gap and on a bead were complete no-ops, but other click targets remain untested. Row53 is a deadline bar. Bottom panel is the desired threaded bead sequence; hollow centers mark currently correct sequence positions.
- **Horizontal mechanics checked:** H-threaded beads try to translate with R/L. Collisions, left anchor, right wall, and strand pins can block segments. Retracting past a bead sheds it; advancing into a loose bead pushes it if free and pierces it if blocked. Gaps between threaded beads persist.
- **Vertical mechanics checked:** U/D carries H-threaded beads. The full needle span pushes loose/vertical-only beads in the destination row. Vertical strands accept beads only via vertical motion; retracting deposits cross-threaded beads. A blocked span prevents the whole vertical move.
- **Level 4 checked solution concept:** use a bare span to park unwanted/second beads, carry first beads into vertical strand ends and deposit them, then route a short empty span below and push seconds upward beneath firsts. Target is strand order, not a fixed row.

## Working memory
- Level 5 (4/8), step198, one RESET already used—do not RESET this fresh attempt. Terrain/play area has a fixed color-5 gap at logical row3,col3. Reds(8) remain unreachable on row3 cols4-6. Blues(9): two loose on top row cols0-1; one loose on row2 col3. Empty needle is row1 with tip3.
- Target is [red,blue,red]. The gap is absolute under every tested interaction: bare needle cannot enter horizontally (step173) or vertically (177); a threaded blue cannot enter laterally (180) or vertically (183); a loose blue pushed ahead from above was also blocked with zero diff (198). Clicking the gap (178) and a red bead (184) did nothing.
- Topological conclusion (checked conditional): with a permanently left-anchored rigid span, arrows cannot affect anything right of the gap. Therefore a missing anchor-reversal/relocation mechanic or another false core assumption must exist; do not spend more actions retesting gap entry.
- Current next probe: click the active color-6 spool at (7,14). Hypothesis: this is the only likely interactive object and toggles/reverses the needle to a right-side anchor (predicted color6 appears at x53..58 on the same row). If inert, test boundary overrun (extra L at minimum or extra R at maximum) using a deliberate probe.
