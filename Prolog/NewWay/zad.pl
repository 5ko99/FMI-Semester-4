max([A],A).
max([H|T],M):- max(T,MT), max(H,MT,M).

max(A,B,A):- A>=B.
max(A,B,B):- B>A.

min1(A,B,A):- A=<B.
min1(A,B,B):- A>B.

min([A],A).
min([H|T],Min):- min(T,Tmin), min1(H,Tmin,Min).

min_from_max([A],Ma):-max(A,Ma).
min_from_max([H|T],R):- max(H,Hmax), min_from_max(T,Tmax), min1(Hmax,Tmax,R).

max_from_min([A],Ma):- min(A,Ma).
max_from_min([H|T],R):- min(H,Hmin), max_from_min(T,Tmin), max(Hmin,Tmin,R).

find_balance(L,R):-
    min_from_max(L,MinFromMax),
    max_from_min(L,MaxFromMin),
    R is MinFromMax - MaxFromMin.

p(L):-
    find_balance(L,B),
    not((
        member1(L, List),
        not(member1(List,B))
    )).
   
member1([H|_],H).
member1([_|T],R):-member1(T,R).


%zad 2
len([], 0).
len([_|T],N):- len(T,Nt), N is Nt + 1.

is_zero_or_one(0).
is_zero_or_one(1).

is_boolean([A]):- is_zero_or_one(A).
is_boolean([H|T]):- is_zero_or_one(H), is_boolean(T).

same_len(A,B):- len(A,An), len(B,An).

d(X,Y,R):-
    is_boolean(X),
    is_boolean(Y),
    same_len(X,Y),
    pos_with_diff(X,Y,R).

pos_with_diff([A],[A],0).
pos_with_diff([A],[B],1):-A \= B.
pos_with_diff([H|T],[H|T1],R):-
    pos_with_diff(T,T1,R).
pos_with_diff([H|T],[H1|T1],R):-
    H\=H1,
    pos_with_diff(T,T1,R1),
    R is R1 + 1.

center(X,Y):-
    member1(X,Mem),
    len(Mem,N),
    gen_bool_list_with_len(N,Y),
    center_with_pot_center(X,Y,Sum),
    not((
       gen_bool_list_with_len(N,NotCenter),
       Y\=NotCenter,
       center_with_pot_center(X,NotCenter,Sum1),
       Sum1<Sum
    )).

give_one_or_zero(A):-A is 0.
give_one_or_zero(A):- A is 1.


gen_bool_list_with_len(0,[]).
gen_bool_list_with_len(N,[H|T]):-
    N>0,
    give_one_or_zero(H),
    N1 is N - 1,
    gen_bool_list_with_len(N1,T).
    

center_with_pot_center([],_,0).
center_with_pot_center([H|T],Y,Sum):-
    d(H,Y,Dh),
    center_with_pot_center(T,Y,S1),
    Sum is S1 + Dh.

gen_all_bool_lists_of_lists_with_len(N,L):-
    nat(M),
    s(N,M,L).

nat(0).
nat(N):- nat(M), N is M + 1.

s(_,0,[]).
s(N,M,[List|T]):-
    M>0,
    gen_bool_list_with_len(N,List),
    M1 is M - 1,
    s(N,M1,T).
    
p(N,L):-
    gen_all_bool_lists_of_lists_with_len(N,L),
    center(L,CenL),
    member1(L,CenL),
    !.

%zad
count([],_,0).
count([H|T],H,N):- count(T,H,Tn), N is Tn + 1.
count([H|T],X,N):- H\=X, count(T,X,N).

mf([],0).
mf(L,A):-
    member1(L,A),
    count(L,A,N),
    not((
        member1(L,B),
        A\=B,
        count(L,B,M),
        M > N
    )).

lf([],0).
lf(L,A):-
    member1(L,A),
    count(L,A,N),
    not((
        member1(L,B),
        A\=B,
        count(L,B,M),
        M < N
    )).

diameter(L,D):- mf(L,Mf), lf(L,Lf), D is Mf - Lf.

%fan list
cond(L):- not(append(_,[X,X|_],L)).


cond1([X,Y]):- X\=Y.
cond1([H1, H2|T]):- H1\=H2, cond1([H2|T]).


append1([],L,L).
append1([H|T],L,[H|R]):- append1(T,L,R).

cond2(L):- count(L,1,N), count(L,0,N).

a(X,Y):-Z is X + Y, write(Z).

%list
concat([],L,L).
concat([H|T],L,[H|R]):- concat(T,L,R).

klini(L,1,L).
klini(L,N,Ln):-
    N > 1,
    N1 is N - 1,
    klini(L,N1,Ln1),
    concat(Ln1,L,Ln).

p(X1, Y1, A, X2, Y2, R, X, Y):-
    is_in_square(X,Y,X1,Y1,A),
    is_in_circle(X,Y,X2,Y2,R).

is_in_square(X,Y,X1,Y1,A):-
    X>=X1,
    X=<X1 + A,
    Y>= Y1,
    Y=< Y1 + A.

is_in_circle(X,Y,X2,Y2,R):-
    (X-X2)^2 + (Y-Y2)^2 =< R^2.

gen_points(X1, Y1, A, X2, Y2, R, X, Y):-
    XA is X1 + A,
    YA is Y1 + A,
    between(X1, XA, X),
    between(Y1,YA,Y),
    p(X1,Y1,A,X2,Y2,R,X,Y).

num(X,X):- X\=0.
num(X,Y):- Y is -X.

z(X):-
    nat(Y),
    num(Y,X).

get_head([H|_],H).

get_second([_ ,H2|_],H2).

%function
i(L):-
    member1(L,M),
    get_head(M,X),
    not((
        member1(L,M1),
        M1\=M,
        get_head(M1,X1),
        X =:= X1    
    )).

m(L):-
    member1(L,M1),
    get_head(M1,X1),
    get_second(M1,Y1),
    not((
        member1(L,M2),
        M1\=M2,
        get_head(M2,X2),
        get_second(M2,Y2),
        not(is_ok(X1,X2,Y1,Y2))  
    )).

is_ok(X1,X2,Y1,Y2):- X1 >= X2, Y1>=Y2.
is_ok(X1,X2,Y1,Y2):- X1=<X2, Y1=<Y2.

%(X1,Y1) & (Y1,Z1) - > (X1,Z1).
composition(F,G,FG):- composition(F,G,[],FG).

composition(F,G,Builder,FG):-
    member1(F,M1),
    get_head(M1,X1),
    get_second(M1,Y1),
    member1(G,[Y1,Z1]),
    insert_first([X1,Z1],Builder,FG).

insert_first(A,[],[A]).
insert_first(A,[H|T],[A,H|T]).