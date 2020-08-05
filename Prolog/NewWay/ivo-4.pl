nat(0).
nat(N):-nat(K),N is K + 1.

%gen ordered pair of nat
between1(A, B, A):-A=<B.
between1(A,B,X):-A<B,A1 is A + 1,between1(A1,B,X).

gen_order_pair_of_nat(X,Y):-
    nat(Sum),
    between1(0,Sum,X),
    Y is Sum - X.

%cikli - b(A, B, X) :- A =< B, nat(A), nat(B), nat(X), A =< X, X =< B.

%N^K
gen_KS1(1,S,[S]).
gen_KS1(K,S,[H|T]):-
    K > 1,
    between1(0,S,H),
    K1 is K - 1,
    S1 is S - H,
    gen_KS1(K1,S1,T).

gen_nat_k(K,L):-nat(Sum),gen_KS1(K,Sum,L).

% U_{k in N_+} N^k -> N U (N x N) U (N x N x N) U ...
gen_union_Nat_K(T) :-
    gen_order_pair_of_nat(K, Sum),
    K > 0,
    gen_KS1(K, Sum, T).

%Z^2
int(N,Z):- N mod 2 =:= 0, Z is N div 2.
int(N,Z):- N mod 2 =:= 1, Z is ( - (N - 1) div 2) - 1.

gen_pair_of_ints(A,B):-
    gen_order_pair_of_nat(N,K),
    int(N,A),
    int(K,B).