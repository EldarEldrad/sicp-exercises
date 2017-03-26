#lang scheme

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +
	      0
	      (map (lambda (item)
		     (if (not (pair? item))
			 1
			 (count-leaves item)))
		   t)))

(count-leaves (list 1 (list 2 (list (list 3 4) 5)))) ;5
