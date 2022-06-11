count_cutoff_cargo([], _, _, Ans, Ans) :- !.
count_cutoff_cargo([cargo(_, CW, _) | _], W, _, Ans, Ans) :- CW > W, !.
count_cutoff_cargo([cargo(_, _, CV) | _], _, V, Ans, Ans) :- CV > V, !.
count_cutoff_cargo([cargo(_, CW, CV) | Rest], W, V, Count, Ans) :-
    not(CW > W),
    not(CV > V),
    WNew is W - CW,
    VNew is V - CV,
    CountNew is Count + 1,
    count_cutoff_cargo(Rest, WNew, VNew, CountNew, Ans).
count_cutoff_cargo(ListOfCargo, SW, SV, Ans) :-
    count_cutoff_cargo(ListOfCargo, SW, SV, 0, Ans).

save_names(_, 0, []) :- !.
save_names([cargo(Name, _, _) | Rest], N, [Name | Ans]) :-
    N > 0,
    NNew is N-1,
    save_names(Rest, NNew, Ans).

list_cut(Ans, 0, Ans) :- !.
list_cut([_ | Rest], N, Ans) :-
    N > 0,
    NNew is N-1,
    list_cut(Rest, NNew, Ans).


count_ships([], _, [], 0) :- !.
count_ships(CargoList, ship(SW, SV), [CargoNames | CargoNamesRest], ShipCount) :-
    count_cutoff_cargo(CargoList, SW, SV, CargoCount),
    save_names(CargoList, CargoCount, CargoNames),
    list_cut(CargoList, CargoCount, CargoListNew),
    count_ships(CargoListNew, ship(SW, SV), CargoNamesRest, ShipCountRest),
    ShipCount is ShipCountRest+1.

solveee([], _, CargoNamesAns, ShipCountAns, CargoNamesAns, ShipCountAns).
solveee([Perm | Rest],  ship(SW, SV), _, ShipCount, CargoNamesAns, ShipCountAns) :-
    count_ships(Perm, ship(SW, SV), CargoNamesCur, ShipCountCur),
    ShipCountCur < ShipCount,
    ShipCountNew is ShipCountCur,
    solveee(Rest, ship(SW, SV), CargoNamesCur, ShipCountNew, CargoNamesAns, ShipCountAns).
solveee([Perm | Rest], ship(SW, SV), CargoNames, ShipCount, CargoNamesAns, ShipCountAns) :-
    count_ships(Perm, ship(SW, SV), CargoNamesCur, ShipCountCur),
    not(ShipCountCur < ShipCount),
    solveee(Rest, ship(SW, SV), CargoNames, ShipCount, CargoNamesAns, ShipCountAns).

solve(CargoList, ship(SW, SV), CargoNamesAns, ShipCountAns) :-
    count_ships(CargoList, ship(SW, SV), CargoNamesInit, ShipCountInit),
    findall(X, permutation(CargoList, X), Perms),
    solveee(Perms, ship(SW, SV), CargoNamesInit, ShipCountInit, CargoNamesAns, ShipCountAns).

get_first([First | _], First).

find_min_([], Ans, Ans) :- !.
find_min_([Perm | Rest], Min, Ans) :-
    get_first(Perm, First),
    First < Min,
    MinNew is First,
    find_min_(Rest, MinNew, Ans).
find_min_([Perm | Rest], Min, Ans) :-
    get_first(Perm, First),
    not(First < Min),
    find_min_(Rest, Min, Ans).
find_min(NumberList, Ans) :-
    findall(X, permutation(NumberList, X), Perms),
    find_min_(Perms, 3, Ans).
