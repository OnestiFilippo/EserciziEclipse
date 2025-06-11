day(1..30).
scelta(1..4).

1{giorno(G,S):scelta(S)}1 :- day(G).

:- giorno(G, 2), impegno(1, G).
:- {giorno(G, 2)}>4.
:- giorno(G, 3), impegno(2, G).
:- {giorno(G, 3)}>6.

:- giorno(Ia, 1), giorno(Fa, 1), Fa != Ia, Fa - Ia > 6.

costoBS(CBS) :- CBS = #sum{50, G : giorno(G,4)}.
asilo :- {giorno(G,1)}>0.

costoTot(CBS) :- costoBS(CBS), not asilo.
costoTot(C) :- costoBS(CBS), asilo, C = 100 + CBS.

#minimize{C: costoTot(C)}.

#show giorno/2.
#show costoBS/1.
#show costoA/1.



