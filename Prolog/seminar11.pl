in_union(X,A,B):-member(X, A);member(X,B).

isIntersection(X,A,B):-member(X,A),member(X,B).

inDifference(X,A,B):-member(X,A),not(member(X,B)).

isSubsetOf(A,B):-not((member(X,A),not(member(X,B)))).

areEqualSets(A,B):-isSubsetOf(A,B),isSubsetOf(B,A).

%removeDuplicates->to Set
toSet([],[]).
toSet([H|T],S):-
    member(H,T),
    toSet(T,S).
toSet([H|T],[H|S]):-
    not(member(H,T)),
    toSet(T,S).

palindrome(L):-reverse(L, L1),L=L1.

less(X,Y):- X=<Y.



minElement(L,X):-
    member(X,L),
    not((member(Y,L),not(less(X,Y)))).

minTwoElements(A,B,A):-less(A,B).
minTwoElements(A,B,B):-not(less(A,B)).

minElement2([M],M).
minElement2([H|T],M):-
    minElement2(T,N),
    minTwoElements(N,H,M).

remove(L,X,Rest):-
    append(A,[X|B],L),
    append(A,B,Rest).

%selectionSort
selectionSort([],[]).
selectionSort(L,[Min|R]):-
    minElement2(L,Min),
    remove(L,Min,Rest),
    selectionSort(Rest,R).


%mergeSort
mergeSort([],[]).
mergeSort([X],[X]).
mergeSort(L,R):-
    L\=[],
    split(L,LL,RL),
    mergeSort(LL,R1),
    mergeSort(RL,R2),
    merge(R1,R2,R).

split([],[],[]).
split([X],[X],[]).
split([A,B|T],[A|LR],[B,RR]):-
    split(T,LR,RR).

merge([],B,B).
merge(A,[],A).
merge([H1|LL],[H2|RL],[H1|R]):-
    less(H1,H2),
    merge(LL,[H2|RL],R).
merge([H1|LL],[H2|RL],[H1|R]):-
    not(less(H1,H2)),
    merge([H1|LL],RL,R).

%L T R
add(X,[],[[],X,[]]).
add(X,[L,Root,R],[L1,Root,R]):-less(X,Root),add(X,L,L1).
add(X,[L,Root,R],[L,Root,R1]):-not(less(X,Root)),add(X,R,R1).

makeTree([],[]).
makeTree([H|L],T):-makeTree(L,T1),add(H,T1,T).

ltr([],[]).
ltr([L,Root,R],List):-
    ltr(L,LList),
    ltr(R,RList),
    append(LList,[Root|RList],List).

treeSort(L,S):-makeTree(L,T),ltr(T,S).
