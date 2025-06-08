:- lib(fd).

gedeone(G,D,U):-
	
	G :: 0..100,
	D :: 0..100,
	U :: 0..100,

	11 * D #= 6 * G - 55,

	U #= D + 3,

	U #= G - D - 3,

	labeling([G,D,U]).
