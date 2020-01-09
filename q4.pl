:- table e/3.
e(Tokens, A, Rest) :- t(Tokens, A, Rest).
e(Tokens, minus(A, B), Rest) :-
    e(Tokens, A, ['-'|Xs]),
    t(Xs, B, Rest).
e(Tokens, plus(A, B), Rest) :-
    e(Tokens, A, ['+'|Xs]),
    t(Xs, B, Rest).


:- table t/3.
t(Tokens, A, Rest) :- f(Tokens, A, Rest).
t(Tokens, divide(A, B), Rest) :-
    t(Tokens, A, ['/'|Xs]),
    f(Xs, B, Rest).
t(Tokens, multiply(A, B), Rest) :-
    t(Tokens, A, ['*'|Xs]),
    f(Xs, B, Rest).

:- table f/3.
f(Tokens, A, Rest) :- number(Tokens, A, Rest).
f(Tokens, A, Rest) :- identifier(Tokens, A, Rest).
f(Tokens, bracket(A), Rest) :- 'C'(Tokens, '(', X), e(X, A, Xs), 'C'(Xs, ')', Rest).


number([D|Rest], n(D), Rest) :- number(D).
identifier([D|Rest], id(B), Rest) :- char_type(D, prolog_var_start), atom_string(B, D).

parse(Tokens, Tree) :-
    e(Tokens, Tree, []).
