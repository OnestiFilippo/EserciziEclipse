:-lib(fd).
:-lib(fd_global).
:-lib(listut).
:- [pack_inst].

csp(FinalInst):-
    package(Lpack),
    installed(Linst),
    findall([P1,P2], requires(P1,P2), Lreq),
    findall([P1,P2], conflict(P1,P2), Lconf),
    findall(P, install(P), I),

    length(Lpack, N),
    length(FinalInst, N),
    FinalInst :: 0..1,

    impose_install(I, FinalInst),
    impose_requires(Lreq, FinalInst),
    impose_conflict(Lconf, FinalInst),

    objective(Linst, FinalInst, Obj),
    fd_global:sumlist(Obj, C),
    minimize(labeling(FinalInst), C).

impose_install([], _).
impose_install([E|R], FI):-
    nth1(E, FI, 1),
    impose_install(R, FI).

impose_requires([], _).
impose_requires([[E1,E2]|R], FI):-
    nth1(E1, FI, V1),
    nth1(E2, FI, V2),
    V1 #=< V2,
    impose_requires(R, FI).

impose_conflict([], _).
impose_conflict([[E1,E2]|R], FI):-
    nth1(E1, FI, V1),
    nth1(E2, FI, V2),
    V1 + V2 #=< 1,
    impose_conflict(R, FI).

objective([],[], []).
objective([E1|R1], [E2|R2], [C|Rc]):-
    E1 #\= E2 #<=> C,
    objective(R1, R2, Rc).




