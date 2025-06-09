:- lib(fd).
:- [invitati].
:- lib(fd_global).
:- lib(listut).

matrimonio(Tavoli):-
    num_invitati(NInvitati),
    num_tavoli(NTavoli),
    capacita(Capacita),
    
    findall([C1, C2], conflitto(C1,C2), Conflitto),
    findall([A1, A2], conosce(A1,A2), Conosce),

    length(Tavoli, NInvitati),
    Tavoli :: 1..NTavoli,

    fd_global:alldifferent(Tavoli, Capacita),
    
    impose_conflitto(Tavoli, Conflitto),

    funz_ob(Tavoli, Conosce, Clist),
    fd_global:sumlist(Clist, Costo),
    C #= -Costo,

    min_max(labeling(Tavoli), C).


impose_conflitto(_, []).
impose_conflitto(Tavoli, [[I1,I2]|Rc]):-
    nth1(I1, Tavoli, X),
    nth1(I2, Tavoli, Y),
    X #\= Y,
    impose_conflitto(Tavoli, Rc).

funz_ob(_, [], []).
funz_ob(Tavoli, [[C1,C2]|RConosce], [Costo|Rc]):-
    nth1(C1, Tavoli, X),
    nth1(C2, Tavoli, Y),
    X #= Y #<=> Costo,
    funz_ob(Tavoli, RConosce, Rc).