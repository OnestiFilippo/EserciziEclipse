{nero(R,C)} :- schema(R,C,V).


:- schema(R1,C,_), schema(R2,C,_), vicineR(R1,R2,C), nero(R1,C), nero(R2,C).
:- schema(R,C1,_), schema(R,C2,_), vicineC(C1,C2,R), nero(R,C1), nero(R,C2).

:-schema(R,C1,V), schema(R,C2,V), C1 != C2, not nero(R,C1), not nero(R,C2).
:-schema(R1,C,V), schema(R2,C,V), R1 != R2, not nero(R1,C), not nero(R2,C).

% Sto dicendo che due celle vicine non possono essere nere quindi elimina tutte le celle nere -> Unsatisfiable
% :-schema(R,C1,_), schema(R,C2,_), not nero(R,C1), not nero(R,C2), C1 != C2, not vicineC(C1,C2,R).
% :-schema(R1,C,_), schema(R2,C,_), not nero(R1,C), not nero(R2,C), R1 != R2, not vicineR(R1,R2,C).

vicineR(R1,R2,C) :- schema(R1,C,_),schema(R2,C,_), |R1 - R2| = 1.
vicineC(C1,C2,R) :- schema(R,C1,_),schema(R,C2,_), |C1 - C2| = 1.

#show nero/2.