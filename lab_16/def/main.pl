use_module(library(clpfd)).

% list

list_eq([], []).
list_eq([V | L], [V | R]) :- list_eq(L, R).

list_3_eq([], [], []).
list_3_eq([V | Rest1], [V | Rest2], [V | Rest3]) :-
    list_3_eq(Rest1, Rest2, Rest3).

list_nth([Ans | _], 0, Ans) :- !.
list_nth([_ | Tail], N, Ans) :-
    NNew is N-1,
    list_nth(Tail, NNew, Ans).

nth_zero(List, N) :- list_nth(List, N, 0).

list_sum([], Sum, Sum) :- !.
list_sum([Num | Rest], Sum, Ans) :-
    SumNew is Sum+Num,
    list_sum(Rest, SumNew, Ans).
list_sum(List, Ans) :- list_sum(List, 0, Ans).




% matrix

matrix_eq([], []).
matrix_eq([V1 | L], [V2 | R]) :- list_eq(V1, V2), matrix_eq(L, R).

matrix_diag_zero([], _).
matrix_diag_zero([Row | Rest], N) :-
    nth_zero(Row, N),
    NNew is N+1,
    matrix_diag_zero(Rest, NNew).
matrix_diag_zero(Matrix) :- matrix_diag_zero(Matrix, 0).

matrix_sum_row([Row | _], 0, Ans) :- list_sum(Row, Ans), !.
matrix_sum_row([_ | Tail], Index, Ans) :-
    IndexNew is Index-1,
    matrix_sum_row(Tail, IndexNew, Ans).

matrix_sum_col([], _, Ans, Ans) :- !.
matrix_sum_col([Row | Res], Index, Sum, Ans) :-
    list_nth(Row, Index, Value),
    SumNew is Sum+Value,
    matrix_sum_col(Res, Index, SumNew, Ans).
matrix_sum_col(Matrix, Index, Ans) :- matrix_sum_col(Matrix, Index, 0, Ans).

matrix_sum_rows([], []).
matrix_sum_rows([Row | Rest], [SumRow | Sums]) :-
    list_sum(Row, SumRow),
    matrix_sum_rows(Rest, Sums).

matrix_sum_cols(Matrix, Ans) :-
    transpose(Matrix, Trans),
    matrix_sum_rows(Trans, Ans).


% iters

list_iter(_, [], []) :- !.
list_iter(N, [_|T], [X | S]) :- d(N, X), NN is N - X, list_iter(NN, T, S).

matrix_iter(_, [], []) :- !.
matrix_iter(X, [E|T], [N | S]) :-
    bond(E, B),
    list_iter(B, X, N),
    matrix_iter(X, T, S).
matrix_iter(X, Matrix) :-
    matrix_iter(X, X, Matrix),
    transpose(Matrix, Trans),
    matrix_eq(Matrix, Trans),
    matrix_diag_zero(Matrix).

d(N, R) :- d(R), R =< N.

% bl

get_elems_values([], []).
get_elems_values([Elem | Rest], [Value | Rest2]) :-
    bond(Elem, Value),
    get_elems_values(Rest, Rest2).

check_elems(Elems, Matrix) :-
    get_elems_values(Elems, ElemValues),
    matrix_sum_rows(Matrix, SumRows),
    matrix_sum_cols(Matrix, SumCols),
    list_3_eq(ElemValues, SumRows, SumCols).

solve(Elems, Ans) :-
    matrix_iter(Elems, Ans),
    check_elems(Elems, Ans),
    write(Elems).

bond(h, 1).
bond(o, 2).
bond(c, 4).

d(0).
d(1).
d(2).
d(3).
d(4).

subseq([],[]).
subseq([Item | RestX], [Item | RestY]) :-
  subseq(RestX,RestY).
subseq(X, [_ | RestY]) :-
  subseq(X,RestY).

solve2(Elems, Ans) :-
  subseq(Seq, Elems),
  solve(Seq, Ans).

