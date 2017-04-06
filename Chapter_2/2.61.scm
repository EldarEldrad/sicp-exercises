#lang scheme

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (car set)) true)
	((< x (car set)) false)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((or (null? set) (< x (car set))) (cons x set))
	((= x (car set)) set)
	(else (cons (car set) (adjoin-set x (cdr set))))))

(define items (list 2 4 6 8))
(adjoin-set 5 items) ;(2 4 5 6 8)
(adjoin-set 1 items) ;(1 2 4 6 8)
(adjoin-set 9 items) ;(2 4 6 8 9)
