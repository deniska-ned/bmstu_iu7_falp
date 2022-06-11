split(Tail, 0, [], Tail) :- !.
split([Head | Tail], Counter, [Head | Res], T) :- Counter > 0, CounterNew is Counter - 1, split(Tail, CounterNew, Res, T).
 
merge_halfs([], H, H).
merge_halfs([Head | Tail], H, [Head | Res]) :- merge_halfs(Tail, H, Res).
 	
rev1(L, Res) :-
	length(L, Len),
	Len_d is Len // 2,
	split(L, Len_d, Head, Tail),
	merge_halfs(Tail, Head, Res).


rev2([A], [A]).
rev2([], []).
rev2([A, B | Tail], [B, A | Res]) :- rev2(Tail, Res).
