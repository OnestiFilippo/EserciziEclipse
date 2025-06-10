1{schedule(ID, EST, LCT, D, ST) : tempo(ST)}1 :- task(ID, EST, LCT, D).

:- schedule(ID1,_,_,_,ST1), schedule(ID2,_,_,_,ST2), ID1 != ID2, ST1 = ST2. 

:- schedule(ID,EST,_,_,ST), ST < EST.
:- schedule(ID,_,LCT,D,ST), ST + D > LCT.

distanza(ID1,ID2,Dist) :- schedule(ID1,_,_,_,ST1), schedule(ID2,_,_,_,ST2), ID1 != ID2, Dist = |ST1 - ST2|. 

distmin(Dist) :- Dist = #min{ID1, ID2, D : distanza(ID1, ID2, D)}.

#maximize{Dist : distmin(Dist)}.

#show schedule/5.
#show distmin/1.
