#lang scheme

(define (for-each proc items)
  (cond ((null? items) #t)
	(else (proc (car items)) (for-each proc (cdr items)))))

(for-each (lambda (x) (display x) (newline))
	  (list 57 321 88))
