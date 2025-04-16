:-lib(fd).
:-lib(edge_finder3).
:-[automobili].

auto(ST):-
    findall([Id, End, 20],(rich(Id, End, C, _, _), C = 1), Cerchi),
    findall([Id, End, 80],(rich(Id, End, _, A, _), A = 1), Aria),
    findall([Id, End, 50],(rich(Id, End, _, _, N), N = 1), Navig),

    length(Cerchi, Lc),
    crea_start_time(Cerchi, STc),
    crea_lista(Lc, 20, DurateC),
    crea_lista(Lc, 1, RisorseC),

    length(Aria, La),
    crea_start_time(Aria, STa),
    crea_lista(La, 80, DurateA),
    crea_lista(La, 1, RisorseA),

    length(Navig, Ln),
    crea_start_time(Navig, STn),
    crea_lista(Ln, 50, DurateN),
    crea_lista(Ln, 1, RisorseN),


    append(STc, STa, L1),
    append(L1, STn, ST),

    append(DurateC, DurateA, L2),
    append(L2, DurateN, Durate),

    append(RisorseC, RisorseA, L3),
    append(L3, RisorseN, Risorse),

    cumulative(ST, Durate, Risorse, 3),

	labeling(ST).


crea_lista(0, _, []) :- !.
crea_lista(N, Elem, [Elem|Rest]) :-
    N > 0,
    N1 is N - 1,
    crea_lista(N1, Elem, Rest).

crea_start_time([],[]).
crea_start_time([[_, Max, _]|RL],[Var|RV]):-
    Var :: 1..Max,
    crea_start_time(RL,RV).