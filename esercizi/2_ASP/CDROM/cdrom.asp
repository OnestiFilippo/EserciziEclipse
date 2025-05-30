{scelto(ID,D)} :- file(ID, D).

#maximize {1, ID : scelto(ID,D)}.

:- #sum{D,ID : scelto(ID, D)} > 600.

#show scelto/2.