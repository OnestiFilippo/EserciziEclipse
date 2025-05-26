edge(1,2).
edge(2,1).
edge(1,3).
edge(3,2).
edge(4,3).
edge(4,2).

reachable(1).
reachable(Y):-reachable(X), edge(X,Y).
