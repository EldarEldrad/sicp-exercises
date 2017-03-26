#lang scheme

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
	(append rest (map (lambda (x) (cons (car s) x))
			  rest)))))

(define items (list 1 2 3))

(subsets items) ;(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
