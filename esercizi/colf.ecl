:-lib(fd).
:-lib(edge_finder3).
:-lib(fd_global).

colf(ST):-
	ST = [LavareB, Asciugare, Stirare, LavareP, Impasto, Prerisc, Cottura, Pulire],
	ST :: [0..200],

	Colf = [0, 0, 1, 0, 1, 0, 0, 1],

	Lievitazione :: 60..120,

	Durate = [45, 60, 60, 40, 15, 5, 15, 120],

	Consumi = [1700, 1000, 2000, 1800, 0, 2000, 2000, 0],

	LavareB + 45 #=< Asciugare,
	Asciugare + 60 #=< Stirare,

	Impasto + 15 + Lievitazione #= Prerisc + 5,

	Prerisc + 5 #=< Cottura,

	cumulative(ST, Durate, Consumi, 3000),

	cumulative(ST, Durate, Colf, 1),

	lista_endtime(ET, ST, Durate),

	maxlist(ET, Max),

	Max #=< 200,

	fd:alldifferent(ST),

	append(ST, [Lievitazione], L), 
	labeling(L).

lista_endtime([], [], []).
lista_endtime([X|Te], [Hs|Ts], [Hd|Td]) :- X #= Hs + Hd, lista_endtime(Te, Ts, Td).
