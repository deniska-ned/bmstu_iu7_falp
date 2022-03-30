;; matrix is list of list

(defun lol-minor-internal (lol ri i)
  (cond ((null lol) Nil)
        ((eql ri i) (lol-minor-internal (cdr lol) ri (+ i 1)))
        (T (cons (cdar lol)
                 (lol-minor-internal (cdr lol) ri (+ i 1))))))

(defun lol-minor (lol ri)
  (lol-minor-internal lol ri 0))

(defun lol-get-el (lol i j)
  (nth j (nth i lol)))

(defun det-lol-internal (lol row_index sum)
  (cond ((null lol) Nil)
        ((= 1 (length lol)) (lol-get-el lol 0 0))
        ; ((>= row_index (length lol))(or (format T "matrix: ~a; det ~a~%" lol sum) sum))
        ((>= row_index (length lol)) sum)
        (T (det-lol-internal lol
                             (+ row_index 1)
                             (+ sum
                                (* (expt -1 row_index)
                                   (lol-get-el lol row_index 0)
                                   (det-lol-internal (lol-minor lol row_index)
                                                     0
                                                     0)))))))

(defun det-lol (lol)
  (det-lol-internal lol 0 0))

;; matrix is 2 dem array

(defun arr-minor-internal-copy-row (arr-to arr-from ri-to ri-from ci-to)
  (cond ((>= ci-to (array-dimension arr-to 1)) arr-to)
        (T (and (or (setf (aref arr-to ri-to ci-to) (aref arr-from ri-from (+ ci-to 1))) T)
                (arr-minor-internal-copy-row arr-to arr-from ri-to ri-from (+ ci-to 1))))))

(defun arr-minor-internal (arr-to arr-from ri-skip i-to i-from)
  (cond ((>= i-to (array-dimension arr-to 1)) arr-to)
        ((= ri-skip i-from) (arr-minor-internal arr-to arr-from ri-skip i-to (+ i-from 1)))
        (T (and (arr-minor-internal-copy-row arr-to arr-from i-to i-from 0)
                (arr-minor-internal arr-to arr-from ri-skip (+ i-to 1) (+ i-from 1))))))

(defun arr-minor (arr ri)
  (let* ((n (array-dimension arr 1))
         (n-new (- n 1))
         (arr-new (make-array `(,n-new ,n-new))))
    (arr-minor-internal arr-new arr ri 0 0)))

(defun det-arr-internal (arr row_index sum)
  (cond ((= 1 (array-dimension arr 0)) (aref arr 0 0))
        ((>= row_index (array-dimension arr 0)) sum)
        (T (det-arr-internal arr
                             (+ row_index 1)
                             (+ sum
                                (* (expt -1 row_index)
                                   (aref arr row_index 0)
                                   (det-arr-internal (arr-minor arr row_index)
                                                     0
                                                     0)))))))

(defun det-arr (arr)
  (det-arr-internal arr 0 0))
