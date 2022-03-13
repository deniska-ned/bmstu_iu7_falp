(load #P"/home/d.nedoluzhko/quicklisp/setup.lisp")

(ql:quickload "fiveam")

(load "src/quadro.lisp")


(fiveam:test quadro-root-all
  (fiveam:is-true (solve-quadratic 0 0 0)))

(fiveam:test quadro-root-none
  (fiveam:is-false (solve-quadratic 0 0 1)))

(fiveam:test quadro-root-linear
  (fiveam:is-true (equalp '(-2) (solve-quadratic 0 1 2))))

(fiveam:test quadro-root-2-root
  (fiveam:is-true (equalp '(3 2) (solve-quadratic 1 -5 6))))

(fiveam:test quadro-root-2-root-the-same
  (fiveam:is-true (equalp '(2 2) (solve-quadratic 1 -4 4))))

(fiveam:test quadro-root-2-root-complex
  (fiveam:is-true (equalp '(#C(-7.0 1.0) #C(-7.0 -1.0)) (solve-quadratic 0.5 7 25))))


(fiveam:run!)
