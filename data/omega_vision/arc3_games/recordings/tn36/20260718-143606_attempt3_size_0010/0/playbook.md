# Working model

- **[Checked]** The game requires 7 levels and uses only `ACTION6(x,y)`. The top color-9 line is a click-budget bar; each action consumes one cell from its right edge.
- **[Checked]** Each checkerboard puzzle has two complementary color-11 shapes. Route the movable smaller shape into the socket so they combine into a solid rectangle. Obstacles can constrain the shortest path. Movement is in 4-pixel checker cells.
- **[Checked]** Editable controls below the checkerboard are command columns. Each column contains one or more cap/stem pairs; each cap and stem toggles independently between colors 1 and 5. The connected color-9 disk launches: columns are evaluated left-to-right, one movement/time step per column. A failed program resets the shape but preserves bits; successful composition advances the level.
- **[Checked]** In multi-row levels, the entire vertical column is one direction code. Do not interpret pair rows independently: isolated partial codes can cause odd displacements. Set each column to a full demonstrated code.
- **[Checked direction codes]** Full 3-row column codes, listed top/middle/bottom as `(cap,stem)`: NO-OP=`[(1,1),(1,1),(1,1)]`; LEFT=`[(5,1),(1,1),(1,1)]`; DOWN=`[(5,5),(1,1),(1,1)]`; UP=`[(5,1),(1,1),(1,5)]`. RIGHT is not yet recorded.
- **[Checked example UI]** Square characters at bottom-left are direction selectors, identified by a yellow patch on their top/bottom/left/right side. Clicking one updates and executes the locked left example program for that direction. Read its resulting full column code, then copy that code to desired editable time columns. This is the intended way to obtain unknown direction codes.

# Working memory

- Level 2 completed at step 39 by copying the demonstrated UP code into all four editable columns; the lower plug moved UP4 into its socket.
- Level 3 initial board: 7x7 checkerboard x=33..60,y=4..31. Movable UP-facing plug starts at logical cell `(col=1,row=4)` (bbox x37..40,y20..23). Its target placement is `(5,2)` (x53..56,y12..15), inside the socket bbox x52..57,y11..15.
- A color-6 vertical wall occupies col3 at rows0-2 and4-6, leaving only row3 open. Therefore a shortest six-command route is `UP, RIGHT, RIGHT, RIGHT, RIGHT, UP` (or equivalent with the wall constraint). The editable bank has exactly six columns centered x=`[34,39,44,49,54,59]`, all initially NO-OP; launch disk is near (57,58).
- Four direction-selector characters are visible at approximate centers x=`[5,15,25,35]`, with yellow patches DOWN, UP, LEFT, RIGHT respectively. Current locked example shows DOWN. Next click the RIGHT selector at (35,58), predicting a four-step rightward demonstration and a readable RIGHT code. Then program columns 1 and 6 with known UP and columns 2-5 with the newly read RIGHT code.
