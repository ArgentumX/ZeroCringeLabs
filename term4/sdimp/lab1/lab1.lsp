(defun fact(n) 
	(if (<= n 1)
		1
		(* n (fact (- n 1)))
	)
)

(defun squares(a b)
	(cond 

	((> 0 (- b a)) 0)
	((= a b) (* a a))
	(t (+ (* a a ) (squares (+ a 1) b)))
	)
)

(defun cgcd(a b)
	(cond 
	((= b 0) a)

    (t (gcd b (mod a b)))
	)
)

(defun clcm(a b)
	(/ (* a b) (gcd a b))
)


(defun csqrt(n iterations)
	(cond
		((= iterations 0) (* 0.5 (+ 1 n)))
		((plusp iterations) (setq x (sqrt n (- iterations 1))) (* 0.5 (+ x (/ n x))))
	)
)

(defun fibbonachi(n)
	(cond 
	((<= n 2) 1)
	(t (+ (fibbonachi (- n 1) ) (fibbonachi (- n 2) )))
	)
)