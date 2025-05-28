:-lib(fd).


% Data la sequenza di ingresso Lin, produce una lista L
% che contiene le posizioni finali delle auto.
% Es sequencing([rosso, giallo, rosso, verde, giallo],L,2) da`
% L = [ 1 , 3 , 2 , 5 , 4 ]
% che significa che la prima auto rossa rimane in posizione 1
% la prima gialla va in posizione 3
% la seconda rossa in posizione 2, ecc.

robot(Sequenza, MaxD, L):-
    length(Sequenza, N),
    length(L, N),
    L :: 1..N,

    vincolo_dist(L,1,MaxD),
    alldifferent(L),
    objective(L, Sequenza, C),

    minimize(labeling(L), C).

objective([_],_,0):-!.
objective([P|L],[Col|Lcol],Obj):-
    objective_loop(P,L,Col,Lcol,ObjLoop),
    objective(L,Lcol,Obj1),
    Obj #= ObjLoop+Obj1.

objective_loop(_,[],_,[],0).
objective_loop(P,[_|L],Col,[Col|Lcol],Obj):- !,
    objective_loop(P,L,Col,Lcol,Obj).
objective_loop(P,[P1|L],Col,[Col1|Lcol],Obj):- !,
    Col \= Col1,
    P-P1 #= 1 #<=> Bool1,
    P1-P #= 1 #<=> Bool2,
    Obj #= ObjLoop+Bool1+Bool2,
    objective_loop(P,L,Col,Lcol,ObjLoop).
    
    
vincolo_dist([],_,_).
vincolo_dist([H|T],N,MaxD):-
    H-N #=< MaxD,
    N-H #=< MaxD,
    N1 is N+1,
    vincolo_dist(T,N1,MaxD).