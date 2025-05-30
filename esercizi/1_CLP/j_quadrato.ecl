:-lib(fd).
:-lib(fd_global).
:-lib(matrix_util).
:-lib(listut).

quadrato(N, Mat):-
    matrix(N,N,R,C),
    R :: [1..N*N],
    C :: [1..N*N],

    get_somme(R, SommeR),
    get_somme(C, SommeC),

    impose_somme_uguali(SommeR),
    impose_somme_uguali(SommeC),

    nth1(1, SommeR, SR),
    nth1(1, SommeC, SC),

    SR #= SC,

    append(R,C,Mat),

    flatten(R, Rl),
    flatten(C, Cl),

    append(Rl, Cl, M),

    labeling(M).

get_somme([],[]).
get_somme([Fila|R], [S|Rs]):-
    fd_global:sumlist(Fila, S),
    get_somme(R,Rs).

impose_somme_uguali([_]).
impose_somme_uguali([E1, E2 | R]):-
    E1 #= E2,
    impose_somme_uguali([E2|R]).