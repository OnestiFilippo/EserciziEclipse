:- lib(fd).
:- [distanze].
:-lib(fd_global).
:- lib(propia).

tsp(TSP, D) :-
    ncitta(N),
    length(TSP,N),
    TSP :: [1..N],

    impose_start(TSP),

    fd_global:alldifferent(TSP),

    existArc(TSP, Distanza),

    fd_global:sumlist(Distanza, D),
    minimize(labeling(TSP), D).

impose_start([Start|_]) :-
    Start#=1.

existArc([A|[]], [D]):-
    dista(A,1,D) infers most.

existArc([A,B|Rt], [D|Rd]):-
    dista(A,B,D) infers most,
    existArc([B|Rt], Rd).