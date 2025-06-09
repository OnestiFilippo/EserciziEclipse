:- lib(fd).
:- lib(propia).
:- [pazienti].
:- lib(fd_global).

infermiera(TSP, C):-
    findall(P, paziente(P,_,_), Pazienti),
    length(Pazienti, N),
    N1 is N+1,
    length(TSP, N1),

    TSP :: 0..N,

    impose_start(TSP),

    fd_global:alldifferent(TSP),

    existArc(TSP, 0, C),

    min_max(labeling(TSP), C).

impose_start([H|_]):-
    H #= 0.

existArc([A], CI, C):-
    distanza(A,0,D) infers most,
    C #= CI + D.

existArc([A,B|R], CI, C):-
    distanza(A, B, D) infers most,
    C1 #= CI + D,
    paziente(B, OMin, OMax) infers most,
    C1 #>= OMin,
    C1 #<= OMax,
    existArc([B|R], C1, C).
