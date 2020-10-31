%from list to number
ltn([],1,0).
ltn([H|T],Z1,X1):-
    ltn(T,Z,X),
    X1 is H * Z + X,
    Z1 is Z * 10.

%from number to list
ntl(0,[]):-!.
ntl(N,[H|L]):-
    H is N mod 10,
    N1 is N // 10,
    ntl(N1,L).

%revrese the list
rev([],X,X).
rev([H|T],X,A):-
    rev(T,X,[H|A]).

trev(L,R):-rev(L,R,[]).

%resolve
res(L,NR,R):-
	!,
    ltn(L,_,X),
    X1 is X * NR,
    ntl(X1,Q),
    trev(Q,R).

maxL([],X,X).
maxL([H|T],X,R):-
    H > X,!,
    X1 is H,
	maxL(T,X1,R)
    .
maxL([_|T],X,R):-
    maxL(T,X,R).

trep(L,R):-maxL(L,-1,M),
    rep(L,M,1,R).

rep([],_,_,[]).
rep([H|T],M,I,[I|L]):-
    H =:= M,
    !,
    I1 is I + 1,
    rep(T,M,I1,L).
rep([_|T],M,I,L):-
    I1 is I + 1, 
    rep(T,M,I1,L).

res([],[]).
res([H|T],[X|L]):-
    is_list(H),!,
    trep(H,X),
    res(T,L).
res([H|T],[H|L]):-
    res(T,L).