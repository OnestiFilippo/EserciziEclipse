nodo(ID) :- paziente(ID, _, _).
nodo(0).

X{orario(0..X)}X :- X = #max{Ora : paziente(_,_,Ora)}.

{tsp(X,Y, Arrivo) : distanza(X,Y,D), orario(Arrivo), Arrivo = Arrivo + A} = 1 :- nodo(X).
{tsp(X,Y, Arrivo) : distanza(X,Y,D), orario(Arrivo), Arrivo = Arrivo + A} = 1 :- nodo(Y).

reachable(Y) :- tsp(0,Y,_).
reachable(Y) :- tsp(X,Y,_), reachable(X).

:- tsp(A,B,_), tsp(B,A,_), A!=B.
:- nodo(X), not reachable(X).

:- tsp(A, B, O1), tsp(B, C, O2), A!=B, B!=C, A!=C, O1 > O2.
:- tsp(X, Y, Arrivo), paziente(Y, Min, Max), orario(Arrivo), Arrivo<Min, Arrivo > Max.

#minimize {C, X, Y : tsp(X,Y,_), distanza(X,Y,C)}.

#show tsp/3.