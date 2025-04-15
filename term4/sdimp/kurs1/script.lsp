(defun @position (object list &optional (test #'equal))
  ;; Возвращает позицию первого элемента в списке LIST, для которого (TEST OBJECT ELEMENT) не NIL.
  ;; Поиск производится только на верхнем уровне.
  (unless (listp list)
    (error "@POSITION: Аргумент LIST должен быть списком"))
  (unless (functionp test)
    (error "@POSITION: TEST должен быть функцией"))
  (let ((index 1)
        (found nil))
    (loop for element in list
          do (when (funcall test object element)
               (setf found t)
               (return index))
          do (incf index))
    (when found index)))

(defun @position-if (test list)
  ;; Возвращает позицию первого элемента в списке LIST, для которого (TEST ELEMENT) не NIL.
  ;; Поиск производится только на верхнем уровне.
  (unless (listp list)
    (error "@POSITION-IF: Аргумент LIST должен быть списком"))
  (unless (functionp test)
    (error "@POSITION-IF: TEST должен быть функцией"))
  (let ((index 1)
        (found nil))
    (loop for element in list
          do (when (funcall test element)
               (setf found t)
               (return index))
          do (incf index))
    (when found index)))


(print "Тест 1: (@position '(A B C) '((A)(A B C)(B) D))")
(print (@position '(A B C) '((A)(A B C)(B) D))) ; => 2

(print "Тест 2: (@position 3 '(5 7 -7 4) #'>)")
(print (@position 3 '(5 7 -7 4) #'>)) ; => 3

(print "Тест 3: (@position-if #'minusp '(1 2 -5 1))")
(print (@position-if #'minusp '(1 2 -5 1))) ; => 3

(print "Тест 4: (@position 'b '(a b c))")
(print (@position 'b '(a b c))) ; => 2

(print "Тест 5: (@position-if #'evenp '(1 3 5 6 7))")
(print (@position-if #'evenp '(1 3 5 6 7))) ; => 4