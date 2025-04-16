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

    extract_vars(STc, VarsC),
    extract_vars(STa, VarsA),
    extract_vars(STn, VarsN),

    cumulative(VarsC, DurateC, RisorseC, 1),
    cumulative(VarsA, DurateA, RisorseA, 1),
    cumulative(VarsN, DurateN, RisorseN, 1),

    impose_non_overlap(ST),

    extract_vars(ST, Vars),
    labeling(Vars).

crea_lista(0, _, []) :- !.
crea_lista(N, Elem, [Elem|Rest]) :-
    N > 0,
    N1 is N - 1,
    crea_lista(N1, Elem, Rest).

crea_start_time([],[]).
crea_start_time([[Id, Max, Durata]|RL],[Id-Durata-Var|RV]):-
    Var :: 0..(Max-Durata),
    crea_start_time(RL,RV).

extract_vars([], []).
extract_vars([_-_-Var|Rest], [Var|Vars]) :-
    extract_vars(Rest, Vars).

impose_non_overlap(ST) :-
    findall(Id, member(Id-_-_, ST), Ids),
    sort(Ids, UniqueIds),
    impose_for_ids(UniqueIds, ST).

impose_for_ids([], _).
impose_for_ids([Id|Rest], ST) :-
    findall(Start-Durata, member(Id-Durata-Start, ST), Intervalli),
    non_overlapping_intervals(Intervalli),
    impose_for_ids(Rest, ST).

non_overlapping_intervals([]).
non_overlapping_intervals([_]).
non_overlapping_intervals([Start1-Dur1, Start2-Dur2 | Rest]) :-
    (Start1 + Dur1 #=< Start2 ; Start2 + Dur2 #=< Start1),
    non_overlapping_intervals([Start1-Dur1 | Rest]),
    non_overlapping_intervals([Start2-Dur2 | Rest]).