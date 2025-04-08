:-lib(fd).

colleghi(L):-
    Primi = [A1, B1, C1, D1, F1],
    Secondi = [A2, B2, C2, D2, F2],

    Primi :: [1..5],
    Secondi :: [1..5],

    B1 #= 4,

    C1 #= 4 #\/ C2 #= 4,

    D1 #\= 3 #/\ D2 #\= 3,

    F1 #\= F2 #/\ F1 #\= 5 #/\ F2 #\= 5,

    A1 #= 2 #\/ A2 #= 2,

    alldifferent(Primi),
    alldifferent(Secondi),

    funz_ob(Primi,Secondi, C, 0),

    append(Primi, Secondi, L),

    minimize(labeling(L),C).

funz_ob([],[],0,_).
funz_ob([Hp|Tp], [Hs|Ts], C, Curr):-
    Next is Curr + 1,
    funz_ob(Tp, Ts, C1, Next),
    (Hp #\= Next, Hs #\= Next
        ->  C #= C1 + 2
        ;   (Hp #\= Next ; Hs #\= Next)
            ->  C #= C1 + 1
            ;   C #= C1
    ).



