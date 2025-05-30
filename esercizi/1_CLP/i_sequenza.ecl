:-lib(fd).
:-lib(fd_global).

magic(L,N):-
    length(L,N),
    L :: [0..N],

    impose_vincoli(0, L, L, N),

    labeling(L).

impose_vincoli(N, L, [], N).
impose_vincoli(Index, L, [E|R], N):-
    occurrences(Index, L, X),
    E #= X,
    Index1 #= Index + 1,
    impose_vincoli(Index1, L, R, N).

