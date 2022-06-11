domains
  num = integer.

predicates
  max2(num, num, num).
  max2cut(num, num, num).
  
  max3(num, num, num, num).
  max3cut(num, num, num, num).

  min4(num, num, num, num, num).
  min4cut(num, num, num, num, num).
  min4cut_(num, num, num, num, num).

clauses
  max2(A, B, A) :- A >= B.
  max2(A, B, B) :- B >= A.

  max2cut(A, B, A) :- A >= B, !.
  max2cut(_, B, B) :- !.

  max3(A, B, C, A) :- A >= B, A >= C.
  max3(_, B, C, Ans) :- max2(B, C, Ans).
  
  max3cut(A, B, C, A) :- A >= B, A >= C, !.
  max3cut(_, B, C, B) :- B >= C, !.
  max3cut(_, _, C, C) :- !.

  min4(A, B, C, D, A) :- A <= B, A <= C, A <= D.
  min4(A, B, C, D, B) :- B <= A, B <= C, B <= D.
  min4(A, B, C, D, C) :- C <= A, C <= B, C <= D.
  min4(A, B, C, D, D) :- D <= A, D <= B, D <= C.

  min4cut(A, B, C, D, A) :- A <= B, A <= C, A <= D, !.
  min4cut(_, B, C, D, B) :- B <= C, B <= D, !.
  min4cut(_, _, C, D, C) :- C <= D, !.
  min4cut(_, _, _, D, D) :- !.
  
  min4cut_(A, B, C, D, A) :- A <= B, A <= C, A <= D.
  min4cut_(_, B, C, D, B) :- B <= C, B <= D.
  min4cut_(_, _, C, D, C) :- C <= D.
  min4cut_(_, _, _, D, D).

goal
  % max2(1, 2, Ans).
  % max2(2, 1, Ans).
  % max2cut(1, 2, Ans).
  % max2cut(2, 1, Ans).
  
  % max3(3, 1, 2, Ans).
  % max3cut(3, 1, 2, Ans).
  % max3cut(1, 2, 3, Ans).
  
  % min4(4, 3, 1, 2, Ans).
  
  % min4cut(1, 3, 2, 4, Ans).
  min4cut_(3, 2, 1, 4, Ans).
