#lang scheme

					;first Louis's program will run like this:
					;(square-list (3 4))
					;(iter (3 4) '())
					;(iter (4) (cons 9 '()))
					;(iter (4) (9))
					;(iter '() (cons 16 (9)))
					;(iter '() (16 9))
					;(16 9)

					;and the second:
					;(square-list (3 4))
					;(iter (3 4) '())
					;(iter (4) (cons '() 9))
					;(iter '() (cons (cons '() 9) 16))
					;(cons (cons '() 9) 16)
					;which is obviously is not (list 9 16)

