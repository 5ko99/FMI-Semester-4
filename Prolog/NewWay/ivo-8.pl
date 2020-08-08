graph_color_helper([],_,[]).
graph_color_helper([V|VS],K,[[V,M]|T]):-
    graph_color_helper(VS,K,T),
    K1 is K - 1,
    between(0, K1, M).

gen_K_admissible_coloring([V, E], K, C) :-
    graph_color_helper(V,K,C),
    not((
        member([U,W], E),
        member([U,UC],C),
        member([W, WC],C),
        UC=:=WC
    )),
    K1 is K - 1,
    not((
        between(0,K1,M),
        not(member([_,M],C))
    )).

%Chromatic Number of graph
list_length([], 0).
list_length([_|T], N):-
    list_length(T,K),
    N is K + 1.

chrom_num([[],_],0).
chrom_num([V,E],K):-
    list_length(V, VN),
    between(1,VN,K),
    gen_K_admissible_coloring([V,E],K,_),
    K1 is K - 1,
    not((
        gen_K_admissible_coloring([V,E],K1,_))),
    !.

chrom_num1([V,E],K):-
    list_length(V, VN),
    between(1,VN,K),
    gen_K_admissible_coloring([V,E],K,_),
    !.

% path([V, E], S, F, P) -> P is path in the graph [V, E] between S and F
edge([U,V],E):-member([U,V],E).
edge([U,V],E):-member([V,U],E).

subseq([],[]).
subseq([_|T],R):- subseq(T,R).
subseq([H|T],[H|R]):-subseq(T,R).

insert(X,L,R):- append(P,S,L),append(P,[X|S],R).

permutate([],[]).
permutate([H|T],P):- permutate(T,PT),insert(H,PT,P). 

is_path([_,_],[_]).
is_path([V,E],[U,W|T]):-
    edge([U,W],E),
    is_path([V,E],[W|T]).

path([V, E], S, F, P) :-
    S\=F,
    subseq(V, M),
    member(S, M),
    member(F, M),
    permutate(M, P),
    first_element(P,S),
    last_element(P,F),
    is_path([V, E], P).

first_element([H|_],H).

last_element([X],X).
last_element([_|T],X):- last_element(T,X).

%path_imp
path_imp([_, E], S, F, P) :- path_imp_track_viseted(E, F, [S], P).

path_imp_track_viseted(_, F, [F | Visited], P) :- reverse([F | Visited], P).
path_imp_track_viseted(E, F, [T | Rest], P) :-
    T \= F,
    edge([T, U], E),
    not(member(U, Rest)),
    path_imp_track_viseted(E, F, [U, T | Rest], P).

path([V,E],P):-
    member(S,V),
    member(F,V),
    S\=F,
    path_imp([V,E],S,F,P).



%some predicats for graphs
is_connected([V,E]):-
    not((
        member(S,V),
        member(F,V),
        S\=F,
        not(path([V,E],S,F,_))
    )).

is_acyclic([V, E]) :-
    not((
        member(S, V),
        member(F, V),
        S \= F,
        path_imp([V, E], S, F, P1),
        path_imp([V, E], S, F, P2),
        P1 \= P2
    )).

is_tree(G) :-
    is_connected(G),
    is_acyclic(G).
    

