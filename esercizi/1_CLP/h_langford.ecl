:-lib(fd).

langford(N, P, S):-
    length(P, N),
    P :: [1..2*N],

    length(S, N),
    S :: [1..2*N],

    impose_vincoli(P,S,1),

    append(P,S,L),

    alldifferent(L),

    labeling(L).

impose_vincoli([], [], N).
impose_vincoli([P|Rp], [S|Rs],Acc):-
    S - P #= Acc + 1,
    Acc1 #= Acc + 1,
    impose_vincoli(Rp,Rs,Acc1).




    