:-lib(fd).

sfere(L, N):-
	
	length(L, N),
	L :: 0..1,

	somma_cubi(L, N, 0, S1),
	somma_cubi(L, N, 1, S2),

	S1 #= S2,

	labeling(L).

somma_cubi([], _, _, 0).
somma_cubi([B|L], I, Val, S):-
	I1 is I-1,
	somma_cubi(L, I1, Val, S1),
	D is I,
        (B #= Val) #<=> Sel,
	S #= S1 + Sel * (D * D * D).
