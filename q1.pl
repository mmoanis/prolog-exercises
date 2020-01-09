male(a).
male(c).
male(e).
male(g).
male(i).

female(b).
female(d).
female(h).
female(f).

mother(b, c).
mother(b, d).
mother(b, e).
mother(d, g).
mother(h, i).

father(a, c).
father(a, d).
father(a, e).
father(c, f).
father(e, i).

parent(P, C):- father(P, C).
parent(P, C):- mother(P, C).

grandmother(M, C):-
    mother(M, X),
    mother(X, C).
grandmother(M, C):-
    mother(M, X),
    father(X, C).

grandfather(F, C):-
    father(F, X),
    father(X, C).
grandfather(F, C):-
    father(F, X),
    mother(X, C).

ancestor(C, P):-
    parent(P, C).
ancestor(C, P):-
    ancestor(X, P),
    parent(X, C).

sibling(A, B):-
    parent(X, A),
    parent(X, B),
    A \= B.

descendant(P, C):-
    ancestor(C, P).

cousin(A, B):-
    parent(X, A),
    parent(Y, B),
    sibling(X, Y).

