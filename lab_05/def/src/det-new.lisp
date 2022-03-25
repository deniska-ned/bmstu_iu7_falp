(defun make-f-zero-internal(std lst mul i-start i res)
  (cond ((null std)res)
        ((>= i i-start)
         (make-f-zero-internal (cdr std)
                               (cdr lst)
                               mul i-start (+ i 1)
                               (cons (- (car lst) (* mul (car std)))
                                     res)))
        (T
         (make-f-zero-internal (cdr std)
                               (cdr lst)
                               mul i-start (+ i 1)
                               (cons (car lst)
                                     res)))
         ))

(defun make-f-zero (std lst i-start)
  (reverse (make-f-zero-internal std lst (/ (nth i-start lst)(nth i-start std)) i-start 0 ())))

(defun lol-triangle-internal-row (lol org n r-i c-i)
  (or (format T "lol: ~a; n: ~a; r-i: ~a; c-i: ~a~%" lol n r-i c-i)
      (cond ((>= c-i n)Nil)
            ((<= c-i r-i)(cons (car lol) (lol-triangle-internal-row (cdr lol) org n r-i (+ c-i 1))))
            (T(cons (make-f-zero org (car lol) r-i) (lol-triangle-internal-row (cdr lol) org n r-i (+ c-i 1)))))))

(defun lol-triangle-internal (lol n r-i)
  (cond ((>= r-i n) lol)
        (T(lol-triangle-internal (lol-triangle-internal-row lol (nth r-i lol) n r-i 0)
                                 n
                                 (+ r-i 1)))))

(defun lol-triangle (lol)
  (lol-triangle-internal lol (length lol) 0))

(defun lol-det-triangle-internal (lol n i res)
  (cond ((>= i n)res)
	(T(lol-det-triangle-internal lol n (+ i 1) (* res (nth i (nth i lol)))))))

(defun lol-det-triangle (lol)
  (lol-det-triangle-internal (lol-triangle lol) (length lol) 0 1))
