(load #P"/home/d.nedoluzhko/quicklisp/setup.lisp")

(ql:quickload "fiveam")

(load "src/monoid.lisp")

(fiveam:test test-monoid
  (fiveam:is-true (equalp T (get-value (make-monoid-wr-bool T))))
  (fiveam:is-true (equalp Nil (get-value (make-monoid-wr-bool Nil))))
  (fiveam:is-true (equalp Nil (get-value (mul (make-monoid-wr-bool Nil) (make-monoid-wr-bool T)))))

  (fiveam:is-true (equalp  '(1 2 3) (get-value (make-monoid-wr-list '(1 2 3)))))
  (fiveam:is-true (equalp  Nil (get-value (make-monoid-wr-list Nil))))
  (fiveam:is-true (equalp '(1 2 3 4 5 6) (get-value (mul (make-monoid-wr-list '(1 2 3)) (make-monoid-wr-list '(4 5 6))))))
)

(fiveam:run!)
