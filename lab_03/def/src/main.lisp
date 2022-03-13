(load "src/quadro.lisp")



(defun main ()
  (let* ((args (read-a-b-c))
         (res (apply 'solve-quadratic args))
	 (resstr (funcall 'str-quadratic res))
         (filename (format Nil
                           "a=~a_b=~a_c=~a.txt"
                           (first args)
                           (second args)
                           (third args))))
        (with-open-file (str filename
                         :direction :output
                         :if-exists :supersede
                         :if-does-not-exist :create)
                        (format str resstr))))

(main)
