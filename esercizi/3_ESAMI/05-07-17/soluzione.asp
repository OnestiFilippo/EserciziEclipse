{install(P)} :- package(P). 

:- install(P1), requires(P1,P2), not install(P2).

:- conflict(P1,P2), install(P1), install(P2). 

change(P):- package(P), install(P), not installed(P). 
change(P):- package(P), not install(P), installed(P). 

#minimize { 1,P:change(P)}. 
#show install/1. 
#show change/1.