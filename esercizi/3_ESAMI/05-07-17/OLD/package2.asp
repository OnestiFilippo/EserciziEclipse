{installed(X)} :- package(X).

:- installed(X), installed(Y), conflict(X,Y), X!=Y.

:- install(X), not installed(X).

:- package(X), installed(X), requires(X,Y), not installed(Y), X!=Y.

#show installed/1.