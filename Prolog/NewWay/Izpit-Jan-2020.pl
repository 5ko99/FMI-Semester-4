get_len([],0).
get_len([_|T],N):- get_len(T,N1), N is N1 + 1.

get_sum_of_elements([],0).
get_sum_of_elements([H|T],S):- get_sum_of_elements(T,S1), S is S1+H.

is_nat_square(X):-
    Xdiv2 is X div 2,
    between1(0,Xdiv2,Y),
    X =:= Y * Y,
    !.

nat(0).
nat(X):- nat(Y), X is Y + 1.

between1(A,B,A):- A=<B.
between1(A,B,C):- A<B, A1 is A + 1, between1(A1,B,C).

square_list(L):-
    get_sum_of_elements(L,S),
    get_len(L,N),
    is_nat_square(S),
    is_nat_square(N).

%rational numbers geometry
have_common_points([[A1,B1],[C1,D1]],[[A2,B2],[C2,D2]],[X,Y]):-
    not((
        (A1^2*D1^2+B1^2*D1^2*X^2*C1^2*B1^2+B1^2*D1^2*Y^2+)
            +
        (A2^2*D2^2+B2^2*D2^2*X^2*C2^2*B2^2+B2^2*D2^2*Y^2)=<2
    )).