#lang scheme

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((element-of-set? (car set1) set2)
	 (union-set (cdr set1) set2))
	(else (cons (car set1) (union-set (cdr set1) set2)))))

(define set-1 (list 1 2 3 4))
(define set-2 (list 3 4 5 6))

(union-set set-1 set-2) ;(1 2 3 4 5 6)
