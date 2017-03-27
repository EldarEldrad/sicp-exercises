#lang scheme

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

(define (reverse-r sequence)
  (fold-right (lambda (x y) (append y (list x)))
	      '()
	      sequence))
(define (reverse-l sequence)
  (fold-left (lambda (x y) (cons y x))
	     '()
	     sequence))

(reverse-r (list 2 4 6 8)) ;(8 6 4 2)
(reverse-l (list 2 4 6 8)) ;(8 6 4 2)
