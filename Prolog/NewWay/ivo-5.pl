nat(0).
nat(X):- nat(N), X is N + 1.

gen_KS(1, S, [S]).
gen_KS(K,S,[H|T]):-
    K>1,
    between(0, S, H),
    S1 is S - H,
    K1 is K - 1,
    gen_KS(K1,S1,T).

gen_pair(A,B):-
    nat(S),
    gen_KS(2,S,[A,B]).

gen_fin_seq_nat(L):-
    gen_pair(K,S),
    gen_KS(K,S,L).

% gen_fin_subset_Nat(S)
gen_fin_subset_Nat([]).
gen_fin_subset_Nat(S) :-
    gen_fin_seq_nat(S),
    encodes_subset(S).

encodes_subset([]).
encodes_subset([_]).
encodes_subset([A, B | T]) :-
    A < B,
    encodes_subset([B | T]).

encodes_subset_not(L) :-
    not((append(_, [A, B | _], L), A >= B)).

%arithetic progression
int1(N,Z):- N mod 2 =:= 0, Z is N div 2.
int1(N,Z):- N mod 2 =:= 1, Z is (-(N-1)div 2)-1.

int(0,0).
int(N,N):-N>0.
int(N,Z):-N>0, Z is -N.


gen_ar_prog([]).
gen_ar_prog(P):-
    nat(N),
    gen_KS(3,N,[L,K,M]),
    L>0,
    int(K,A0),
    int(M,D),
    gen_ar_prog(L,A0,D,P).

gen_ar_prog(1,A0,0,[A0]).
gen_ar_prog(L,A0,D,P):-
    L>1,
    gen_ar_prog_with_rec(L,A0,D,P).

gen_ar_prog_with_rec(1, A0, _, [A0]).
gen_ar_prog_with_rec(L,A0,D,[A0|P]):-
    L>1,
    L1 is L - 1,
    A1 is A0 + D,
    gen_ar_prog_with_rec(L1,A1,D,P).

% q(A, [X, Y], [Z, U]) -> given A - natural number
% generate [X, Y], [Z, U] wich represent rational numbers
% such that Y > X > 0, Z > U > 0
% and (X / Y) * (Z / U) = 2
% X + Z < A
q(A, [X,Y],[Z,U]):-
    gen_two_pos_rat_num([X,Y],[Z,U]),
    Y > X,
    Z > U,
    X + Z < A,
    X * Z =:= 2 * Y * U.

gcd(0,B,B).
gcd(A,B,D):-
    A > 0,
    R is B mod A,
    gcd(R,A,D).

gen_4_tupples_nat(A,B,C,D):-
    nat(S),
    gen_KS(4,S,[A,B,C,D]).

gen_two_pos_rat_num([A,B],[C,D]):-
    gen_4_tupples_nat(A,B,C,D),
    A > 0,
    B > 0,
    C > 0,
    D > 0,
    gcd(A,B,1),
    gcd(C,D,1).

% gen_in_circle([XC, YC], R, [X, Y])
% given integers XC, YC and R, R is positive
% generate integers X and Y such that
% (X, Y) is point inside the circle with center (XC, YC) and radius R.

% solution 1: generate (A, B) inside the circle with center (0, 0) and radius R.
% (X, Y) = (A + XC, B + YC)
% (A, B) : -R <= A <= R, -R <= B <= R, A^2 + B^2 <= R^2

gen_in_square(R,A,B):-
    MR is -R,
    between(MR,R,A),
    between(MR,R,B).

gen_in_circe_00(R,A,B):-
    gen_in_square(R,A,B),
    A^2 + B^2 =< R.

gen_in_circle([XC,YC],R,[X,Y]):-
    gen_in_circe_00(R,X1,Y1),
    X is X1 + XC,
    Y is Y1 + YC.

gen_in_circle_2([XC,YC],R,[X,Y]):-
    gen_in_square(R,X,Y),
    (X - XC)^2 + (Y - YC)^2 =< R^2.

% gen_int_closed(L, M): given list of integers L generate M such that
% SET(M) is subset SET(L)
% M represents set (there is no element repetition)
% M is integer closed: (forall a in M)(exist b in L)({a + b, a - b, a * b} is subset of M)

% example L = [1, 2, 0], M = [0], M = [1, 2]
gen_int_closed(L, M) :-
    distinct_elements(L, S),
    subset(S, M),
    is_integer_closed_with_not(M, S).

subset([],[]).
subset([H|T],[H|ST]):- subset(T,ST).
subset([_|T],ST):-subset(T,ST).

distinct_elements([],[]).
distinct_elements([H|T],R):-
    distinct_elements(T,D),
    insert_distinct(H,D,R).

insert_distinct(X,D,[X|D]):-not(member(X, D)).
insert_distinct(X,D,D):-member(X,D).

member(X,[X|_]).
member(X,[H|T]):-
    X\=H,
    member(X,T).

is_element_closed(E, M, L) :-
    member(X, M),
    A is E + X,
    B is E - X,
    C is E * X,
    member(A, L),
    member(B, L),
    member(C, L).

is_integer_closed_with_not(M,L):-
    not((member(A,M),not(is_element_closed(A,M,L)))).