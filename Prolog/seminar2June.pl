%split(L,R)->L[1,2,3] R=[[1][2][3]], R=[[1,2],[3]]...
split([],[]).
split([H|T],[A|R]):-
    append(A,B,[H|T]),
    A \=[],
    split(B,R).

flatten2([],[]).
flatten2(X,[X]):-
    not(is_list(X)),

flatten2([H|T],R):-
    flatten2(H,FH),
    flatten2(T,FT),
    append(FT,FH,R).

isList(_).
isList([_|_]).
flattern1(X,R):-isList(X),flatten2(X,R).

%binTree gen
binaryTreeGenerator(0,[]).
binaryTreeGenerator(N,[A,B]):-
    N>0,
    N1 is N - 1,
    between(0, N1, NA),
    NB is N1 - NA,
    binaryTreeGenerator(NA,A),
    binaryTreeGenerator(NB,B).

binaryTreeGenerator(T):-
    nat(N),
    binaryTreeGenerator(N,T).

nat(0).
nat(N):- nat(M), N is M + 1.
    