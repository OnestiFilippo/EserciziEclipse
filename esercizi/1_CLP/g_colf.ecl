:-lib(fd).
:-lib(edge_finder3).
:-lib(fd_global).

colf(StartTimes):-
    StartTimes = [Lb, Ab, Sb, Lp, Im, Pr, Co, Pu],
    StartTimes :: [0..200],

    Colf = [0,0,1,0,1,0,0,1],
    Durate = [45, 60, 60, 40, 15, 5, 15, 120],
    Consumi = [1700, 1000, 2000, 1800, 0, 2000, 2000, 0],

    Lb + 45 #<= Ab,
    Ab + 60 #<= Sb,

    Pr + 5 #>= Im + 15 + 60,
    Pr + 5 #<= Im + 15 + 120,
    Co #= Pr + 5,

    cumulative(StartTimes, Durate, Consumi, 3000),

    cumulative(StartTimes, Durate, Colf, 1),

    get_endlist(StartTimes, Durate, EndTimes),

    maxlist(EndTimes, Max),

    Max #<= 200,

    fd:alldifferent(StartTimes),

    labeling(StartTimes).

get_endlist([],[],[]).
get_endlist([S|Rs], [D|Rd], [E|Re]):-
    E #= S + D,
    get_endlist(Rs, Rd, Re).