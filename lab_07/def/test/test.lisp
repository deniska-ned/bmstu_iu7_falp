(load #P"~/quicklisp/setup.lisp")

(ql:quickload "fiveam")

(load "src/rns.lisp")

(fiveam:test test-dec-to-rns
  (fiveam:is-true (equalp '(1 0 4) (dec-to-rns 25 '(3 5 7))))
  (fiveam:is-true (eql 25 (rns-to-dec '(1 0 4) '(3 5 7))))
)

(fiveam:run!)
