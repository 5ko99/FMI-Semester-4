%Exam 2020
a_h(0,0).
a_h(1,1).
a_h(N,A):-
    N>1,
    N1 is N - 1, 
    N2 is N - 2, 
    a_h(N1,B),
    a_h(N2,C), 
    A is 5*B*B + 3*C*C*C.

a(N,C):-
    between(0, N, CurN),
    a_h(CurN,C).

p(A):-not((a(A,C), C=:=A)).

%ivo
is_list_transversal([],_).
is_list_transversal([X|XS],Transversal):-
    member(A, X),
    member(A,Transversal),
    !,
    is_list_transversal(XS,Transversal).

is_list_transversal_with_not(L,T):-
    not((member(X,L),not((member(A,T),member(A,X))))).
     

