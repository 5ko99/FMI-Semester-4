nat(0).
nat(N):- nat(M), N is M + 1.

between(A, B, A):-A=<B.
between(A, B, C):- A<B, A1 is A + 1, between(A1, B, C).

genKS(1,S,[S]).
genKS(K,S,[H|T]):- 
    K>1,
    between(0,S,H),
    K1 is K - 1,
    S1 is S - H,
    genKS(K1,S1,T).

isPrime(P):-
    P>1,
    P1 is P - 1,
    not((
        between(2,P1,D),
        P mod D =:= 0  
    )).

gen_ar_prog([A0],A0,0,1):-A0>1,not(isPrime(A0)).
gen_ar_prog(P,A0,D,S):-
    S>1,
    gen_ar_prog_rec(P,A0,D,S).

gen_ar_prog_rec([A0],A0,_,1):-A0>1,not(isPrime(A0)).
gen_ar_prog_rec([A0|T],A0,D,S):-
    S>1,
    A0>1,not(isPrime(A0)),
    A1 is A0 + D,
    S1 is S - 1,
    gen_ar_prog_rec(T,A1,D,S1).

gen_ar_prog(L):-
    nat(N),
    genKS(3,N,[A0,D,S]),
    S>0,
    gen_ar_prog(L,A0,D,S).



%II
check(X):-
    X>1,
    not((
        A is X//2,
        between(0,A,N),
        X =:= N * N    
    )).

gen_geom_prog([A0],A0,1,1):-check(A0).
gen_geom_prog(L,A0,D,S):-
    S>1,
    gen_geom_prog_rec(L,A0,D,S).

gen_geom_prog_rec([A0],A0,_,1):-check(A0).
gen_geom_prog_rec([A0|T],A0,D,S):-
    S>1,
    check(A0),
    S1 is S - 1,
    A1 is A0 * D,
    gen_geom_prog_rec(T,A1,D,S1).

gen_geom_prog(L):-
    nat(N),
    genKS(3,N,[A0,D,S]),
    D>0, S>0,%I want D>1
    gen_geom_prog(L,A0,D,S).

%2.I
p1([[]|_]).
p1([H|T]):- H\=[], p1(T).

p2([A,B]):-not(subset(A,B)),not(subset(B,A)).
p2([Y|T]):-
    member(Z, [Y|T]),
    Z\=Y,
    not(subset(Y,Z)),
    p2(T).

subset([],_).
subset([H|T],S):-
    member(H, S),
    subset(T,S).

% member(X, [X|_]).
% member(X,[_|T]):- member(X, T).

%p3 [[1],[2,4,3],[1,2,3,4]]
p3(L):-
    union_of_elements(L,U),
    member(U, L).

set_minus([],_,[]).
set_minus([X|S],M,R):-
    set_minus(S,M,R),
    member(X, M).
set_minus([X|S],M,[X|R]):-
    set_minus(S,M,R),
    not(member(X, M)).

union_of_elements([],[]).
union_of_elements([L|LS],U):-
    union_of_elements(LS,R),
    set_minus(L,R,T),
    append(T,R,U).

% append([],L,L).
% append([H|T],L,[H|R]):- append(T,L,R).

%p4 =:= for every((Y in X) exists((Z in X) not(Z is subset of Y)))
p4(X):- not(p3(X)).

%II group
u2(X):- member(Y,X),member(Z,X),Y\=Z,not(commonElements(Y,Z)).

commonElements(A,B):-
    member(X,A),
    member(X,B).    

%{{1,2,3},{3,2,7},{2,3}} intersect
u3(X):- intersect(X,XI),member(XI,X).

intersect([],[]).
intersect([A],A).
intersect([H|T],I):-
    intersect(T,TI),
    intersect(H,TI,I).

intersect([],_,[]).
intersect([H|T],B,[H|BI]):-member(H,B),intersect(T,B,BI).
intersect([H|T],B,BI):-not(member(H,B)),intersect(T,B,BI).

%u4
u4(X):-
    not((
        member(Y,X),
        not((
            member(Z,X),
            emptyIntersect(Y,Z)
        ))    
    )).

emptyIntersect(A,B):-not(commonElements(A,B)).

%list of lists
list_of_lists([]).
list_of_lists([[]]).
list_of_lists([[_]]).
list_of_lists([H|T]):-
    is_list(H),
    list_of_lists(T).

is_list1([_]).
is_list1([_|_]).
    