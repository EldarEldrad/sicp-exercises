#lang scheme

(define (union-set set1 set2)
    (cond ((and (null? set1) (null? set2)) '())
	  ((null? set1) (cons (car set2)
			      (union-set set1 (cdr set2))))
	  ((null? set2) (cons (car set1)
			      (union-set (cdr set1) set2)))
	  ((= (car set1) (car set2)) (union-set (cdr set1) set2))
	  ((< (car set1) (car set2))
	   (cons (car set1)
		 (union-set (cdr set1) set2)))
	  (else (cons (car set2)
		      (union-set set1 (cdr set2))))))

(define set1 (list 1 3 6 10))
(define set2 (list 1 2 4 6 8 10))

(union-set set1 set2) ;(1 2 3 4 6 8 10)
