is_contracaular(X,Y):-
    not(member1(A,Y)),
    not(member1(Ea,A)),
    not(member1(Ex,X)),
    not(Ea mod Ex =:= 0).

member1(H,[H|_]).
member1(X,[_|T]):- member1(X,T).