; a * x^2 + b * x + c = 0

; cases
; 1. default 2 solves
; 2. 1 solve                  - 2 roots the same
; 3. complex 2 solves
; 4. linear a=0 1 solve       - lst of len 1
; 5. a=0, b=0, c!=0 no solves - Nil
; 6. a=0, b=0, c=0 all solves - T

; (-b +- sqr(D)) / 2*a

(defvar input-mes "Enter a, b, c: ")

(defun read-a-b-c ()
  (and (princ input-mes)
       (or (finish-output) T)
       (list (read) (read) (read))))

(defun solve-quadratic (a b c)
  (car (or (and (= a 0)
                (or (and (= b 0)
                         (or (and (= c 0) '(T))
                             '(Nil)))
                    (list (list (/ (- c) b)))))
           (let ((D (- (* b b) (* 4 a c))))
             (list (list (/ (+ (- b) (sqrt D)) (* 2 a))
                         (/ (- (- b) (sqrt D)) (* 2 a))))))))

(defun compl-to-string (number)
  (format Nil
          "(~F~@Fi)"
          (realpart number)
          (imagpart number)))

(defun str-quadratic (lst)
  (or (and (null lst) (format Nil "No roots"))
      (and (eq T lst) (format Nil "All numbers"))
      (and (eql 1 (length lst))
           (format Nil "One root: ~f" (first lst)))
      (and (eql (first lst) (second lst))
           (format Nil "Two roots the same: ~f ~f" (first lst) (second lst)))
      (and (complexp (first lst))
           (format Nil
                   "Two complex roots: ~a ~a"
                   (compl-to-string (first lst))
                   (compl-to-string (second lst))))
      (format Nil "Two roots: ~f ~f" (first lst) (second lst))))
