%Transforms a number in a list 
%Flow model: (i,o) 
splitRev(0,[]).
splitRev(N,[A|As]) :- N1 is floor(N/10), A is N mod 10, splitRev(N1,As).

%Reverses the elements in a list
%Flow model (i,i,o)
reverse([],Z,Z).
reverse([H|T],Z,Acc) :- reverse(T,Z,[H|Acc]).

sumaV(X1,X2,R):-
    reverse(X1,L1,[]),
    reverse(X2,L2,[]),
    suma(L1,L2,0,1,R).

sumaq(X1,X2,Result):-
    sumaV(X1,X2,R),
    splitRev(R,Q),
    reverse(Q,Result,[]),
    !
    .

%Takes two lists and returns their sum as numbers
%Flow model (i,i,i,i,o)
suma([],[],_,_,Ls):- Ls is 0.
suma([H|T],[],_,Z,Ls):-
    Z1 is Z * 10,
    suma(T,[],_,Z1,Ls1),
    Ls is H * Z + Ls1  
    .
suma([],[H|T],_,Z,Ls):- 
    Z1 is Z * 10,
    suma([],T,_,Z1,Ls1),
    Ls is H * Z + Ls1  
    .
suma([H|T],[C|L],_,Z,Ls):-
    X1 is (H + C) * Z,
    Z1 is Z * 10,
    suma(T,L,X1,Z1,L1),
    Ls is L1 + X1
.


sumaL([],R):-R is 0.
sumaL([H|T],R1):-
    sumaL(T,R),
    R1 is R + H
.
sumaL(X,R):- R is X. 

sumaT([],[]).
sumaT([H|T],[X|L]) :- sumaT(T, L),
    sumaL(H,X)
.

%---------------------------------------------------------------------------------


%Goes over an eterogen list, checks if head is list or number,
%if list it adds the list to the temp result and calls the function with the final result as new temp result
%if number just passes over the number
%Flow model (i,i)
parc([],R):-write(R),!.
parc([H|T],L):-
    is_list(H),!,
    sumaq(H,L,R),
    parc(T,R),!
.
parc([H|T],L):-
    number(H),!,
    parc(T,L)
.











