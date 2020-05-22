remove(X, [X | T],T).
remove(X, [H | T],[H | Z]):-
    remove(X,T,Z).

insert(X,L,NewL):-remove(X,NewL,L).

permutation([],[]).
permutation(List,[X|P]):-remove(X,List,Q),permutation(Q, P).

permutation1([],[]).
permutation1([H|T],R):-permutation1(T,Q),insert(H,Q,R).

removeAllX(_, [], []).
removeAllX(X, [X|T], Z) :-
    removeAllX(X, T, Z).
removeAllX(X, [H|T], [H|Z]) :-
    removeAllX(X, T, Z).

insertFront(X,L,[X|L]).

insertBack(X,[],[X]).
insertBack(X,[H|T],[H|Z]):-insertBack(X,T,Z).

member(X,L):-
    insert(X,_,L).

%Sort
less(X,Y):-X=<Y.

isSorted([]).
isSorted([_]).
isSorted([X, Y|T]):-
    less(X,Y),
    isSorted([Y|T]).

simpleSort(List,SortedList):-
    permutation1(List,SortedList),
    isSorted(SortedList).

%Prefix,Sufix,Infix
prefix(List,Prefix):-
    append(Prefix,_,List).

sufix(List,Sufix):-
    append(_,Sufix,List).

infix(List,Infix):-
    prefix(List,Prefix),
    sufix(Prefix,Infix).

infix1(List,Infix):-
    sufix(List,Sufix),
    prefix(Sufix,Infix).

reverse([], []).
reverse([X], [X]).
reverse([X|T], [Z|X]):-
    reverse(T, Z).


reverse1([], []).
reverse1([X], [X]).
reverse1([H|T],Rev):-
    reverse1(T,TR),
    append(TR,[H],Rev).  



    


