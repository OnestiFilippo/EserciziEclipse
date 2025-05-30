{color(X,C)} :- nodo(X), palette(C).

colorato(X) :- nodo(X), color(X,C), palette(C).

:- near(X, Y), nodo(X), nodo(Y), color(X,C), color(Y,C), palette(C).

:- nodo(X), not colorato(X).

#show color/2.