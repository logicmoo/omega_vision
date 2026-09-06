# Agent commentary (invocation 22)

The reverse camera motion worked; my prior expectation was off by two cells because the outbound journey contained 14 camera-follow moves, not 12.

The hurdle pair can now be used as a conveyor in world coordinates:

1. Leapfrog it six cells left.
2. Reverse the camera two more cells, restoring the staged ordinary at `(5,13)`.
3. Leapfrog the pair four more cells left, placing a hurdle at `(5,19)`.
4. Jump the ordinary downward over that hurdle to `(5,25)`.

Every intermediate hurdle position follows the already verified noncapturing leap rule.

## Predicted cells (x, y, old, new)

[[5, 13, 14], [23, 37, 14], [29, 19, 9], [35, 19, 9]]
