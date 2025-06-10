:-lib(fd).
:-lib(fd_global).
:-lib(listut).
:-[risposte].

clueno(Carte, Personaggi, Armi):-
    length(Personaggi,6),
    Personaggi :: 0..4,
    length(Armi,6),
    Armi :: 0..4,

    findall([Chiamante, Rispondente, Personaggio, Arma], risposta(Chiamante, Rispondente, Personaggio, Arma), Risposte),

    impose_chiamate(Personaggi, Armi, Risposte),

    occurrences(0, Personaggi, 1),
    occurrences(0, Armi, 1),

    append(Personaggi, Armi, Carte),

    % occurrences(1, Carte, N1),
    % N1#>=2 #/\ N1#<=3,
    % occurrences(2, Carte, N2),
    % N2#>=2 #/\ N2#<=3,
    % occurrences(3, Carte, N3),
    % N3#>=2 #/\ N3#<=3,
    % occurrences(4, Carte, N4),
    % N4#>=2 #/\ N4#<=3,
    
    labeling(Carte).

impose_chiamate(_, _, []).
% Caso = 0
impose_chiamate(Personaggi, Armi, [[C, 0, P, A]|Resto]):-!,
    nth1(P, Personaggi, XP),
    XP #= 0 #<=> B1,
    XP #= C #<=> B2,
    B1 + B2 #= 1,

    nth1(A, Armi, XA),
    XA #= 0 #<=> B3,
    XA #= C #<=> B4,
    B3 + B4 #= 1,
    impose_chiamate(Personaggi, Armi, Resto).
% Caso != 0
impose_chiamate(Personaggi, Armi, [[_, R, P, A]|Resto]):-
    nth1(P, Personaggi, X),
    X #= R #<=> B1,
    nth1(A, Armi, Y),
    Y #= R #<=> B2,
    B1 + B2 #>= 1,
    impose_chiamate(Personaggi, Armi, Resto).

