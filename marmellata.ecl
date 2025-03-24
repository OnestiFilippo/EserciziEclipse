:-lib(fd).

marmellata(L, V):-
	L = [A, B, C, D, E, F],
	L :: [0,1],

	V = [Aldo, Bruno, Carlo, Dario, Elio],
	V :: [0,1],

	somma(L,S1), S1 #= 2,
	somma(V,S2), S2 #= 4,
	
	D + E #= Aldo,
	C + F #= Bruno,
	F + E #= Carlo,
	A + E #= Dario,
	C + B #= Elio,		

	append(L,V,W),
	labeling(W).
	
somma([],0).
somma([H|T], S):- somma(T,S1), S#=S1+H.
