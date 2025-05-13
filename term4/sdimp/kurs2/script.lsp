(PASSERTQ ADD-UNDER ()
	(FPUT :VALUE UNDER $VALUE :FRAME)
)


(PASSERTQ REMOVE-TOP ()
	(FDELETE :VALUE TOP $VALUE :FRAME)
)


(DEFUN PUT-ON (object1 object2)
  (COND 
    ((OR 
       (NULL object1)
       (NULL object2)
       (equal (car objebject2))  ; нельзя положить объект на самого себя
       (NOT (NULL (FGET object1 TOP)))      ; object1 уже на чем-то стоит
       (AND 
         (NOT (NULL (FGET object2 TOP)))    ; object2 уже имеет кого-то сверху
         (NULL (MEMBER object1 (FGET object2 TOP))) ; и object1 не является этим объектом
       )
     ) NIL)
    (T 
     (
       (FREMOVE object1 UNDER $VALUE (CAR (FGET object1 UNDER))) ; удалить object1 из прежнего основания
       (FPUT object2 TOP $VALUE object1) ; положить object1 на object2
       T
     )
    )
  )
)

(DEFRAMEQ TOWER
	(TOP ($IF-ADDED (ADD-UNDER (STATUS: EVAL)))) 
	(UNDER ($IF-REMOVED (REMOVE-TOP (STATUS: EVAL)))) 
)

(DEFRAMEQ CUBE
	(REL	($VALUE TOWER))
	(TOP 	($VALUE()))
	(UNDER	($VALUE()))
)


(DEFRAMEQ SPHERE
	(REL	($VALUE TOWER))
	(TOP 	($VALUE()))
	(UNDER	($VALUE()))
)


(DEFRAMEQ PIRAMID
	(REL	($VALUE TOWER))
	(TOP 	($VALUE()))
	(UNDER	($VALUE()))
)


(DEFRAMEQ PLANE
	(REL	($VALUE TOWER))
	(TOP 	($VALUE()))
	(UNDER	($VALUE()))
)