{install(X)} :- package(X).

:-  requires(X,Y), install(X), not install(Y).

:-  conflict(X,Y), install(X), install(Y).

installa(X) :- install(X), not installed(X).
disinstalla(X) :- installed(X), not install(X).

op(X) :- installa(X).
op(X) :- disinstalla(X).

#minimize{1,X : op(X)}.

#show installa/1.
#show disinstalla/1.
