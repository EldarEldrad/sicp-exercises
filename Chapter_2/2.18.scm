#lang scheme

(define (reverse list)
  (define (iter list result)
    (if (null? list)
	result
	(iter (cdr list)
	      (cons (car list) result))))
  (iter list '()))

(reverse (list 1 4 9 16 25)) ;(25 16 9 4 1)
