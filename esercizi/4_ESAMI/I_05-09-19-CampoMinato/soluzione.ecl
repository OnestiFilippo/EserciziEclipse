:- lib(fd). 
:- lib(fd_global). 
:- lib(matrix_util). 
:- lib(listut). 
:- ['estrai_confinanti.eco']. 
:- [schema1]. 

mine(ClickR,ClickC):- 
 schema(Nrighe,Ncol,Vicini), 
 matrix(Nrighe,Ncol,Mine), 
 flatten(Mine,MineFlat), 
 MineFlat :: 0..1, 
 matrix(Nrighe,Ncol,Vicini), 
 flatten(Vicini,ViciniFlat), 
  
 vincolo_mine(Nrighe,Ncol,Mine,Vicini), 
  
 nth1(ClickR,Mine,RigaClick), 
 nth1(ClickC,RigaClick,ElClick), 
 % Aggiungendo queste 3 righe si risolve l'esercizio 1.2 
     nth1(ClickR,Vicini,RigaClickVicini), 
     nth1(ClickC,RigaClickVicini,ElClickVicini), 
     var(ElClickVicini), 
 not( 
    (ElClick=1, 
     labeling(MineFlat) 
    ) 
 ). 
  
vincolo_mine(0,_Ncol,_Mine,_Vicini):- !. 
vincolo_mine(Nrighe,Ncol,Mine,Vicini):- 
 vincolo_mine_righe(Nrighe,Ncol,Mine,Vicini), 
 Nrighe1 is Nrighe-1, 
 vincolo_mine(Nrighe1,Ncol,Mine,Vicini). 
vincolo_mine_righe(_Riga,0,_Mine,_Vicini):- !. 
vincolo_mine_righe(Riga,Ncol,Mine,Vicini):- 
 nth1(Riga,Vicini,RigaVicini), 
 nth1(Ncol,RigaVicini,Num), 
 estrai_confinanti(Riga,Ncol,Mine,Confinanti), 
 occurrences(1,Confinanti,Num), 
 Ncol1 is Ncol-1, 
 vincolo_mine_righe(Riga,Ncol1,Mine,Vicini). 