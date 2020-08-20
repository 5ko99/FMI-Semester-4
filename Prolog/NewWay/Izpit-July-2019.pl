between1(A, B, A):-A=<B.
between1(A, B, R):- A<B,A1 is A+1,between1(A1,B,R).

isPrime(X):-
    X>1,
    X1 is X div 2,
    not((
        between1(2,X1,D),
        X mod D =:= 0    
    )).

nat(0).
nat(X):-nat(Y),X is Y + 1.

reverse([], []).
reverse([H|T],R):- reverse(T, RT), append1(RT,[H],R).

append1([],L,L).
append1([H|T],L,[H|R]):- append1(T,L,R).
    
epsilon(X,I):-
    I>=8,
    I1 is I - 1,
    between1(7,I1,X),
    X mod 6 =:= 1,
    isPrime(X).

epsilon_count(C,I):-epsilon_count(C,I,8,7).

epsilon_count(0,I,_,_):-I=<7.
epsilon_count(0,I,CurrI,_):-CurrI>I. 
epsilon_count(0,_,CurrI,CurrX):-CurrX>=CurrI.
epsilon_count(C,I,CI,CX):-
    I>7,
    CI =< I,
    CX < CI,
    CX1 is CX + 1,
    CI1 is CI + 1,
    epsilon(CX,I),
    epsilon_count(C1,I,CI1,CX1),
    C is C1 + 1.
epsilon_count(C,I,CI,CX):-
    I>7,
    CI =< I,
    CX < CI,
    CX1 is CX + 1,
    CI1 is CI + 1,
    not(epsilon(CX,I)),
    epsilon_count(C1,I,CI1,CX1),
    C is C1.

su(X):-
    between1(0,X,I),
    epsilon_count(EC,I),
    X =:= I + EC.

length1([],0).
length1([_|T], N):- length1(T, TN), N is TN + 1.

countPos([],0).
countPos([H|T],N):- H>0,countPos(T,N1), N is N1+1. 
countPos([H|T],N):- not(H>0),countPos(T,N).


%second task with lists from exam
is_two_element_list_from_nats([A,B]):- nat(A),nat(B).

gen_two_element_list_from_nats([A,B]):-
    nat(S),
    between1(0,S,A),
    B is S - A.

member1([H|_],H).
member1([_|T],E):-member1(T,E).

is_G_list(L):-
    not((
        member1(L,X),
        not(is_two_element_list_from_nats(X))
    )).

do([],_,0).
do([H|T],K,N):-
    is_first_element_of_list_K(H,K),
    do(T,K,N1),
    N is N1 + 1.
do([H|T],K,N):-
    not(is_first_element_of_list_K(H,K)),
    do(T,K,N).

is_first_element_of_list_K([K,_],K).
is_second_element_of_list_K([_,K],K).

di([],_,0).
di([H|T],K,N):-
    is_second_element_of_list_K(H,K),
    di(T,K,N1),
    N is N1 + 1.
di([H|T],K,N):-
    not(is_second_element_of_list_K(H,K)),
    di(T,K,N).

pairs(A,B):-
    nat(S),
    between1(0,S,A),
    B is S - A.

gen_K_S(1,S,[S]).
gen_K_S(K,S,[H|T]):-
    K > 1,
    between1(0,S,H),
    K1 is K - 1,
    S1 is S - H,
    gen_K_S(K1,S1,T).

e1g(L):-
    pairs(K,S),
    gen_K_S(K,S,L1),
    packTupples(L1,L),
    not((
        between1(0,S,T),
        do(L,T,O),
        di(L,T,I),
        not(abs(O-I)=<1)
    )).

packTupples([],[]).
packTupples([X,Y|T],[[X,Y]|RT]):- packTupples(T,RT).
    
abs(A,A):-A>=0.
abs(A,MA):-A<0, MA is -A.