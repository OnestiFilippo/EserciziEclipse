:-lib(fd).
:-lib(edge_finder3).
:-[automobili].

auto(VarId):-
    findall([Id, End, 20],(rich(Id, End, C, _, _), C = 1), Cerchi),
    findall([Id, End, 80],(rich(Id, End, _, A, _), A = 1), Aria),
    findall([Id, End, 50],(rich(Id, End, _, _, N), N = 1), Navig),

    findall([Id, End], rich(Id,End,_,_,_), Ids),
    get_ids(Ids, VarId),
    length(VarId, LId),

    findall([C, A, N], rich(_, _, C, A, N), DBool),
    get_durate(DBool, Durate),

    crea_lista(ResList, LId),
    write(ResList),

    cumulative(VarId, Durate, ResList, 3),

    labeling(VarId).

crea_lista([], 0).
crea_lista([1|R], Lid):-
    Lid1 is Lid - 1,
    crea_lista(R, Lid1).

get_durate([],[]).
get_durate([[C,A,N]|R], [[C1,A1,N1]|RD]):-
    C1 is C * 20,
    A1 is A * 80,
    N1 is N * 50,
    get_durate(R,RD).

get_ids([],[]).
get_ids([[Id,End]|Ri], [Var|Rv]):-
    Var :: 0..End,
    get_ids(Ri, Rv).