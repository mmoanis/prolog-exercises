%%% Correct expressions
parse(['(', '(', 'X', ')', '+', 'Y', ')', '*', 1, '/', 'Y', '+', 3], Tree1),
parse(['X', '+', 'y', '-', 1, '*', 6, '/', 3], Tree2),
parse([1, '*', 'x'], Tree3),
parse(['y', '/', 'x'], Tree4),
parse([1, '-', 'x', '/', 5], Tree5),
parse(['x', '-', 'y', '-', 'r'], Tree6),
parse(['(', 'x', ')'], Tree7),
parse(['(', '(', '(', 4, ')', ')', ')'], Tree8),
parse([4,(-), 3], Tree9),
parse(['x'], Tree10),
parse([5], Tree11),
parse([x], Tree12),
parse(X, plus(n(4),n(3))),


%%% Faulty expressions
not(parse(['(', '(', 5, ')', '6'], _)),
not(parse(['(', '(', 5, ')', '+', 'x'], _)),
not(parse([], _)),
not(parse(['+'], _)),
not(parse([4, 4], _)),
not(parse([4, '+', '(', '(', ')', ')'], _)),
not(parse(['x', '+', 'y', '/', '(', 'z', '-', 4, ')', '(', 5, ')'], _)),
not(parse([3, '>', 4], _)),
not(parse(['4'], _)),
not(parse(['(', '(', '(', ')', ')', '(', ')', ')', '(', ')'], _)),
not(parse([1,2,3,4], _)),
not(parse([1, '_', 3], _)),
not(parse(['(', '*', ')'], _)).




