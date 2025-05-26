:-lib(fd).

gedeone(G,D,U):-
    [G,D,U] :: [1..100],

    D + 11 #= 6 * (G - D) / 5,

    U #= D + 3,

    U #= G - D - 3,

    labeling([G,D,U]).