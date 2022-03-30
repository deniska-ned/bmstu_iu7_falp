; 3

(defun mylast1 (lst)
  (cond ((null lst) Nil)
        ((null (cdr lst)) lst)
        (T (mylast1 (cdr lst)))))

(defun mylast2 (lst)
  (and lst (car (reverse lst))))

; 4

(defun removelast1 (lst)
  (cond ((null lst) Nil)
        ((null (cdr lst)) Nil)
        (T (cons (car lst) (removelast (cdr lst))))))

(defun removelast2 (lst)
  (and lst (reverse (cdr (reverse lst)))))

; 5

(defun is_step_win (cube1p cube2p)
  (let ((sum (+ cube1p cube2p)))
    (OR (= 7 sum) (= 11 sum))))

(defun is_step_repeat (cube1p cube2p)
  (AND (= cube1p cube2p) (OR (= 1 cube1p) (= 6 cube1p))))

(defun play_step (player_name)
  (let* ((cube1p (+ (random 8) 1))
         (cube2p (+ (random 8) 1))
         (sum (+ cube1p cube2p)))
    (cond ((is_step_win cube1p cube2p)
           (AND (print `(,player_name - points ,cube1p ,cube2p - ABSOLUTE_WIN))
                (list T sum)))
          ((is_step_repeat cube1p cube2p)
           (AND (print `(,player_name - points ,cube1p ,cube2p - REPEAT))
                (let ((res (play_step player_name)))
                  (list (first res) (+ sum (second res))))))
          (T (AND (print `(,player_name - points ,cube1p ,cube2p - TRANSFER))
                  (list Nil sum))))))

(defun play_game ()
  (let ((resu1 (play_step 'USER1)))
    (if (first resu1)
        (print `(USER1 is a winner))
        (let ((resu2 (play_step 'USER2)))
          (if (first resu2)
              (print `(USER2 is a winner))
              (cond ((> (second resu1) (second resu2))
                     (print '(USER1 is a winner)))
                    ((< (second resu1) (second resu2))
                     (print '(USER2 is a winner)))
                    (T (print '(DRAW)))))))))
