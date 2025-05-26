:-lib(fd).

golomb(L, N, Lmax):-
    length(L, N),
    L :: [0..Lmax],
    
    alldifferent(L),

    ordina(L),

    distanza_lista(L, LD),

    alldifferent(LD),

    labeling(L).

ordina([_]).
ordina([A,B|R]):-
    A #< B,
    ordina([B|R]).

distanza_lista([],[]).
distanza_lista([E|R], LD):-
    distanza(E, R, L2),
    distanza_lista(R, L3),
    append(L2,L3,LD).

distanza(_, [], []).
distanza(E, [N|Rl], [D|Rd]):-
    D #= N - E,
    distanza(E, Rl, Rd).