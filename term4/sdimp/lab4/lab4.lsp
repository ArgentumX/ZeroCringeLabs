(defun factorial (n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

(defun series-sum (x epsilon)
  (let ((sum 0.0)
        (term 1.0)
        (k 0)) 
    (loop
      (setq term (/ (expt x k) (factorial k))) 
      (setq sum (+ sum term))                  
      (when (< term epsilon)                   
        (return sum))
      (incf k))))                       

(defun last-el (L)
  (loop
     until (null (cdr L))  
     do (setq L (cdr L))   
     finally (return (car L)))) 

(defun reverse-list (lst)
  (loop for element in lst
        collect element into result
        finally (return (reverse result))))


(defun filter (lst min max)
  (loop for x in lst
        when (and (>= x min) (<= x max)) ; Проверяем, что элемент входит в интервал
        collect x)) ; Добавляем элемент в результат


(defun replace-symbol-in-atom (atom old-char new-char max-replacements)
  "Заменяет в строке old-char на new-char, но не более чем max-replacements раз."
  (let ((count 0)) ; Счетчик замен
    (coerce
     (map 'list
          (lambda (c)
            (if (and (char= c old-char) (< count max-replacements))
                (progn
                  (incf count) ; Увеличиваем счетчик
                  new-char) ; Заменяем символ
                c)) ; Иначе оставляем символ как есть
          (coerce atom 'list)) ; Преобразуем строку в список символов
     'string))) ; Преобразуем список символов обратно в строку

(defun replace-symbols-in-list (lst old-char new-char max-replacements)
  "Заменяет old-char на new-char во всех строках списка, но не более чем max-replacements раз в каждой строке."
  (mapcar (lambda (atom)
            (if (stringp atom) ; Проверяем, является ли элемент строкой
                (replace-symbol-in-atom atom old-char new-char max-replacements)
                atom)) ; Если элемент не строка, оставляем его как есть
          lst))


(print "TASK 16:")
(print (series-sum 1.0 1.0))

(print "TASK 17:")
(print (last-el `(A B C)))

(print "TASK 18:")
(print (reverse-list `(A B C)))

(print "TASK 19:")
(print (filter `(1 2 5 100) 1 5))

(print "TASK 20:")
(print (replace-symbols-in-list '("hello" "world" "ootest") #\o #\* 1))