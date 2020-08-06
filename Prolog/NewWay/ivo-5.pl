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