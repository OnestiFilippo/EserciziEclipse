position(1..7).

1{sequenza(New,Old,C) : position(New)}1 :- car(Old,C).

:- sequenza(New, Old, C), maxd(N), New > Old + N.
:- sequenza(New, Old, C), maxd(N), New < Old - N.

:- sequenza(New, Old1, _), sequenza(New, Old2, _), Old1 != Old2.

change(New) :- sequenza(New, _, C1), sequenza(New+1, _, C2), C1 != C2.

#minimize{1,X: change(X)}.

nuova(X,C):-sequenza(X, _, C).

#show nuova/2.