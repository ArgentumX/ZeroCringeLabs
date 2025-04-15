(defun @printmixt (list1 list2)
  ;; Печатает элементы LIST1 с префиксом из LIST2. Если LIST2 короче, он повторяется.
  (unless (and (listp list1) (listp list2))
    (error "@PRINTMIXT: оба аргумента должны быть списками"))
  (when (and (null list1) (null list2))
    (error "@PRINTMIXT: список LIST1 не должен быть пустым"))
  (let ((prefix-list list2)
        (current-prefixes list2))
    (dolist (item list1)
      (when (null current-prefixes)
        (setf current-prefixes prefix-list)) ; повторяем list2
      (format t "~A~A " (car current-prefixes) item)
      (setf current-prefixes (cdr current-prefixes))))
    t  
    )

(print "Тест 1: Обычный случай")
(terpri)
(print (@printmixt '(1 2 3 4 5 6 7) '(A B C D))) ; => A1 B2 C3 D4 A5 B6 C7

(print "Тест 2: list2 короче list1")
(terpri)
(print (@printmixt '(10 20 30 40 50) '(X Y))) ; => X10 Y20 X30 Y40 X50

(print "Тест 3: list2 длиннее list1")
(terpri)
(print (@printmixt '(a b) '(1 2 3 4 5))) ; => 1a 2b

(print "Тест 4: list1 и list2 одинаковой длины")
(terpri)
(print (@printmixt '(cat dog mouse) '(meow bark squeak))) ; => meowcat barkdog squeakmouse