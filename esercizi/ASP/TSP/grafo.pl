node(1..6).

cost(1,2,2).
cost(1,3,3).
cost(2,4,2).
cost(2,5,2).
cost(3,1,3).
cost(3,4,2).
cost(4,1,1).
cost(4,2,2).
cost(5,3,2).
cost(5,4,2).
cost(1,4,1).
cost(2,6,4).
cost(3,5,2).
cost(5,6,1).
cost(6,5,1).
cost(6,2,4).
cost(6,3,3).


% POSSIBILITA 2
% non sono sicuro che ci sia l'arco da X a Y
% { cycle(X,Y) : node(Y) } = 1 :- node(X).

% sono sicuro che ci sia un arco da X a Y
{ cycle(X,Y) : cost(X, Y, C) } = 1 :- node(X).

% per gli archi entranti
{ cycle(X,Y) : cost(X, Y, C) } = 1 :- node(Y).

% implica le altre che abbiamo dovuto scrivere nella possibilita 1

reachable(1).
reachable(Y) :- reachable(X), cycle(X,Y).

:- node(X), not reachable(X).

#minimize{C,X,Y : cycle(X,Y), cost(X,Y,C)}.

#show cycle/2.