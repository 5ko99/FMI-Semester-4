min(A,A,B):- A=<B.
min(B,A,B):- A>B.

%min(M,L) m is the min el, of L
min(M,[M]).
min(M,[H|T]):-
    min(MT,T),
    min(M,MT,H).

index_in_list(X,[X|_],0).
index_in_list(X,[H|T],N):-
    X\=H,
    index_in_list(X,T,K),
    N is K+1.

%all positions same but without X\=H
all_index_in_list(X,[X|_],0).
all_index_in_list(X,[_|T],N):-
    all_index_in_list(X,T,K),
    N is K+1.

%result 0+K
t(X,[X|_],0).
t(X,[_|T],K+1):-
    t(X,T,K).

is_list_sorted([]).
is_list_sorted([_]).
is_list_sorted(A,B|T):-
    order(A,B),
    is_list_sorted([B|T]).

order(A,B):-A=<B.


insert(X,L,R):-
    append(P,S,L),
    append(P,[X|S],R).
    

permutate([],[]).
permutate([H|T],P) :-
    permutate(T,Q),
    insert(H,Q,P).

bogo_sort(L,S):- permutate(L,S), is_list_sorted(S).

quick_sort([],[]).
quick_sort([H|T],Sorted):-
    partition(T,H,Less,Bigger),
    quick_sort(Less,Sorted_Less),
    quick_sort(Bigger,Sorted_Bigger),
    append(Sorted_Less,[H|Sorted_Bigger],Sorted).

partition([],_,[],[]).
partition([H|T],X,Less,Bigger):-
    partition(T,X,L,B),
    add(H,X,L,B,Less,Bigger).

add(E,X,L,B,[E|L],B):-
    order(E,X).
add(E,X,L,B,L,[E|B]):-
    not(order(E,X)).
     

%char_veck(K,VS)->VS is the list of all bool vectors
char_vects(0,[[]]).
char_vects(K,VS):-
    K>0,
    N is K-1,
    char_vects(N,TS),
    insert_first(0,TS, Zeros),
    insert_first(1,TS,Ones),
    append(Zeros,Ones,VS).

insert_first(_,[],[]).
insert_first(X,[L|LS],[[X|L]|RS]):-
    insert_first(X,LS,RS).

%between(X,A,B)->chach/generates X(integer betwenn) A and B
between(A,A,B):-A=<B.
between(X,A,B):- A<B, A1 is A+1, between(X,A1,B).

%range(L,A,B)->L=[A,A+1,...,B]
range([],A,B):- A>B.
range([A|T],A,B):-
    A=<B,
    A1 is A+1,
    range(T,A1,B).

%between_with_range
between_with_range(X,A,B):-range(R,A,B), member(X, R).

member(X,[X|_]).
member(X, [_|T]):-member(X,T).

%list_of_K_elements_between_A_and_B(L,K,A,A)->L is list with len K and el between A and B
list_of_K_elements_between_A_and_B([],0,_,_).
list_of_K_elements_between_A_and_B([H|T],K,A,B):- 
    K>0,
    N is K-1,
    between(H,A,B),
    list_of_K_elements_between_A_and_B(T,N,A,B).

%variations_with_rep(V,K,L)-> V is list with len K and each element is element of L
variations_with_rep([],0,_).
variations_with_rep([H|T],K,L):-
    K>0,
    N is K -1,
    member(H, L),
    variations_with_rep(T,N,L).

%gen_K_sum_S(K,S,L)->L is list with len K and el naturals with sum S
gen_K_sum_S(1,S,[S]):-S>=0.
gen_K_sum_S(K,S,[H|T]):-
    K>1,
    N is K-1,
    between(H,0,S),
    M is S-H,
    gen_K_sum_S(N,M,T).
    