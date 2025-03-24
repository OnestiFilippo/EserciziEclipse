:-lib(fd).

sommalista(L,S):-
	L :: [0..10],
	S :: 0..100,
	somma(L,S1),
	S #= S1,
	labeling([S|L]).


somma([],0).
somma([H|T],S):-
	somma(T,S1),
	S #= S1 + H.
