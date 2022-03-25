(defun heaps-gen(heap-len heap-size)
  (cond ((= 0 heap-len)Nil)
        (T(cons heap-size (heaps-gen (- heap-len 1) heap-size)))))

(defun heaps-print(heaps)
  (format T "Heaps: ~a~%" heaps))

(defun heaps-change(heaps index diff)
  (cond ((null heaps)Nil)
        ((= 0 index)(cons (+ diff (car heaps))(heaps-change (cdr heaps) (- index 1) diff)))
        (T(cons (car heaps) (heaps-change (cdr heaps) (- index 1) diff)))))
;

(defun best-moves-get-i (i k)
  (cond ((< i 0)T)
        ((= i 0)T)
        ((not (best-moves-get-i (- i k) k))(- k))
        ((not (best-moves-get-i (- i 1) k))-1)
        (T Nil)))

(defun best-moves-gen-internal (m k i)
  (cond ((>= i m)Nil)
        (T(cons (best-moves-get-i i k)(best-moves-gen-internal m k (+ 1 i))))))

(defun best-moves-gen (m k)
  (best-moves-gen-internal m k 0))

(defun get-user-step(k)
  (or (format T "Enter heap index and diff: i [-1/-~a]: " k)
      (finish-output)
      (list (read)(read))))

(defun get-comp-step-internal-best(heaps k heap_i)
  (cond ((null heaps)Nil)
        (T(let ((diff (best-moves-get-i (car heaps) k)))
               (cond ((numberp diff)(list heap_i diff))
                     (T(get-comp-step-internal-best (cdr heaps) k (+ heap_i 1))))))))

(defun get-comp-step-internal-any(heaps k heap_i)
  (cond ((null heaps)Nil)
        ((> (car heaps) 0)(list heap_i -1))
        (T (get-comp-step-internal-any (cdr heaps) k (+ 1 heap_i)))))

(defun get-comp-step(heaps k)
  (let ((best (get-comp-step-internal-best heaps k 0)))
       (cond ((null best)(get-comp-step-internal-any heaps k 0))
	     (T best))))

(defun get-1-item(msg)
  (or (format T "~a" msg))
      (finish-output)
      (read))

(defun is-game-over(heaps)
  (cond ((null heaps)T)
        (T(and (= 0 (car heaps)) (is-game-over (cdr heaps))))))

;

(defun print-end-game(winner)
  (format T "End of the game. The winner is ~a" winner))

(defun make-user-step(heaps k)
  (let ((user-step (get-user-step k)))
       (heaps-change heaps (first user-step) (second user-step))))

(defun make-comp-step(heaps k)
  (let ((comp-step (get-comp-step heaps k)))
       (heaps-change heaps (first comp-step) (second comp-step))))

(defvar who-user "USER")
(defvar who-comp "BOT")

(defun running(heaps who k)
  (cond ((format T "Heap: ~a~%" heaps)Nil)
        ((is-game-over heaps)(print-end-game who))
        ((equalp who who-user)(running (make-user-step heaps k) who-comp k))
        ((equalp who who-comp)(running (make-comp-step heaps k) who-user k))
        (T(format T "ERROR"))))

(defun start()
  (let* ((heap-cnt (get-1-item "Enter heap count: "))
         (heap-size (get-1-item "Enter heap size: "))
         (k (get-1-item "Enter k: "))
         (heaps (heaps-gen heap-cnt heap-size)))
        (running heaps who-user k)))
