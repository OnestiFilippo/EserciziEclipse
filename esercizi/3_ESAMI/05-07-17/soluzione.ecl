:- lib(fd).
:- lib(fd_global).
:- lib(listut).
:- [pack_inst].

pip(Ldec):-
    findall([P1,P2],requires(P1,P2),Lreq),
    installed(Linst),
    package(Lpack),
    findall([P1,P2],conflict(P1,P2),Lconf),
    findall(P,install(P),Li),
    length(Lpack,Npack),
    length(Ldec,Npack),
    Ldec :: 0..1,
    install_constraint(Li,Ldec),
    require_constraint(Lreq,Ldec),
    conflict_constraint(Lconf,Ldec),
    objective(Linst,Ldec,Lcosts),
    fd_global:sumlist(Lcosts,F),
    minimize(labeling(Ldec),F).

install_constraint([],_).
install_constraint([H|T],LD):-
    nth1(H,LD,1),
    install_constraint(T,LD).

require_constraint([],_).
require_constraint([[A,B]|T],Ldec):-
    nth1(A,Ldec,VA),
    nth1(B,Ldec,VB),
    VA #=< VB,
    require_constraint(T,Ldec).

conflict_constraint([],_).
conflict_constraint([[A,B]|T],Ldec):-
    nth1(A,Ldec,VA),
    nth1(B,Ldec,VB),
    VA + VB #=< 1,
    conflict_constraint(T,Ldec).

objective([],[],[]).
objective([A|LA],[B|LB],[C|LC]):-
    A #\= B #<=> C,
    objective(LA,LB,LC).