#lang scheme

(define key car)
(define entry car)
(define left-branch cadr)
(define right-branch caddr)
(define (make-tree entry left-branch right-branch)
  (list entry left-branch right-branch))

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
	((equal? given-key (key (entry set-of-records)))
	 (entry set-of-records))
	((< given-key (key (entry set-of-records))) (lookup given-key (left-branch set-of-records)))
	(else (lookup given-key (right-branch set-of-records)))))

(define items (make-tree '(3 sdf)
			 (make-tree '(1 dfse)
				    '()
				    (make-tree '(2 sdfsdf)
					       '()
					       '()))
			 (make-tree '(5 eee)
				    (make-tree '(4 qqq)
					       '()
					       '())
				    (make-tree '(6 ttt)
					       '()
					       '()))))

(lookup 4 items) ;(4 qqq)
(lookup 2 items) ;(2 sdfsdf)
