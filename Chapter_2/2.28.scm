#lang scheme

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (fringe items)
  (define (iter current result)
    (cond ((null? current) result)
	  ((not (pair? (car current)))
	   (iter (cdr current) (append result
				       (list (car current)))))
	  (else (iter (cdr current)
		      (append result
			      (iter (car current) '()))))))
  (iter items '()))

(define x (list (list 1 2) (list 3 4)))

(fringe x) ;(1 2 3 4)
(fringe (list x x)) ;(1 2 3 4 1 2 3 4)
