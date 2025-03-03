(defun lst_len(l)
	(COND 
    (( NULL L )  0  )
    (T (+ 1 (lst_pred (CDR L))))

    )
)

(defun lst_pred(l)
    (mod (lst_len l) 2)
)

(defun lst_sum(l) 
	(COND 

    (( NULL L )  0  )
    ((LISTP (CAR L)) 
        (+ (lst_sum  (CAR L)) (lst_sum (CDR L)))
    )
    (T 
        (+ (CAR L) (lst_sum (CDR L)))
    )
    )
)

(defun lst_max(L)
    (cond
        ((NULL (CDR L)) 
            (cond ((LISTP (CAR L)) (lst_max (CAR L)))
                  (t (CAR L)))
        )
        ((LISTP (CAR L)) (max (lst_max (CAR L)) (lst_max (CDR l))))
        (T (max (CAR L) (lst_max (CDR L))))
    )
)

(defun lst_deep(L)
    (cond
        ((NULL L) 0)
        ((LISTP (CAR L)) (max (+ 1 (lst_deep (CAR L))) (lst_deep (CDR l))))
        (T (lst_deep (CDR L)))
    )
)

(print (format nil "1.1.2.6: ~a~%" (lst_pred `(1 (2 4) 3))))
(print (format nil "1.1.2.7: ~a~%" (lst_sum `(1 (2 (3)) 3))))
(print (format nil "1.1.2.8: ~a~%" (lst_deep `(1 2 3 3))))
(print (format nil "1.1.2.9: ~a~%" (lst_max `(1 (2 (4 9)) 90))))