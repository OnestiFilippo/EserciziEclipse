:-lib(fd).
:-lib(fd_global).
:-[pack_inst].
:-lib(listut).

csp(L):-
    package(Package),
    installed(Installed),
    findall(I, install(I), Linst),
    findall([R1,R2], requires(R1,R2), Lreq),
    findall([C1,C2], conflict(C1,C2), Lconf),

    length(Package, N),
    length(L, N),
    L :: 0..1,

    impose_install(L, Linst),

    impose_requires(L, Lreq),

    impose_conflict(L, Lconf),

    funz_ob(L, Installed, Clist),

    fd_global:sumlist(Clist, C),

    minimize(labeling(L), C).

impose_install(_,[]).
impose_install(L, [E|R]):-
    nth1(E, L, 1),
    impose_install(L, R).

impose_requires(_, []).
impose_requires(L, [[R1,R2]|R]):-
    nth1(R1, L, X),
    nth1(R2, L, Y),
    X #<= Y,
    impose_requires(L, R).

impose_conflict(_, []).
impose_conflict(L, [[C1,C2]|R]):-
    nth1(C1, L, X),
    nth1(C2, L, Y),
    X + Y #=< 1,
    impose_conflict(L, R).

funz_ob([],[],[]).
funz_ob([El|Rl], [Ei|Ri], [C|Rc]):-
    El #\= Ei #<=> C,
    funz_ob(Rl, Ri, Rc).