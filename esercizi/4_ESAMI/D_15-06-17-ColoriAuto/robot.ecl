:-lib(fd).
:-lib(fd_global).
:-lib(listut).

robot(Sequenza, MaxD, Pos):-
    length(Sequenza, N),
    length(Pos, N),
    Pos :: 1..N,

    impose_distanza(1, Pos, MaxD),

    fd_global:alldifferent(Pos),

    funz_ob(Pos, Sequenza, Clist),

    fd_global:sumlist(Clist, C),

    minimize(labeling(Pos), C).

impose_distanza(_,[],_).
impose_distanza(I, [El|R], MaxD):-
    El - I #<= MaxD,
    El - I #>= - MaxD,
    I1 is I + 1,
    impose_distanza(I1, R, MaxD).

funz_ob([_], _, []).
funz_ob([P,P1|R], Sequenza, [C|Rc]):-
    nth1(P, Sequenza, X),
    nth1(P1, Sequenza, Y),
    X #\= Y #<=> C,
    funz_ob([P1|R], Sequenza, Rc).

