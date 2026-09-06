# Working model

- **[Checked]** The game requires 7 levels. Input is only `ACTION6(x,y)`. The top row is a per-attempt click-budget bar: each ordinary click consumes one color-9 cell from right to left; do not treat it as gameplay.
- **[Checked, level 1]** The checkerboard contains a movable color-11 plug and a complementary color-11 socket. The objective is to route the plug into the socket so their shapes form a solid rectangle.
- **[Checked]** Movement is programmed with two-part controls. Each has an independently clickable 3-pixel horizontal cap and 3-pixel vertical stem; clicking either toggles its color `1 <-> 5`. A color-9 disk connected below the controls is the launch button.
- **[Checked]** Launch scans commands in display order, highlighting each control in color 9 and moving the plug one 4-pixel checker cell per command. A failed path restores the plug but preserves programmed bits. Reaching the complementary socket completes the level; successful level-1 frames showed the plug combining with it.
- **[Checked codes]** Pair `(cap,stem)=(5,5)` means DOWN and `(5,1)` means LEFT. **[Strongly supported]** `(1,5)` means RIGHT and `(1,1)` means UP: this is the natural remaining two-bit direction code; level 1's UP attempts appeared stationary because the plug began against its top margin. Verify against the first unobstructed use, not by wasteful re-probing.
- **[Checked]** Both cap and stem are independently editable. Plan a shortest command path first, toggle only differing bits, then launch. Controls after the point where the plug reaches the socket should be irrelevant, but this early-termination behavior is not yet checked.

# Working memory

- Level 1 completed at step 15 by setting five controls to `(5,5)` and launching: the plug moved DOWN five cells into its aligned socket.
- Level 2 initial board (step 15): current puzzle is on the right, checkerboard x=33..60,y=4..31 (7x7 cells). A downward-opening socket is at bbox x=44..49,y=7..11; its complementary plug is at x=45..48,y=24..27. Translating the plug UP by 16 pixels (4 cells) fills the socket exactly.
- The right control bank has 12 commands in a 3-row by 4-column layout, all initially `(1,1)`, and the launch disk is centered near (46,58). Under the supported code these are UP commands; the first four should move the plug into the socket and finish immediately.
- Next action: click right launch disk at (46,58), predicting four visible UP moves and level count 2. This simultaneously verifies unobstructed `(1,1)=UP` and early success before unused commands.
- A large colored area and another prefilled control bank on the left appear to be auxiliary/example/opponent UI; do not touch them unless the right launch disproves the current model.
- Ruled out in level 1: direct clicks on source/target; all stems 1; leaving initial pairs unchanged.
