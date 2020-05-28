gen_KS(1,S,[S]).
gen_KS(K,S,[H|T]):-
    K>0,
    between(0, S, H),
    N is S - H,
    K1 is K-1,
    gen_KS(K1,N,T).

nat(0).
nat(X):-nat(M), X is M+1.

%gen_union_N_K(L)-> L is union(k in N_+) N^k
gen_fin_seq_nat(L):-
    nat(N),
    gen_KS(2,N,[K,S]),
    gen_KS(K,S,L).


gen_fin_subset_nat([]).
gen_fin_subset_nat(S):-
    gen_fin_seq_nat(S),
    encodes_subset(S).

encodes_subset([]).
encodes_subset([_]).
encodes_subset([A,B|T]):-
    A<B,
    encodes_subset([B|T]).

encodes_subset_not(L):-
    not((append(_,[A,B|_],L),A>=B)).

%gen Arithetic progression
gen_ar_prog([]).
gen_ar_prog(P):-
    nat(N),
    gen_KS(3,N,[L,A0,D]),
    L > 0,
    gen_ar_prog(L,A0,D,P).

gen_ar_prog(1,A0,0,[A0]).
gen_ar_prog(L,A0,D,P):-
    L>1,
    gen_ar_prog_with_rec(L,A0,D,P).

gen_ar_prog_with_rec(1,A0,_,[A0]).
gen_ar_prog_with_rec(L,A0,D,[A0|P]):-
    L>1,
    L1 is L - 1,
    A1 is A0 + D,
    gen_ar_prog_with_rec(L1,A1,D,P).



%Q
q(A,[X,Y],[Z,U]):-
    gen_two_pos_rat_num([X,Y],[Z,U]),
    Y>X,Z>U,
    X+Z<A,
    X*Z =:= 2 * Y * U.

%Euqlid Greatest Common Divider
%B = Q * A + R
%A = Q1 * R + R1
%...
gcd(0,B,B).
gcd(A,B, D):-
    A>0,
    R is B mod A,
    gcd(R,A,D).

gen_4_tuples_nats(A,B,C,D):-
    nat(N),
    gen_KS(4,N,[A,B,C,D]).

gen_two_pos_rat_num([X,Y],[Z,U]):-
    gen_4_tuples_nats(X,Y,Z,U),
    X>0,
    Y>0,
    Z>0,
    U>0,
    gcd(X,Y,1),
    gcd(Z,U,1).

%gen in circle([XC,YC],R,[X,Y])
%given int XC YC and R is positive
%generete int X and Y such that
%(X,Y) is point inside the circle with center (XC,YC) and radius R

%sol1
gen_in_square(R,A,B):-
    MR is -R,
    between(MR,R,A),
    between(MR,R,B).

gen_in_circle_00(R,A,B):-
    gen_in_square(R,A,B),
    A^2 + B^2 =<R^2.

gen_in_circle1([XC,YC],R,[X,Y]):-
    gen_in_circle_00(R,A,B),
    X is A + XC,
    Y is B + YC.

%sol2: (X-XC)^2 + (Y-YC)^2=<R^2

%TASK:
%gen_int_closed(L,M): given list of int
% L generete M such that
%SET(M) is subset SET(L)
%M represents set(there is no el repettition)
%M is int closed:
%(forall a in M)(exist b in M)
%({a+b,a-b,a*b} is subset of L)

%example L=[1,2,0]; M=[0]; M =[1,2]

gen_int_closed(L,M):-
    distinct_elements(L,S),
    subset(M,S),
    is_integer_closed(M,L).

subset([],[]).
subset([H|T],[H|S]):-subset(T,S).
subset([_|T],S):-subset(T,S).

distinct_elements([],[]).
distinct_elements([H|T],R):-
    distinct_elements(T,D),
    insert_distinct(H,D,R).

insert_distinct(E,D,D):-member(E, D).
insert_distinct(E,D,[E|D]):- not(member(E,D)).

%with rec
is_integer_closed([],_).
is_integer_closed([H|T],L):-
    is_integer_closed(T,L),
    is_element_closed(H,L). 

is_element_closed(E,L):-
    member(X, L),
    A is E + X,
    B is E - X,
    C is E * X,
    member(A,L),
    member(B, L),
    member(C,L).
    
    

