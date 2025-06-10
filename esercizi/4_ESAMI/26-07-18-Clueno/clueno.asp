giocatore(0..4).
personaggio(1..6).
arma(1..6).

1{carta_A(G, N): giocatore(G)}1 :- arma(N).
1{carta_P(G, N): giocatore(G)}1 :- personaggio(N).

:- {carta_A(0,_)} != 1.
:- {carta_P(0,_)} != 1.

:- risposta(R, 0, _, A), not carta_A(R, A), not carta_A(0, A).
:- risposta(R, 0, P, _), not carta_P(R, P), not carta_P(0, P).

:- risposta(_, G, P, A), not carta_A(G, A), not carta_P(G, P), G != 0.


#show carta_A/2.
#show carta_P/2.

