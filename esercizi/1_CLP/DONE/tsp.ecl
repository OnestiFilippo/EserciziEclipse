:-[distanze].
:-lib(fd).
:-lib(fd_global).
:-lib(propia).

tsp(TSP, D):-
    ncitta(N),
    length(TSP,N),
    TSP :: [1..N],

    imposeFirst(TSP),
    fd_global:alldifferent(TSP),
    find_path(TSP, Distanze),
    sumlist(Distanze, D),
    min_max(labeling(TSP), D).

imposeFirst([H|_]):-
    H #= 1.

find_path([A|[]], [D]):-!,
    dista(A,1,D) infers most.

find_path([A,B|T], [D|R]):-
    dista(A,B,D) infers most,
    find_path([B|T], R).




