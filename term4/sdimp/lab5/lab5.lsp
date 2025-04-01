; 21
(defun iflist (l &optional (f #'evenp))
  (let ((l2 '()) (it 1))
    (loop for x in l
          do (when (funcall f x)
               (push it l2))
             (setq it (+ it 1)))
    (reverse l2)))

; 22
(defun subset-sums (L)
      (maplist #'(lambda (sublist) (apply #'+ sublist)) L))

; 23
(defun del-el (L A)
  (mapcon #'(lambda (L2) (if (eq (car L2) A) nil (list (car L2)))) L))

; 24
(defun single-filter (arg_list)
(if (listp arg_list)
    (mapcar #'identity 
            (remove-duplicates arg_list :from-end t))
    (error "Неправильные входные данные: arg_list должен быть списком.")))

; 25
(defun pairs (lst1 lst2)
  (remove nil (mapcar #'twolist2 lst1 lst2)))

(defun twolist2 (x y)
  (if (eq x y) nil (cons x y)))



(print "TASK 21:")
(print (iflist `(1000 -7 3) #'plusp))

(print "TASK 22:")
(print (subset-sums `(1 1 1 1 1 1 1)))

(print "TASK 23:")
(print (del-el `(A B A C) `A))

(print "TASK 24:")
(print (single-filter `(A B A C D A B)))

(print "TASK 25:")
(print (pairs '(1 5 3) '(4 2 6)))