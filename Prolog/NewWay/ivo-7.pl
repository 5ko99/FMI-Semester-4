%Exam 2020
a_h(0,0).
a_h(1,1).
a_h(N,A):-
    N>1,
    N1 is N - 1, 
    N2 is N - 2, 
    a_h(N1,B),
    a_h(N2,C), 
    A is 5*B*B + 3*C*C*C.

a(N,C):-
    between(0, N, CurN),
    a_h(CurN,C).

p(A):-not((a(A,C), C=:=A)).

%ivo
is_list_transversal([],_).
is_list_transversal([X|XS],Transversal):-
    member(A, X),
    member(A,Transversal),
    !,
    is_list_transversal(XS,Transversal).

is_list_transversal_with_not(L,T):-
    not((member(X,L),not((member(A,T),member(A,X))))).

%generete transversal
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

subseqance([],[]).
subseqance([_|T],RS):-
    subseqance(T,RS).
subseqance([H|T],[H|RS]):-
    subseqance(T,RS).

gen_list_transversal(L,T):-
    union_of_elements(L,LU),
    subseqance(LU,T),
    is_list_transversal(L,T).

%min transversal
% M is minimal transversal for set of set S if
% 1. M is transversal of S
% 2. (forall x in M)(M \ {x} is not transversal for S)

% not not (forall x in M)(M \ {x} is not transversal for S)
% not (exists x in M and not (M \ {x} is not transversal for S))
% not (exists x in M and (M \ {x} is transversal for S))
gen_min_transversal(L,T):-
    gen_list_transversal(L,T),
    not((
        remove_random_element(T,U),
        is_list_transversal(L,U)    
    )).

remove_random_element(L,R):-
    member(X,L),
    append(P,[X|S],L),
    append(P,S,R).

list_length([],0).
list_length([_|T],K):- list_length(T, N),K is N + 1.

gen_length_of_min_list_transversal(L, K) :-
    gen_min_transversal(L, M),
    list_length(M, K).

get_minimal_length_of_transversal(L, K) :-
    list_length(L, N),
    between(1, N, K),
    gen_min_transversal(L, M),
    list_length(M, K),
    K1 is K - 1,
    not((
        gen_min_transversal(L, T),
        list_length(T, K1)    
    )),
    !.

% gen_K_subsequnce(L, K, S)
% S is a subsequnce of L with length K
gen_K_subsequnce(_,0,[]).
gen_K_subsequnce([_|T],K,R):-
    K>0,
    gen_K_subsequnce(T,K,R).
gen_K_subsequnce([H|T],K,[H|R]):-
    K>0,
    K1 is K - 1,
    gen_K_subsequnce(T,K1,R).

gen_K_subsequnce1(L,K,R):-
    subseqance(L,R),
    list_length(R, K).
    


    
     

