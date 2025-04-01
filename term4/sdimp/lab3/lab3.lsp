; 11
(defun primes (a)
  (cond ((eq a 1) '())
        ((eq a 0) '())
        (t (listprime (abs a) 2 '()))))

(defun listprime (a i reslist)
  (cond ((eq (mod a i) 0) (listprime (/ a i) i (cons i reslist)))
        ((> i a) reslist)
        (t (listprime a (+ i 1) reslist))))



; 12
(defun revlist (l)
  (cond ((atom l) l)
        (t (rever l '()))))

(defun rever (l reslist)
  (cond ((null l) reslist)
        (t (rever (cdr l) (cons (revlist (car l)) reslist)))))       



; 13
(defun lin (lst acc)
  (cond
    ((null lst) acc) 
    ((atom (car lst)) (lin (cdr lst) (append acc (list (car lst)))))
    (t (lin (cdr lst) (lin (car lst) acc))))) 

(defun linear (lst)
  (lin lst '()))


; 14
(defun intersect (l1 l2)
  (let ((resl '())) 
    (dolist (a l1)  
      (when (member a l2)  
        (pushnew a resl)))  
    (reverse resl)))  


; 15
(defun fib (N)
    (reverse (sum 1 1 N '())))

(defun sum (A1 A2 N list)
  (cond ((eq N 0) list)
        (t (sum A2 (+ A1 A2) (- N 1) (cons A1 list)))))


(print "TASK 11:")
(print (primes 18))

(print "TASK 12:")
(print (revlist `(A B (C B (D A)))))

(print "TASK 13:")
(print (linear `(A B (C D))))

(print "TASK 14:")
(print (intersect `(A B C) `(A B)))

(print "TASK 15:")
(print (fib 5))