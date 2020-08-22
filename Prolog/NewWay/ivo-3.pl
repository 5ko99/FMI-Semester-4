append([],X,X).
append([H|T],L,[H|R]):-append(T,L,R).

join([], []).
join([L | LS], R) :- join(LS, T), append(L, T, R).

partitition([],[]).
partitition([[H]|P],[H|T]):-partitition(P,T).
partitition([[H|HP]|TP],[H|T]):-partitition([HP|TP],T).

partitition3(L,R):-join(R,L).

partitition2([],[]).
partitition2(L,[P|PS]):-
    append(P,S,L),
    P\=[],
    partitition2(S,PS).


%ARITHMETICS

min(A,B,A):-A=<B.
min(A,B,B):-A>B.

%min element of list
min([M],M).
min([H|T],M):-min(T,MT),min(H,MT,M).

%N is the lenthg of L
lenthg([],0).
lenthg([_|T],N):-lenthg(T,NT), N is NT + 1.

%sum of list
sum([],0).
sum([H|T],N):-sum(T,TN), N is H + TN.

% list_element_at(L, X, N) -> is X the Nth element of L
list_element_at([H|_],H,0).
list_element_at([H|T],X,N):-
    H\=X,
    list_element_at(T,X,NT),
    N is NT + 1.

%find element at position
list_find_element_at_pos([H|_],H,0).
list_find_element_at_pos([_|T],X,N):-
    N>0,
    K is N - 1,
    list_find_element_at_pos(T,X,K).

%is list sorted
order1(A,B):-A=<B.

is_list_sorted([]).
is_list_sorted([_]).
is_list_sorted([A,B|T]):-
    order1(A,B),
    is_list_sorted([B|T]).

%bogo sort
insert(X,L,R):-append(P,S,L),append(P,[X|S],R).

permutate([],[]).
permutate([H|T],R):-
    permutate(T,PT),
    insert(H,PT,R).

bogo_sort(L,S):-permutate(L,S),is_list_sorted(S). 
%quick_sort
add(H,X,L,B,[H|L],B):-H=<X.
add(H,X,L,B,L,[H|B]):-H>X.

split([],_,[],[]).
split([H|T],X,Less,Bigger):-
    split(T,X,L,B),
    add(H,X,L,B,Less,Bigger).

quick_sort([],[]).
quick_sort([H|T],S):-
    split(T,H,Less,Bigger),
    quick_sort(Less,SortedLess),
    quick_sort(Bigger,SoredBigger),
    append(SortedLess,[H|SoredBigger],S).

%char vects
insert_first(_,[],[]).
insert_first(X,[H|T],[[X|H]|RS]):-insert_first(X,T,RS).

char_vec(0,[[]]).
char_vec(N,CN):-
    N>0,
    K is N - 1,
    char_vec(K,CK),
    insert_first(0,CK,Zeros),
    insert_first(1,CK,Ones),
    append(Zeros,Ones,CN).

%checks and generates int between A and B -> X
between(A,B,A):-A=<B.
between(A,B,X):-
    A<B,
    A1 is A + 1,
    between(A1,B,X).
% 1 5 -> 1
% 2 5 -> 2
% 3 5 -> 3
% 4 5 -> 4
% 5 5 -> 5

%range generates list
range(A,B,[]):-A>B.
range(A,B,[A|T]):- A=<B,A1 is A + 1,range(A1,B,T).

between_with_range(A,B,X):-range(A,B,L),member(L,X).

member([X|_],X).
member([_|T],X):-member(T,X).

% list_of_K_elements_between_A_and_B(L, K, A, B) -> L is list with 
%length K and elements each between A and B.
list_of_K_elements_between_A_and_B([],0,_,_).
list_of_K_elements_between_A_and_B([H|T],K,A,B):-
    K>0,
    N is K - 1,
    between(A,B,H),
    list_of_K_elements_between_A_and_B(T,N,A,B).

% variations_with_repetitions(V, K, L) -> V is list of 
%length K and each element is element of L
variations_with_repetitions([],0,_).
variations_with_repetitions([H|T],K,L):-
    K > 0,
    N is K - 1,
    member(L,H),
    variations_with_repetitions(T,N,L).

list_of_K_elements_between_A_and_B_with_range(L, K, A, B):- 
    range(A, B, R), 
    variations_with_repetitions(L, K, R).

% gen_K_sum_S(K, S, L) -> L is list with length 
%K and elements naturals with sum S.
gen_K_sum_S(1,S,[S]).
gen_K_sum_S(K,S,[H|T]):-
    K>1,
    between(0,S,H),
    N is K - 1,
    M is S - H,
    gen_K_sum_S(N,M,T).