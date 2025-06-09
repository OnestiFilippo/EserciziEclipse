:-lib(fd).
:-lib(fd_global).
:-[automobili].
:-lib(cumulative).

auto(Cerchi, StartCerchi, Aria, StartAria, Navigatore, StartNavigatore):-
    findall([ID, End, 20], rich(ID,End,1,_,_), Cerchi),
    findall([ID, End, 80], rich(ID,End,_,1,_), Aria),
    findall([ID, End, 50], rich(ID,End,_,_,1), Navigatore),


    length(Cerchi, NCerchi),
    length(StartCerchi, NCerchi),
    crea_start_time(StartCerchi, Cerchi),
    crea_lista_cumulative(NCerchi, 20, DurateC),
    crea_lista_cumulative(NCerchi, 1, RisorseC),

    length(Aria, NAria),
    length(StartAria, NAria),
    crea_start_time(StartAria, Aria),
    crea_lista_cumulative(NAria, 50, DurateA),
    crea_lista_cumulative(NAria, 1, RisorseA),

    length(Navigatore, NNavigatore),
    length(StartNavigatore, NNavigatore),
    crea_start_time(StartNavigatore, Navigatore),
    crea_lista_cumulative(NNavigatore, 80, DurateN),
    crea_lista_cumulative(NNavigatore, 1, RisorseN),

    append(StartCerchi, StartAria, ST1),
    append(ST1, StartNavigatore, ST),

    append(DurateC, DurateA, D1),
    append(D1, DurateN, Durate),

    append(RisorseC, RisorseA, R1),
    append(R1, RisorseN, Risorse),

    cumulative(ST, Durate, Risorse, 3),

    labeling(ST).

crea_start_time([],[]).
crea_start_time([Start|Rs], [[_, End, _]|Rc]):-
    Start :: 0..End,
    crea_start_time(Rs, Rc).

crea_lista_cumulative(0, _, []):-!.
crea_lista_cumulative(I, El, [El|Rl]):-
    I1 is I - 1,
    crea_lista_cumulative(I1, El, Rl).