(load #P"/home/d.nedoluzhko/quicklisp/setup.lisp")

(ql:quickload "fiveam")

(load "src/det.lisp")
(load "src/det-new.lisp")
(load "src/gauss.lisp")

(defun eqflt (x y) (< (abs(- x y)) 1e-5))

(fiveam:test test-lol-minor
  (fiveam:is-true (equalp '((5 6)(8 9)) (lol-minor '((1 2 3)(4 5 6)(7 8 9)) 0)))
  (fiveam:is-true (equalp '((2 3)(8 9)) (lol-minor '((1 2 3)(4 5 6)(7 8 9)) 1)))
  (fiveam:is-true (equalp '((2 3)(5 6)) (lol-minor '((1 2 3)(4 5 6)(7 8 9)) 2)))
)

(fiveam:test test-lol-get-el
  (fiveam:is-true (eql 5 (lol-get-el '((5)) 0 0)))
  (fiveam:is-true (eql 3 (lol-get-el '((1 2)(3 4)) 1 0)))
  (fiveam:is-true (eql 9 (lol-get-el '((1 2 3)(4 5 6)(7 8 9)) 2 2)))
)

(fiveam:test test-det-lol
  (fiveam:is-true (null (det-lol Nil)))
  (fiveam:is-true (eql 5 (det-lol '((5)))))
  (fiveam:is-true (eql -2 (det-lol '((1 2)(3 4)))))
  (fiveam:is-true (eql 0 (det-lol '((1 2 3)(4 5 6)(7 8 9)))))
  (fiveam:is-true (eql 24 (det-lol '((1 2 3)(5 7 11)(13 17 19)))))
  (fiveam:is-true (eql 4633 (det-lol '(( 3 -10  9  6  -5)
                                       (-7 -1   3  8  -4)
                                       (-2  3  -2  1   1)
                                       ( 8  0  -6 -10  9)
                                       ( 5  4  -8 -5  -1)))))
)

(fiveam:test test-arr-minor
  (fiveam:is-true (let ((arr-org (make-array '(3 3)
                                             :initial-contents '((1 2 3)(4 5 6)(7 8 9))))
                        (arr-ans (make-array '(2 2)
                                             :initial-contents '((5 6)(8 9)))))
                       (equalp arr-ans (arr-minor arr-org 0))))
  (fiveam:is-true (let ((arr-org (make-array '(3 3)
                                             :initial-contents '((1 2 3)(4 5 6)(7 8 9))))
                        (arr-ans (make-array '(2 2)
                                             :initial-contents '((2 3)(8 9)))))
                       (equalp arr-ans (arr-minor arr-org 1))))
  (fiveam:is-true (let ((arr-org (make-array '(3 3)
                                             :initial-contents '((1 2 3)(4 5 6)(7 8 9))))
                        (arr-ans (make-array '(2 2)
                                             :initial-contents '((2 3)(5 6)))))
                       (equalp arr-ans (arr-minor arr-org 2))))
)

(fiveam:test test-det-arr
  (fiveam:is-true (eql 5 (det-arr (make-array '(1 1) :initial-contents '((5))))))
  (fiveam:is-true (eql -2 (det-arr (make-array '(2 2) :initial-contents'((1 2)(3 4))))))
  (fiveam:is-true (eql 0 (det-arr (make-array '(3 3) :initial-contents '((1 2 3)(4 5 6)(7 8 9))))))
  (fiveam:is-true (eql 24 (det-arr (make-array '(3 3) :initial-contents '((1 2 3)(5 7 11)(13 17 19))))))
  (fiveam:is-true (eql 4633 (det-arr (make-array '(5 5)
                                                 :initial-contents '(( 3 -10  9  6  -5)
                                                                     (-7 -1   3  8  -4)
                                                                     (-2  3  -2  1   1)
                                                                     ( 8  0  -6 -10  9)
                                                                     ( 5  4  -8 -5  -1))))))
)

(fiveam:test test-make-f-zero
  (fiveam:is-true (equalp '(0) (make-f-zero '(1861) '(1937) 0)))
  (fiveam:is-true (equalp '(0 1 2) (make-f-zero '(3 2 1) '(6 5 4) 0)))
  (fiveam:is-true (equalp `(0 0 ,(/ -12 5)) (make-f-zero '(0 5 7) '(0 11 13) 1)))
)

(fiveam:test test-gauss
  (fiveam:is-true (equal `(,(/ -5 4) ,(/ 3 2)) (gauss '((2 -1)(6 1)) '(-4 -6))))
)

(fiveam:run!)
