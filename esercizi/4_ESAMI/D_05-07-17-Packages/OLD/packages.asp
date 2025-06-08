{install(X)} :- package(X).

:- install(X), requires(X,Y), not install(Y).

:- conflict(X,Y), install(X), install(Y).

installa(X) :- package(X), install(X), not installed(X).
disinstalla(X) :- package(X), not install(X), installed(X).

op(X) :- installa(X).
op(X) :- disinstalla(X).

#minimize{1,X : op(X)}.

% #show op/1.
#show installa/1.
#show disinstalla/1.
