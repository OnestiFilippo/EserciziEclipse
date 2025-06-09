invitato(1..N) :- num_invitati(N).
tavolo(1..N) :- num_tavoli(N).

1{matrimonio(N, T) : tavolo(T)}1 :- invitato(N).

:- capacita(C), tavolo(T), {matrimonio(_, T)} > C.

:- conflitto(C1, C2), matrimonio(C1, T1), matrimonio(C2, T2), T1 = T2.

costo(I1, I2) :- conosce(I1,I2), matrimonio(I1, T1), matrimonio(I2, T2), T1 = T2.

#maximize{1, I1, I2 : costo(I1, I2)}.

#show matrimonio/2.