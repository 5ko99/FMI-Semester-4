p(katja,maria).
p(ivan,maria).
p(maria,peter).
p(peter,hristo).

v(X, Y):-p(Y,Z),p(Z,X).
vv(X,Y):-p(Y,Z),p(Z,T),p(T,X).

ancesetor(X,Y):- p(X,Y).
% ancesetor(X,Y):-p(X,Z),ancesetor(Z,Y).
ancesetor(X,Y):- p(Z,Y),ancesetor(X,Z).

%list 
% add(X, L, list(X,L)).
% member(X,list(X, L)).
% member(X, list(Y, L)):- member(X,L).
member(X,[X|_]).
member(X,[_|T]):- member(X,T).
first(F,[F|_]).
second(S,[_,S|_]).

last(X,[X]).
last(X,[_|T]):- last(X,T).

% append(A,B,AB)
append([],B,B).
append([X|A],B,[X|C]):- append(A,B,C).

last2(X, L):-append(_,[X],L).
member2(X,L):-append(_,[X|_],L).
insert(X,L,NewL):-append(L,[X|[]],NewL).



