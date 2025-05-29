% POSSIBILITA 1
% {cycle(X,Y)} :- cost(X,Y,C).

% dal nodo X non va mai in nodi diversi
% :- cycle(X,Y), cycle(X,Z), Y!=Z.

% simmetrica per l'uscita
% :- cycle(Y,X), cycle(Z,X), Y!=Z.

% impongo che ci sia almento un nodo uscente
% :- node(X), not arco_uscente(X).
% arco_uscente(X):-cycle(X,Y).

% ------------------------------------------

% POSSIBILITA 2
% non sono sicuro che ci sia l'arco da X a Y
% { cycle(X,Y) : node(Y) } = 1 :- node(X).

% sono sicuro che ci sia un arco da X a Y
{ cycle(X,Y) : cost(X, Y, C) } :- node(X).

% per gli archi entranti
{ cycle(X,Y) : cost(X, Y, C) } :- node(Y).

% implica le altre che abbiamo dovuto scrivere nella possibilita 1

reachable(1).
reachable(Y) :- reachable(X), cycle(X,Y).

:- node(X), not reachable(X).

#minimize{C,X,Y : cycle(X,Y), cost(X,Y,C)}.