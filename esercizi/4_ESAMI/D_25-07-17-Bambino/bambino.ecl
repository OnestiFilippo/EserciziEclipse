:-lib(fd).
:-lib(fd_global).
:-lib(listut).
:-[impegni].

bambino(Giugno):-
    findall([Genitore,Giorno], impegno(Genitore, Giorno), Impegni),

    length(Giugno, 30),
    Giugno :: 1..4,

    impose_impegni(Giugno, Impegni),

    % Max Ferie Genitori
    impose_max(Giugno, 2, 4),
    impose_max(Giugno, 3, 6),

    % Max Giorni Asilo
    impose_max(Giugno, 1, 7),

    StartAsilo :: [1..30],
    EndAsilo :: [1..30],

    EndAsilo #> StartAsilo,
    EndAsilo - StartAsilo #<= 6, 

    impose_asilo(1, Giugno, StartAsilo, EndAsilo),

    costo_BS(Giugno, CBSList),
    fd_global:sumlist(CBSList, CBSCount),
    CBS #= CBSCount*50,
    
    %occurrences(1, Giugno, NAsilo),
    %Nasilo #> 0 #<=> BAsilo,
    %CA #= BAsilo * 100,

    costo_asilo(Giugno, CA),

    CTot #= CBS + CA,

    min_max(labeling(Giugno), CTot).

impose_impegni(_, []).
impose_impegni(Giugno,[[1,Giorno]|R]):-
    nth1(Giorno, Giugno, X),
    X #\= 2,
    impose_impegni(Giugno, R),
    !.
impose_impegni(Giugno,[[2,Giorno]|R]):-
    nth1(Giorno, Giugno, X),
    X #\= 3,
    impose_impegni(Giugno, R).

impose_max(Giugno, Gen, Giorni):-
    occurrences(Gen, Giugno, N),
    N #<= Giorni.

impose_asilo(_, [], _, _).
impose_asilo(G, [Giorno|R], StartAsilo, EndAsilo):-
    (G #< StartAsilo #\/ G #> EndAsilo) #<=> B,
    Giorno #\= 1 #<=> B,
    G1 is G + 1,
    impose_asilo(G1, R, StartAsilo, EndAsilo).
    
costo_BS([],[]).
costo_BS([H|T],[C|Rc]):-
    H #= 4 #<=> C,
    costo_BS(T,Rc).

costo_asilo([], 0).
costo_asilo([1|_], 100):-!.
costo_asilo([_|R], C):-
    costo_asilo(R, C).
