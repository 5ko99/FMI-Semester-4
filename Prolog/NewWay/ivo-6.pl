% in_circle_rat([P, Q], [[A, B], [C, D]]) :
% Given [P, Q] wich represents a rational number
% generate point [[A, B], [C, D]] with rational cordinates such that
% it is insice the circle with radius [P, Q] and center (0, 0).

% circle: x^2 + y^2 <= R^2
% (a / b)^2 + (c / d)^2 <= (p / q)^2
% (a^2 / b^2) + (c^2 / d^2) <= p^2 / q^2
% ((a^2.d^2) + (c^2.b^2)) / (b^2 . d^2) <= p^2 / q^2 | . b^2.d^2.q^2
% a^2.d^2.q^2 + c^2.b^2.q^2 <= p^2.b^2.d^2
% (a.d.q)^2 + (c.b.q)^2 <= (p.b.d)^2

nat(0).
nat(N):- nat(K), N is K + 1.

int(0,0).
int(N,N):-N>0.
int(N,MN):-N>0,MN is -N.

gcd(0, B, B) :- B =\= 0.
gcd(A, B, D) :-
    A =\= 0,
    R is B mod A,
    gcd(R, A, D).

gen_KS(1,S,[S]).
gen_KS(K,S,[H|T]):-
    K>0,
    between(0, S, H),
    K1 is K - 1,
    S1 is S - H,
    gen_KS(K1,S1,T).

gen_4_tup_nat(A,B,C,D):-
    nat(S),
    gen_KS(4,S,[A,B,C,D]).

between1(A,B,A):-A=<B.
between1(A,B,D):-
    A<B,
    A1 is A + 1,
    between1(A1,B,D).

gen_pair_rat([P,B],[Q,D]):-
    gen_4_tup_nat(A,B,C,D),
    B>0,
    D>0,
    gcd(A,B,1),
    gcd(C,D,1),
    int(A,P),
    int(C,Q).
    

gen_in_circle_rat([P, Q], [[A, B], [C, D]]) :-
    gen_pair_rat([A, B], [C, D]),
    (A * D * Q)^2 + (C * B * Q)^2 =< (P * B * D)^2.

%is_graph
is_graph([V,E]):-
    not(((append(_,[A,B|_]),V),A>=B)),
    not((member(X, V),member(Y,V),member([X,Y],E),
    not((X<Y,not(member([Y,X],E)))))).

%hamilton
is_hamiltonian([V,E]):-
    permutate(V,[Start|Rest]),
    check_path([V|E],[Start|Rest]),
    last_in_list([Start|Rest],End),
    edge([V|E],[End,Start]).

last_in_list(L,X):-append(_,[X],L).

edge([V,E],[X,Y]):-
    X<Y,
    member(X,V),
    member(Y,V),
    member([X,Y],E).
edge([V,E],[X,Y]):-
    X>Y,
    member(X,V),
    member(Y,V),
    member([Y,X],E).

permutate([],[]).
permutate([H|T],P):- permutate(T,PT),insert(H,PT,P).

insert(X,L,R):- append(P,S,L),append(P,[X|S],R).

check_path([_,_],[_]).
check_path([V,E],[X,Y|Rest]):-
    edge([V,E],[X,Y]),
    check_path([V,E],[Y|Rest]).