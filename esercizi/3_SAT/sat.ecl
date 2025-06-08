:-[read_cnf].
:-lib(fd).

sat(Vars):-
    read_cnf('aim-100-1_6-no-1.cnf'),
    cnf(NVars, NCla),
    findall(L, clausola(L), Data),

    length(Vars, NVars),
    Vars :: [0,1],

    impose_clausole(Vars, Data),

    labeling_ff(Vars).

impose_clausole(_, []).
impose_clausole(Vars, [[A,B,C]|T]):-
    
    select_var(A, Vars, V1),
    select_var(B, Vars, V2),
    select_var(C, Vars, V3),

    V1 + V2 + V3 #>= 1,
    % (V1 #\/ V2 #\/ V3) #= 1,

    impose_clausole(Vars, T).

select_var(1, [H|_], H):-!.
select_var(-1, [H|_], V):-!, V #= 1 - H.
select_var(N, [_|T], V):-
    N > 0, !,
    N1 is N-1,
    select_var(N1, T, V).
select_var(N, [_|T], V):-
    N < 0,
    N1 is N+1,
    select_var(N1, T, V).

labeling_ff([]).
labeling_ff(L):-
    deleteff(X, L, R),
    indomain(X),
    labeling_ff(R).

