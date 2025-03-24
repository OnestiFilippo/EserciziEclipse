:-lib(fd).

sfere(L, N):-
	
	length(L, N),
	L :: 0..1,

	somma_cubi(L, N, 0, S1),
	somma_cubi(L, N, 1, S2),

	S1 #= S2,

	labeling(L).

somma_cubi([], _, _, 0).
somma_cubi([B|L], D, Val, S):-
	D1 is D-1,
	somma_cubi(L, D1, Val, S1),
        B #= Val #/\ S #= S1 + (D * D * D).
