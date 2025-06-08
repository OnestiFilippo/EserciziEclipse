1{color(Col)}1 :- car(_, Col).

1{number(N)}1 :- car(N,_).

1{robot(N, Old, Col) : number(N)}1 :- car(Old,Col).

:- robot(N1, Old1, _), robot(N2, Old2, _), N1 = N2, Old1 != Old2.

:- robot(N, Old, _), maxd(Max), |N - Old| > Max.

costo(N) :- robot(N, _, Col1), robot(N + 1, _, Col2), Col1 != Col2.

#minimize{1,N : costo(N)}.

#show robot/3.

