#const n = 8.

scacchiera(1..n).

{queen(R,C)} :- scacchiera(R), scacchiera(C).

:- {queen(R,C)} != 8.

:- queen(R,C1), queen(R,C2), C1 != C2.
:- queen(R1,C), queen(R2,C), R1 != R2.

:- queen(R1,C1), queen(R2, C2), R1 != R2, C1 != C2, R1 + C1 = R2 + C2.
:- queen(R1,C1), queen(R2, C2), R1 != R2, C1 != C2, R1 - C1 = R2 - C2.

#show queen/2.