append([],L,L).
append([H|T],L,[H|R]):-append(T,L,R).

%replace(X,Y,L,R): R is L where X is replaced with Y
replace(_,_,[],[]).
replace(X,Y,[X|T],[Y|R]) :- 
    replace(X,Y,T,R).
replace(X,Y,[H|T],[H|R]):-
    replace(X,Y,T,R),H\=X.

%first X is the first of L
first(X,[X|_]).

%last(X,L):X is the last in L
last_rec(X,[X]).
last_rec(X,[_|T]) :-
    last_rec(X,T).

%last_app
last(X,L):-append(_,[X],L).

%prefix(P,L) : P is prefix L
prefix1(P,L):-append(P,_,L).

%sufix
sufix(S,L):- append(_,S,L).

%infix
infix(I,L):- prefix(P,L),sufix(I,P).

%reverse
reverse([],[]).
reverse(Result,[Head|Tail]):-
    reverse(Temp,Tail),
    append(Temp,[Head],Result).

%palindrom
palindrom(L):-reverse(L,L).

%remove(X,L,R): R is L from wich the first occurance of X is removed
remove_first(X,[X|T],T).
remove_first(X,[H|T],[H|R]):-
    X\=H,
    remove_first(X,T,R).

%remove
remove(_,[],[]).
remove(X,[X|T],T).
remove(X,[H|T],[H|R]):-X\=H,remove(X,T,R).

%remove_all
remove_all(_,[],[]).
remove_all(X,[X|T],R):-remove_all(X,T,R).
remove_all(X,[H|T],[H|R]):-
    X\=H,remove_all(X,T,R).

%insert(X,L,R)
insert(X,L,R):-append(P,S,L),append(P,[X|S],R).

%permutate: P is permytation of L(P perm L)
permutate([],[]).
permutate(P,[H|T]):-permutate(Q,T),insert(H,Q,P).

%subsequance
subsequance([],[]).
subsequance(S,[_|T]):-subsequance(S,T).
subsequance([H|S],[H|T]):-subsequance(S,T).

%power_set(P,S) P is the "power set" of S(S has no repetitions)
power_set([[]],[]).
%P({A} U S)= P(S) U (Union (M in P(S))) ({A} U M)
power_set(P,[A|S]):-
    power_set(B,S), %P(S)
    prepend_to_all(A,B,C), %(Union (M in P(S)))
    append(B,C,P). % U (union)

prepend_to_all(_,[],[]).
prepend_to_all(X,[L|LS],[[X|L]|RS]):-
    prepend_to_all(X,LS,RS).
