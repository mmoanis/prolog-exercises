:- use_module(library(clpfd)).

domain(1).
domain(2).
domain(3).
domain(4).
domain(5).
domain(6).
domain(7).
domain(8).
domain(9).

all_in_domain([]).
all_in_domain([X|Xs]) :-
  domain(X),
  all_in_domain(Xs).

squares([[X11, X12, X13, X14, X15, X16, X17, X18, X19],
          [X21, X22, X23, X24, X25, X26, X27, X28, X29],
          [X31, X32, X33, X34, X35, X36, X37, X38, X39],
          [X41, X42, X43, X44, X45, X46, X47, X48, X49],
          [X51, X52, X53, X54, X55, X56, X57, X58, X59],
          [X61, X62, X63, X64, X65, X66, X67, X68, X69],
          [X71, X72, X73, X74, X75, X76, X77, X78, X79],
          [X81, X82, X83, X84, X85, X86, X87, X88, X89],
          [X91, X92, X93, X94, X95, X96, X97, X98, X99]],
        [[X11, X12, X13, X21, X22, X23, X31, X32, X33],
          [X41, X42, X43, X51, X52, X53, X61, X62, X63],
          [X71, X72, X73, X81, X82, X83, X91, X92, X93],
          [X14, X15, X16, X24, X25, X26, X34, X35, X36],
          [X44, X45, X46, X54, X55, X56, X64, X65, X66],
          [X74, X75, X76, X84, X85, X86, X94, X95, X96],
          [X17, X18, X19, X27, X28, X29, X37, X38, X39],
          [X47, X48, X49, X57, X58, X59, X67, X68, X69],
          [X77, X78, X79, X87, X88, X89, X97, X98, X99]]).

sudoku(Rows) :-
  length(Rows, 9),
  transpose(Rows, Columns),
  squares(Rows, Squares),
  maplist(all_in_domain, Rows),
  maplist(same_length(Rows), Rows),
  maplist(all_distinct, Rows),
  maplist(all_distinct, Columns),
  maplist(all_distinct, Squares).
