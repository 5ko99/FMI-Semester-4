gen_KS(1, S, [S]).
gen_KS(K, S, [H | T]) :-
    K > 1,
    K1 is K - 1,
    between(0, S, H),
    SH is S - H,
    gen_KS(K1, SH, T).

gen_nat(0).
gen_nat(N) :- gen_nat(K), N is K + 1. 

gen_nat_triple(A, B, C) :-
    gen_nat(N),
    gen_KS(3, N, [A, B, C]).

gen_bin_tree(Tree) :-
    gen_nat_triple(Height, Max, K),
    gen_bin_tree(Height, Max, K, Tree).

