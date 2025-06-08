1 {pos(NewPos,OldPos,Col):position(NewPos)} 1 :- car(OldPos,Col). 

:- pos(NewPos,OldPos,_), |NewPos-OldPos| > MaxD, maxd(MaxD). 

:- pos(NewPos,OldPos1,_), pos(NewPos,OldPos2,_), oldPos1 != OldPos2. 

switch(P):- pos(P,_,Col1), pos(P+1,_,Col2), Col1 != Col2. 

#minimize { 1,P:switch(P) }.