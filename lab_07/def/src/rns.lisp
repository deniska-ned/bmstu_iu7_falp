(defun dec-to-rns (num base)
  (mapcar #'(lambda (base-el) (mod num base-el)) base))

(defun div (a b)
  (multiple-value-bind (q r) (floor a b) q))

(defun mod-inv (q r newq newr n)
  (cond ((zerop newr) (cond ((> r 1) Nil) ((< q 0) (+ q n)) (t q)))
        (T (let* ((quotient (div r newr))
                  (oldq q)
                  (q newq)
                  (newq (- oldq (* quotient newq)))
                  (oldr r)
                  (r newr)
                  (newr (- oldr (* quotient newr))))
             (mod-inv q r newq newr n)))))

(defun modular-inverse (a n)
  (mod-inv 0 n 1 a n))

(defun rns-to-dec (rns basis)
  (let* ((M (apply #'* basis))
         (Mi (mapcar #'(lambda (x) (/ M x)) basis))
         (Bi (mapcar #'modular-inverse Mi basis)))
    (mod (apply #'+ (mapcar #'* rns Mi Bi)) M)))
