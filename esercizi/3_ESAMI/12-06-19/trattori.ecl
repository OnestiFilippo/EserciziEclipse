:-lib(fd).
:-[production].
:-lib(fd_global).
:-lib(listut).
:-lib(cumulative).

trattori(L):-
    findall([ID,DL], ordine(ID, DL), Ordini),
    findall([ID1, ID2], precedenza(ID1,ID2), Precedenze),
    endtime(Endtime),

    length(Ordini, N),
    length(ST, N),
    length(Durate, N),
    length(Risorse, N),

    ST :: 0..Endtime-1,
    Durate :: [1],
    Risorse :: [1],

    impose_precedenze(ST, Precedenze),

    cumulative(ST, Durate, Risorse, 1),

    funz_ob(ST, Ordini, Clist),

    fd_global:sumlist(Clist, C),

    CFinale #= -C,

    append(ST, [CFinale], L),

    min_max(labeling(L), CFinale).

impose_precedenze(_, []).
impose_precedenze(ST, [[ID1,ID2] | R]):-
    nth1(ID1, ST, X),
    nth1(ID2, ST, Y),
    X + 1 #<= Y,
    impose_precedenze(ST, R).

funz_ob(_,[],_).
funz_ob(ST, [[ID,DL]|Ro], [C|Rc]):-
    nth1(ID, ST, X),
    X + 1 #=< DL #<=> C,
    funz_ob(ST, Ro, Rc).