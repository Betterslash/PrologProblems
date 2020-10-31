sbs([],_,_,_,[]).
sbs([_|T],V,[],P,L):-!,
    sbs(T,V,P,P,L)
.
sbs([H|T],V,[X|Q],P,[X|L]):-
    V =:= H,!,
    sbs([H|T],V,Q,P,L)
.
sbs([H|T],V,Q,P,[H|L]):-
    H \= V,
    sbs(T,V,Q,P,L)
.
tsbs(L,X,L1,R):-sbs(L,X,L1,L1,R).

pe([H|_],H).

esl([],_,[]).
esl([H|T],M,[Z|X]):-
    is_list(H),
    !,
    pe(H,Q),
    tsbs(H,Q,M,Z),
    esl(T,M,X).
esl([H|T],M,[H|X]):-
    esl(T,M,X).