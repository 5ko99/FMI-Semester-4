nat(0).
nat(X):-nat(M), X is M+1.

% course 1
after(dis2, dis1).
after(va, la).
after(oop, up).
% course 2.1
after(dupril, dis2).
after(dupril, la).
after(eai, ds).
after(sdp, oop).
after(sdp, ds).
% course 2.2
after(chm, dis1).
after(chm, la).
after(daa, ds).
after(daa, sdp).
after(lp, ds).
after(lp, eai).

uses(X,Y):-after(X,Y).
uses(X,Y):-after(Z,Y),uses(X,Z).

%Parrents
female(juliet).
female(mary).
female(lisa).
female(sandra).

male(bob).
male(peter).
male(paul).
male(cris).
male(harry).
male(john).

parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).

parent(peter, harry).
parent(lisa, harry).

parent(mary, john).
parent(mary, sandra).
parent(cris, john).
parent(cris, sandra).

mother(X,Y):-parent(X,Y),female(X).

brother(X,Y):-male(X),mother(Z,X),mother(Z,Y), X\=Y.

grandparent(G,C):-parent(G,P),parent(P,C).

grandomother(G,C):-female(G),grandparent(G,C).
grandfather(G,C):-male(G),grandparent(G,C).

sibling(X,Y):-parent(P,X),parent(P,Y).

cousin(X,Y):-grandomother(G,X),grandomother(G,Y),not((mother(M,X),mother(M,Y))).

%word
word(epsilon).
word([H|T]):-word(T),letter(H).
letter(a).
letter(b).
letter(c).
letter(d).

member1(H, [H|T]):-letter(H),word(T).
member1(X,[_|T]):-member1(X,T).
