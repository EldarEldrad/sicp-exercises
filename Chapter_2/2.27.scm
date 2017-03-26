#lang scheme

(define (reverse list)
  (define (iter list result)
    (if (null? list)
	result
	(iter (cdr list)
	      (cons (car list) result))))
  (iter list '()))

(define (deep-reverse list)
  (define (iter list result)
    (cond ((null? list) result)
	  ((not (pair? (car list)))
	   (iter (cdr list)
		 (cons (car list) result)))
	  (else (iter (cdr list)
		      (cons (iter (car list) '())
			    result)))))
  (iter list '()))

(define x (list (list 1 2) (list 3 4)))

(reverse x) ;((3 4) (1 2))
(deep-reverse x) ;((4 3) (2 1))
