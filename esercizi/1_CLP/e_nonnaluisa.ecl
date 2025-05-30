:-lib(fd).

nonnaluisa(N, C, T, Tn, Tc, Tt):-
    [N,C,T] :: [1..3],
    [Tn, Tc, Tt] :: [0..60],

    element(N, [5,3,2], Task_nonna),
    element(C, [4,2,3], Task_cane),
    element(T, [2,5,4], Task_torta),

    alldifferent([N,C,T]),

    Tn #= 0,

    Tc #>= Tn + 1,
    Tc #<= Tn + Task_nonna - 1,

    Tt #>= Tc,
    Tt + Task_torta #<= Tn + Task_nonna,
    Tt + Task_torta #<= Tc + Task_cane,

    labeling([N, C, T, Tn, Tc, Tt]).

