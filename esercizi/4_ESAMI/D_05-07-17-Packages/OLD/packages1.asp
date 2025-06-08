%{install(X)}:-package(X).
%{disinstall(X)}:-package(X).

install(Y) :- installed(X), requires(X, Y).

installed(X) :- install(X).

{disinstall(X) ; disinstall(Y)} <= 1 :- installed(X), installed(Y), conflict(X,Y).

op(X) :- install(X).
op(X) :- disinstall(X).

%#minimize{1,X : op(X)}.

#show install/1.
#show disinstall/1.

#show installed/1.



