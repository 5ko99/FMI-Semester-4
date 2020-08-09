has_two_elements([_,_|_]).

append([],L,L).
append([H|T],L,[H|R]):- append(T,L,R).

split(L, P, S):-
    append(P,S,L),
    P\=[],
    S\=[].

canEval([], 0).
canEval([X], X).
canEval([X], Y) :- Y is -X.
canEval(L, Z) :-
    has_two_elements(L),
    split(L, P, S),
    canEval(P,Left),
    canEval(S,Right),
    Z is Left - Right.
    

% genVectors(N, K, A, B)
genVectors(0,_,[]).
genVectors(N,K,[H|T]):-
    N>0,
    MK is -K,
    N1 is N - 1,
    between(MK, K, H),
    genVectors(N1,K,T).

dotProduct([],[],0).
dotProduct([H1|T1],[H2|T2],R):-
    H is H1 * H2,
    dotProduct(T1,T2,T),
    R is H + T.

sumOfSquares(A, S) :- dotProduct(A, A, S).

productOfAbs([],1).
productOfAbs([H|T],R):-
    HA is abs(H),
    productOfAbs(T,RT),
    R is HA * RT.

abs(X,X):-X>=0.
abs(X,MX):-X<0,MX is -X.

genCandidates(N,K,A,B,V):-
    genVectors(N,K,A),
    genVectors(N,K,B),
    dotProduct(A,B,0),
    sumOfSquares(A,S),
    productOfAbs(B,P),
    V is S * P.

genVectors(N,K,A,B):-
    genCandidates(N,K,A,B,V),
    not((
        genCandidates(N,K,_,_,V2),
        V2 > V    
    )).
