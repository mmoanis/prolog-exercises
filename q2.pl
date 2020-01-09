%% Peano naturals

add(A, 0, A).
add(A, s(B), s(C)) :-
    add(A, B, C).

sub(A, B, C) :-
    add(B, C, A).

even(s(s(0))).
even(A) :-
    sub(A, s(0), X),
    even(X).

