gcd(0,X,X):-!.
gcd(X,Y,Z):-
    X > Y,
    X1 is X - Y,
    gcd(X1, Y, Z).
gcd(X,Y,Z):-
    Y > X,
    Y1 is Y - X,
    gcd(X, Y1, Z).

lcm(X, Y, Z):-
    gcd(X,Y,T),
    Z is X * Y / T.
.

lcmL([H],R):-
    lcm(H, H, R)
.
lcmL([X,X1|T],R):-
    lcm(X,X1,H),
    lcmL([H|T],R)
.

pow(0,1).
pow(Y,Z) :- Y1 is Y - 1,
              pow(Y1,Z1), 
              Z is Z1*2.


lenOfList([],0).
lenOfList([_|T],L):-
    lenOfList(T,L1),
    L is L1 + 1.


insertAt(Element,0,L,[Element|L]). 
insertAt(Element,Pos,[E|L],[E|ZL]):- 
    Pos1 is Pos-1,
    insertAt(Element,Pos1,L,ZL). 

insertAtPow(Element, [_|T], [E|T], 0, 1).
insertAtPow(Element, [_|T], [E|T], L, LT):-
    
    pow() < lenOfList(),
    insertAt(Element, )
.
