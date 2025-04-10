:-lib(fd).
:-[automobili].

auto(Cerchi, Aria, Navig):-
    findall([Id,End,Cl,Ac,Nav], rich(Id,End,Cl,Ac,Nav), Rich),

    get_durate(Rich, Cerchi, Aria, Navig).


get_durate([],[],[],[]).
get_durate([[Id,Endtime,1,Fa,Fn]|Rr], [[Id,Endtime]|Rc], Aria, Navig):-
    get_durate([[Id,Endtime,0,Fa,Fn]|Rr], Cerchi, Aria, Navig),
    get_durate(Rr, Cerchi, Aria, Rn).

get_durate([[Id,Endtime,_,1,Fn]|Rr], Cerchi, [[Id,Endtime]|Ra], Navig):-
    get_durate([[Id,Endtime,_,0,Fn]|Rr], Cerchi, Aria, Navig),
    get_durate(Rr, Cerchi, Aria, Rn).

get_durate([[Id,Endtime,_,_,1]|Rr], Cerchi, Aria, [[Id,Endtime]|Rn]):-
    get_durate([[Id,Endtime,_,_,0]|Rr], Cerchi, Aria, Navig),
    get_durate(Rr, Cerchi, Aria, Rn).

get_durate([[Id,Endtime,0,0,0]|Rr], Cerchi, Aria, [[Id,Endtime]|Rn]):-
    get_durate(Rr, Cerchi, Aria, Rn).


