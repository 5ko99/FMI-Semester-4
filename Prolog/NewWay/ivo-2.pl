list([_]).
list([_|T]):-list(T).

member1(X,[X|_]).
member1(X,[_|T]):-member1(X,T).

%append
append([],L,L).
append([H|T],L,[H|R]):-append(T,L,R).

%replace x with y in L and get R
replace(_,_,[],[]).
replace(X,Y,[X|T],[Y|T1]):-replace(X,Y,T,T1).
replace(X,Y,[H|T],[H|T1]):-H\=X,replace(X,Y,T,T1).

%first letter
first(X,[X|_]).

%last letter
last(X,[X]).
last(X,[_|T]):-last(X,T).

last1(X,L):-append(_,[X],L).

%prefix
prefix(X,L):-append([X],_,L).

%suffix
suffix(X,L):-append(_,[X],L).

%infix
infix(S, L) :- prefix(P, L), suffix(S, P).

%reverse
reverse([],[]).
reverse([X],[X]).
reverse([H|T],L):-
    reverse(T,RT),
    append(RT,[H],L).

%palindrome
palindrome(L) :- reverse(L, L).

%remove first
remove_first(_,[],[]).
remove_first(X,[X|T],T).
remove_first(X,[H|T],[H|L]):- X\=H, remove_first(X,T,L).

%remove all occurence
remove_all(_,[],[]).
remove_all(X,[X|T],T1):-remove_all(X,T,T1).
remove_all(X,[H|T],[H|T1]):-X\=H,remove_all(X,T,T1).

%insert X in L non-deterministic
insert(X,L,R):-append(P,S,L),append(P,[X|S],R).

%permutate
permutate([],[]).
permutate([H|T],R):-permutate(T,PT),insert(H,PT,R).

%subsequance
subsequance([],[]).
subsequance(S,[_|T]):-subsequance(S,T).
subsequance([H|S],[H|T]):-subsequance(S,T).

%power_set
power_set([[]],[]).
power_set(P,[A|S]):-
    power_set(B,S),
    prepend_to_all(A,B,C),
    append(B,C,P).

%{1,2,3} -> B = {{},{2},{3},{2,3}} -> C={{1},{1,2},{1,3},{1,2,3}} -> P= B U C

%Insert content, specified by the parameter, 
%to the beginning of each element in the set
prepend_to_all(_,[],[]).
prepend_to_all(X,[L|LS],[[X|L]|RS]):-
    prepend_to_all(X,LS,RS).
