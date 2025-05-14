:-[read_cnf].
:-lib(fd).
:-lib(listut).
:-lib(fd_global).
:-lib(fd_search).
:- lib(fd_sbds).
:- import sumlist/2 from fd_global.

sat(Variables):-
    read_cnf("aim-100-1_6-no-1.cnf"),
    cnf(Nv,_),
    findall(clausola(L),clausola(L),Clauses),

    length(Variables,Nv),
    Variables :: [0,1],

    impose_clauses(Clauses,Variables),
    search(Variables,0,occurrence,indomain_random,complete,[]).


impose_clauses([],_).
impose_clauses([clausola(Literals)|T],Variables):-
    select_variables(Literals,Variables,Vars),
    %sumlist(Vars,Sum),
    %Sum #>= 1,
    
    %maxlist(Vars,1),


    impose_clauses(T,Variables).


select_variables([],_,[]).
select_variables([N|Literals],Variables,[V|Vs]):-
    abs(N,Index),
    nth1(Index,Variables,Var),
    (N > 0
        -> V #= Var
        ; V #= 1 - Var
    ),
    select_variables(Literals,Variables,Vs).

% DA FINIRE
orlist([X]):- !, X=1.
orlist(L):- cerca_uno(L), !.
orlist(L):-
    rimuovi_zero(L, LsenzaZero),
    (se hai rimosso qualcosa
    ->  orlist(LsenzaZero)
    ;   L=[H1,H2|_],
        suspend(orlist(L), 3, [H1,H2]->fd:any)  
        % Il sospendersi su due variabili si chiama watched literal
    ).

cerca_uno([H|T]):-
    ground(H), H = 1.
cerca_uno([H|T]):-cerca_uno(T).

% DA RIVEDERE
rimuovi_zero([], []).
rimuovi_zero([0|T],L):-
    rimuovi_zero(T,T).