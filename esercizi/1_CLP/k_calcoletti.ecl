:-lib(fd).

calcoletti(L):-
    L = [A,B,C,D,E],
    L :: [0..99],

    %B #> A,
    %C #> B,
    %D #> C,
    %E #> D,

    % ----- 1 ------ errore sui valori > 10
    X #= A*10 + B,
    X #= C + D + E,

    % ----- 2 ------
    A * B #= C + D + E,

    % ----- 3 ------ errore sui valori > 10
    % X #= (C*10) + D,
    % A * B #= X + E,

    labeling(L).

