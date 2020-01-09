inorder(tip, []).
inorder(nd(Left, Number, Right), List) :-
    inorder(Left, List1),
    inorder(Right, List2),
    append(List1, [Number|List2], List).

balanced(Tree) :-
    balanced_(Tree, _).

balanced_(tip, N) :- N is 0.
%balanced_(nd(Left, Number, Right), N) :-
balanced_(nd(Left, _, Right), N) :-
    balanced_(Left, LN),
    balanced_(Right, RN),
    Diff is abs(LN-RN),
    %write(Number),write(' '),write(LN),write(' '),write(RN),write(' '), write(Diff),nl,
    Diff @=< 1,
    N is LN + RN + 1.


balance(Tree, BTree) :-
    inorder(Tree, List),
    inorder(BTree, List),
    balanced(BTree).
