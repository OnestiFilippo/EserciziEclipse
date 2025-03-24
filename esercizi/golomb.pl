:-lib(fd).

righello_golomb(L,N,Lmax):-
	length(L,N),
	L :: [0..Lmax],
	alldifferent(L),
	ordina(L),
	distanza_lista(L,LD),
	alldifferent(LD),
	labeling(L).

ordina([_]).
ordina([A,B|T]):-A#<B,ordina([B|T]).

distanza_lista([],[]).
distanza_lista([H|T],LD):-
	distanza(H,T,L2),
	distanza_lista(T,L3),
	append(L2,L3,LD).

distanza(_,[],[]).
distanza(X,[H|T],[Z|LD]):-Z#=H-X,distanza(X,T,LD).
