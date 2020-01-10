safe([C, P, _]) :-
    ( C > 0 -> C >= P ; true),
    Cs is 3 - C,
    Ps is 3 - P,
    ( Cs > 0 -> Cs >= Ps ; true).

move([C, P, left], [Cs, P, right], 'A child crossed') :-
   C > 0, Cs is C - 1.
move([C, P, left], [Cs, P, right], 'Two children crossed') :-
   C > 1, Cs is C - 2.
move([C, P, left],[Cs, Ps, right], 'Both a child and a priest crossed') :-
   C > 0, P > 0, Cs is C - 1, Ps is P - 1.
move([C, P, left], [C, Ps, right], 'A priest crossed') :-
   P > 0, Ps is P - 1.
move([C, P, left], [C, Ps, right], 'Two priests crossed') :-
   P > 1, Ps is P - 2.

move([C, P, right], [Cs, P, left], 'A child returned') :-
   C < 3, Cs is C + 1.
move([C, P, right], [Cs, P, left], 'Two children returned') :-
   C < 2, Cs is C + 2.
move([C, P, right], [Cs, Ps, left], 'Both a child and a priest returned') :-
   C < 3, P < 3, Cs is C + 1, Ps is P + 1.
move([C, P, right], [C, Ps, left], 'A priest returned') :-
   P < 3, Ps is P + 1.
move([C, P, right], [C, Ps, left], 'Two priests returned') :-
   P < 2, Ps is P + 2.

explore([C, P, D], [C, P, D], _, []).
explore([C, P, D], [Cs, Ps, Ds], Explored, Plans) :-
   move([C, P, D], [Ca, Pa, Da], Description),
   safe([Ca, Pa, Da]),

   not(member([Ca, Pa, Da], Explored)),
   explore([Ca, Pa, Da], [Cs, Ps, Ds], [[Ca, Pa, Da]|Explored], PlansS),
   Plans = [ [[C, P, D], [Ca, Pa, Da], Description] | PlansS ].

showPlans([]).
showPlans([[S1, S2, D]|T]) :-
   write(D),write(': '),write(S1), write(' -> '), write(S2), nl,
   showPlans(T).

plan :-
   explore([3, 3, left], [0, 0, right], [[3, 3, left]], Plans),
   showPlans(Plans).
