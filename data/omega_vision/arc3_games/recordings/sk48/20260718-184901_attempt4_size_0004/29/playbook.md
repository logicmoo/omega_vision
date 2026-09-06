# sk48 playbook

## Working model
- Controls: ACTION1/2 move horizontal assembly vertically; ACTION4 extends/shifts right; ACTION3 retracts/pulls left; ACTION7 undoes. Bottom panel gives per-anchor sequences; y53 is budget.
- Level 3 established cross-thread transfer: a bead can be on horizontal and fixed vertical strands simultaneously. Pulling while pinned peels/unthreads; moving beyond a strand end changes whether the target remains credited according to its destination.
- Level 4: vertical destination strands at cols2(anchor10) and4(anchor11), patterned rows0-2. Initial horizontal chain [blue,green,red,C]. Panel wants anchor10:[blue,green], anchor11:[red,C]. Offset +2 aligns first blue/red.
- Checked crossing: entering row2 at offset+2 moved intact chain and hollowed blue/red. Markers remain while chain stays on patterned rows. Extra U at top is no-op; D simply carries intact chain.
- Checked pinned peeling at row0: L first removes C's horizontal connectors but C stays; next L removes red's horizontal connectors. Red stays on vertical strand and remains hollow, so peeling a credited destination bead deposits it permanently. This leaves active horizontal prefix blue-green and loose C beside deposited red.
- Corrected boundary result (step115): carrying intact cross-threaded chain down from row2 to row3 immediately refilled blue/red markers. Thus simply exiting the bottom does NOT preserve level-4 destination credit; the proposed bottom-shift route is falsified.

## Working memory
- Level4, 3/8, current step115: intact four-block chain is row3 cols2-5, below strand ends; all panel markers are solid. The planned L was not executed because exit refilled first markers.
- Recover known deposited-red state for a rethreading test: ACTION7 three times returns intact top row0 with blue/red hollow; L twice peels C then deposits red, reproducing step110. Then one R is the probe.
- Probe hypothesis: active prefix blue-green ends at col3 immediately left of deposited red col4; R against the strand-stopped red should rethread red onto the horizontal cable (restore connectors x35/x40) without translating blocks. This tests whether deposited beads can be deliberately re-added so their following bead can be processed after the prerequisite is credited. If R is a no-op or translates, stop and inspect.
