:-lib(fd).

langford(N, P, S):-
	length(P, N),
	P :: [1..2*N],

	length(S, N),
	S :: [1..2*N],

	checks(P, 1, S),

	append(P,S,L),

	alldifferent(L),

	labeling(L).

checks([], _, []).
checks([Hp|Tp], Curr, [Hs|Ts]):-
	Next is Curr + 1,
	Hs #= Hp + Next,
	checks(Tp, Next, Ts).
	
