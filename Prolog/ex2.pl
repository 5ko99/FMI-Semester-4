nat(zero).
nat(s(X)):-nat(X).

add(zero, Y, Y):-nat(Y).
add(s(X),Y,s(Z)):-add(X,Y,Z).
