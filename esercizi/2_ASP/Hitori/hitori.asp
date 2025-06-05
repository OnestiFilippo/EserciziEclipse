{nero(R,C)} :- schema(R,C,V).

% Due celle nere non confinano in verticale o orizzontale
:- schema(R1,C,_), schema(R2,C,_), vicineR(R1,R2,C), nero(R1,C), nero(R2,C).
:- schema(R,C1,_), schema(R,C2,_), vicineC(C1,C2,R), nero(R,C1), nero(R,C2).

% In ogni riga o colonna, non compre due volte lo stesso numero
:-schema(R,C1,V), schema(R,C2,V), C1 != C2, not nero(R,C1), not nero(R,C2).
:-schema(R1,C,V), schema(R2,C,V), R1 != R2, not nero(R1,C), not nero(R2,C).

% Le celle bianche sono tutte connesse (; = sono in OR)
bianco(R,C) :- schema(R,C,_), not nero(R,C).
connesso(R,C) :- bianco(R,C), {bianco(R, C+1);bianco(R, C-1);bianco(R+1,C);bianco(R-1,C)}>=1.
:- bianco(R,C), not connesso(R,C).

% A partire da una cella bianca si devono raggiungere tutte le altre

1{root(R,C):bianco(R,C)}1.
raggiungibile(R,C):-root(R,C).

raggiungibile(R,C) :- bianco(R,C), {raggiungibile(R+1,C); raggiungibile(R-1,C); raggiungibile(R,C+1); raggiungibile(R,C-1)}>=1.

:- bianco(R,C), not raggiungibile(R,C).

% vicini di riga e di colonna
vicineR(R1,R2,C) :- schema(R1,C,_),schema(R2,C,_), |R1 - R2| = 1.
vicineC(C1,C2,R) :- schema(R,C1,_),schema(R,C2,_), |C1 - C2| = 1.

#show nero/2.
#show root/2.