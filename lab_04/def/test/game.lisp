(load #P"/home/d.nedoluzhko/quicklisp/setup.lisp")

(ql:quickload "fiveam")

(load "src/game.lisp")

(fiveam:test test-heaps-gen
  (fiveam:is-true (equalp '(5 5 5 5) (heaps-gen 4 5))))

(fiveam:test test-heaps-change-0
  (fiveam:is-true (equalp '(1937 1 2) (heaps-change '(0 1 2) 0 1937))))

(fiveam:test test-heaps-change-mid
  (fiveam:is-true (equalp '(0 1937 2) (heaps-change '(0 1 2) 1 1936))))

(fiveam:test test-heaps-change-last
  (fiveam:is-true (equalp '(0 1 1937) (heaps-change '(0 1 2) 2 1935))))

(fiveam:test test-is-game-over-yes
  (fiveam:is-true (is-game-over '(0 0 0 0))))

(fiveam:test test-is-game-over-no
  (fiveam:is-true (not (is-game-over '(0 1 0 0)))))

(fiveam:test test-best-moves-get-i-less-0
  (fiveam:is-true (best-moves-get-i -1 3)))

(fiveam:test test-best-moves-get-i-eq-0
  (fiveam:is-true (best-moves-get-i 0 -1)))

(fiveam:test test-best-moves-get-i-odd-3
  (fiveam:is-true (best-moves-get-i 6 3)))

(fiveam:test test-best-moves-get-i-odd-3
  (fiveam:is-true (best-moves-get-i 6 5)))

(fiveam:test test-best-moves-get-i-even-4
  (fiveam:is-true (best-moves-get-i 6 5)))

(fiveam:test test-best-moves-gen-odd
  (fiveam:is-true (equalp '(T NIL -1 NIL -3 NIL -3 NIL -3 NIL) (best-moves-gen 10 3))))

(fiveam:test test-best-moves-gen-even
  (fiveam:is-true (equalp '(T NIL -1 NIL -1 NIL -1 NIL -1 -8 NIL -8 NIL -8 NIL -8 NIL -1 -8 NIL) (best-moves-gen 20 8))))

(fiveam:test test-get-comp-step-lose-one-way
  (fiveam:is-true (equalp '(1 -1) (get-comp-step '(0 1 0) 10))))

(fiveam:test test-get-comp-step-win-one-way
  (fiveam:is-true (equalp '(0 -1) (get-comp-step '(1 1 0) 10))))

(fiveam:test test-get-comp-step-win-with-k
  (fiveam:is-true (equalp '(0 -1) (get-comp-step '(4 1 0) 4))))

(fiveam:run!)
