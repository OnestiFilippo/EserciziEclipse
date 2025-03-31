:-lib(fd).

langford(N, P, S):-
	length(P, N),
	P :: [1..2*N],

	length(S, N),
	S :: [1..2*N],

	checks(P, 1, S),

	alldifferent(P),
	alldifferent(S),

	labeling([P,S]).

checks([], _, []).
checks([Hp|Tp], Curr, [Hs|Ts]):-
	Next is Curr + 1,
	Hs #= Hp + Next,
	checks(Tp, Next, Ts).
	
