nodo(ID) :- paziente(ID, _, _).
nodo(0).

{tsp(X,Y) : distanza(X,Y,_)} = 1 :- nodo(X).
{tsp(X,Y) : distanza(X,Y,_)} = 1 :- nodo(Y).

reachable(Y) :- tsp(0,Y).
reachable(Y) :- tsp(X, Y), reachable(X).

:- tsp(A,B), tsp(B,A), A!=B.
:- nodo(X), not reachable(X).

#minimize {C, X, Y : tsp(X,Y), distanza(X,Y,C)}.

#show tsp/2.