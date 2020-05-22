nat(0).
nat(N):-nat(K),N is K + 1.

get_pair_of_nats(X,Y):-
    nat(Sum),
    between(0, Sum, X),
    Y is Sum - X.

between(A,B,A):-A=<B.
between(A,B,X):-
    A<B,
    A1 is A+1,
    between(A1,B,X).


get_nat_K(K,T):-nat(Sum),gen_KS(K,Sum,T).

gen_KS(1,Sum,[Sum]).
gen_KS(K,Sum,[H|T]):-
    K>0,
    between(0,Sum,H),
    K1 is K-1,
    S is Sum-H,
    gen_KS(K1,S,T).

get_union_nat_k(T):-
    get_pair_of_nats(K,Sum),
    K>0,
    gen_KS(K,Sum,T).

%Z^2
get_pair_of_ints(A,B):-
    get_pair_of_nats(N,K),
    int(N,A),
    int(K,B).

int(N,Z):- N mod 2 =:=0,Z is N div 2.
int(N,Z):- N mod 2 =:=1,Z is -((N-1) div 2)-1.