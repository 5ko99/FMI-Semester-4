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


choose_KN(K, N, S) :- choose_from(K, 0, N, S).

choose_from(0, _, _, []).
choose_from(K, B, E, [H | T]) :-
    K > 0,
    K1 is K - 1,
    between(B, E, H),
    H1 is H + 1,
    choose_from(K1, H1, E, T).

gen_bin_tree(Height,Max,K,Tree):-
    Max1 is Max - 1,
    K1 is K - 1,
    choose_KN(K1,Max1,S),
    permutate([Max|S],V),
    gen_bin_tree_with_vertices(Height,V,Tree).

gen_bin_tree_with_vertices(Height,V,Tree):-
    gen_bin_tree_with_vertices_helper(Height, V, Tree, []).

gen_bin_tree_with_vertices_helper(-1,V,[],V).
gen_bin_tree_with_vertices_helper(H,[U|US],[LeftTree,U,RighTree],Rest):-
    H>=0,
    H1 is H - 1,
    between(-1,H1,HeightOfLeft),
    between(-1,H1,HeightOfRight),
    check_heights(HeightOfLeft, HeightOfRight, H1),
    gen_bin_tree_with_vertices_helper(HeightOfLeft,US,LeftTree,ForRight),
    gen_bin_tree_with_vertices_helper(HeightOfRight,ForRight,RighTree,Rest).


check_heights(A,_,A).
check_heights(A,B,B):-A<B.

permutate([], []).
permutate([H | T], P) :- permutate(T, Q), insert(H, Q, P).

insert(X, L, R) :- append(P, S, L), append(P, [X | S], R).

%Prime num
gen_prime(P):-
    gen_nat(P),
    isPrime(P).

isPrime(P):-
   P>1,
   P1 is P - 1,
   not((
        between(2,P1,D),
        P mod D =:= 0
   )).

% Q(i) -> count of primes of kind 6k + 1 wich are less then i
% check(X) <-> X = i + Q(i) for some i (positive natural)
check(X):-
    between(0,X,I),
    q(I,QI),
    X =:= I + QI.

q(I,K):- primes_from_above_type(I,PS),length(PS, K).

primes_from_above_type(I,PS):-
    I1 is I - 1,
    range(2,I1,L),
    filter(L,PS).

filter([],[]).
filter([N|NS],T):-not(condition(N)),filter(NS,T).
filter([N|NS],[N|T]):-condition(N),filter(NS,T).

condition(X) :- (X mod 6 =:= 1), isPrime(X).


range(A,B,[]):-A>B.
range(A,B,[A|R]):- A=<B, A1 is A + 1, range(A1,B,R).
