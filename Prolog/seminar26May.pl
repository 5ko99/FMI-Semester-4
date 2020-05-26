%array length
length1([],0).
length1([_|T],N):-
    length1(T,M),
    N is M+1.

%Sum of elements
sum([],0).
sum([H|T],N):-
    sum(T,M),
    N is M + H.

%n-th element
n_th_element([H|_], H, 0).
n_th_element([_|L],E,N):-
    n_th_element(L,E,M),
    N is M + 1.

%Generete all natural numbers
nat(0).
nat(N):- nat(M), N is M+1.

natRecognise(0).
natRecognise(N):- N>0,M is N-1, natRecognise(M).

%even
evenGenerator(0).
evenGenerator(N):- evenGenerator(M),N is M+2.

evenGenerator2(N):-nat(M), N is M*2.

isEven(N):- N mod 2 =:=0.

evenGenerator3(N):-nat(N),isEven(N).

oddGenerator(N):-evenGenerator(M), N is M+1.

oddGenerator1(N):- nat(N),not(isEven(N)).


%between
between1(L,R,L):-L=<R.
between1(L,R,X):-
    L<R,
    L1 is L + 1,
    between1(L1,R,X).

%pair
pairs(N,M):-
    nat(S),
    between(0, S, N),
    M is S-N.

%range
range(L,L,[L]).
range(L,R,[L|T]):-
    L<R,
    L1 is L + 1,
    range(L1,R,T).
    

%fibonachi
fib(0,0).
fib(1,1).
fib(N,X):-
    N>1,
    N1 is N -1,
    N2 is N-2,
    fib(N1,A),
    fib(N2,B),
    X is A + B.

fib(X):-nat(N),fib(N,X).

%alt sol Fib
fibonacci(0,0,1).
fibonacci(N,L,R):-
    fibonacci(N1,L1,L),
    N is N1+1,
    R is L1+L.

fibonacci(X):-fibonacci(_,X,_).

%A0=A1=2
%An-2=2*An+1 - An + n
someSequance(0,2,2).
someSequance(N2,L,R):-
    someSequance(N1,L1,L),
    N2 is N1 + 1,
    R is 2*L - L1 + N1-1.

someSequance(X):-someSequance(_,X,_).

%finite sequacns on nat
s_vectors([H],1,H).
s_vectors([H|T],K,S):-
    K>0,
    between(0, S, H),
    K1 is K - 1,
    S1 is S - H,
    s_vectors(T,K1,S1).
    

allFiniteSequancesOfNaturalNumbers([]).
allFiniteSequancesOfNaturalNumbers(L):-
    pairs(K,S),
    K>0,
    s_vectors(L,K,S).

%Generete Z
switchSign(X,X).
switchSign(X,Y):-X>0, Y is -X.

int(X):-nat(N), switchSign(N,X).

int2(X):-
    nat(N),
    member(S, [1,-1]),
    X is N * S.

q(X):-
    int(S),
    between(0, S, N),
    M is S - N,
    M=\=0,
    switchSign(M,M1),
    X is N / M1.
    
    