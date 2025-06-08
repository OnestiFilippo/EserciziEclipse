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

    /* append(DurateC, DurateA, L2),
    append(L2, DurateN, Durate),

    append(RisorseC, RisorseA, L3),
    append(L3, RisorseN, Risorse),*/

    extract_vars(STc, VarsC),
    extract_vars(STa, VarsA),
    extract_vars(STn, VarsN),

    cumulative(VarsC, DurateC, RisorseC, 1),
    cumulative(VarsA, DurateA, RisorseA, 1),
    cumulative(VarsN, DurateN, RisorseN, 1),

    findall(Id, rich(Id, _, _, _, _), Ids),

    select_id(Ids, STc, STa, STn),

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

select_id([],[],[],[],_,_).
select_id([Id|RId], STc, STa, STn):-
    take_id(Id, STc, StartC, DurataC),
    take_id(Id, STa, StartA, DurataA),
    take_id(Id, STn, StartN, DurataN).

    /* CUMULATIVE SU [V1, V3], [20, 50], [1,1], 1

take_id(_,[],_,_).
take_id(Id, [[Id,Durata,Start]|_], Start, Durata):-!.
take_id(Id, [_|RST], Start, Durata):-
    take_id(Id, RST, Start).


