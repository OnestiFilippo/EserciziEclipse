:-lib(fd).

% vincolo =<

leq(A,B):-
	dvar_domain(A,DomA),
	dvar_domain(B,DomB),
	dom_range(DomA, MinA, MaxA),
	dom_range(DomB, MinB, MaxB),
	dvar_remove_smaller(B, MinA),
	dvar_remove_greater(A,MaxB),
	( var(A), var(B)
	  ->	suspend(leq(A,B), 3, [A->fd:min, B->fd:max])
	  ;	true
	).


% if_then_else(Cond, Then, _):-
%	call(Cond), !, call(Then).
% if_then_else(_, _, Else):-
%	call(Else).

% IN PROLOG
%	( Condizione
%         ->    Then
%         ;     Else
%       ),
