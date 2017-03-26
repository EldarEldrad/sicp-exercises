#lang scheme

(define (square x) (* x x))

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (square-list1 items)
  (map square items))

(define (square-list2 items)
  (if (null? items)
      '()
      (cons (square (car items))
	    (square-list2 (cdr items)))))

(square-list1 (list 1 2 3 4)) ;(1 4 9 16)
(square-list2 (list 1 2 3 4)) ;(1 4 9 16)
