; 1
(defun geeven (num)
  (cond ((= 0 (mod num 2)) num)
        (T (geeven (+ num 1)))))

; 2
(defun incabs (num)
  (cond ((>= num 0) (+ num 1))
        (T (- num 1))))

; 3

(defun sort2 (num1 num2)
  (cond ((>= num2 num1) (list num1 num2))
        (T (list num2 num1))))

; 4

(defun inmed (num1 num2 num3)
  (cond ((AND (<= num2 num1) (<= num1 num3)) T)
        (T Nil)))

; 8

(defun inmed (num1 num2 num3)
  (if (AND (<= num2 num1) (<= num1 num3))
      T
      NIL))

(defun inmed (num1 num2 num3)
  (cond ((AND (<= num2 num1) (<= num1 num3)) T)
        (T Nil)))

(defun inmed (num1 num2 num3)
  (AND (<= num2 num1) (<= num1 num3)))
