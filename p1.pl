elemInList([],_):- false.
elemInList([X|_], X):- true.
elemInList([_|T], X):-
    elemInList(T, X).

list2Set([], []).
list2Set([H|T],S):-
    elemInList(T,H),
    list2Set(T, S).
list2Set([H|T],[H|S]):-
    list2Set(T,S).

    
gcd(0,X,X):-!.
gcd(X,Y,Z):-
    X >= Y,
    X1 is X - Y,
    gcd(X1, Y, Z).
gcd(X,Y,Z):-
    Y > X,
    Y1 is Y - X,
    gcd(X, Y1, Z).



gcdL([H],Z):-gcd(0,H,Z).
gcdL([H,H1|T],Z):-gcd(H,H1,X),gcdL([X|T],Z).
