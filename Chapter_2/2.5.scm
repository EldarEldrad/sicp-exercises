#lang scheme

(define (square x) (* x x))

(define (expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0) a)
	  ((even? n) (fast-expt-iter a
				     (square b)
				     (/ n 2)))
	  (else (fast-expt-iter (* a b)
				b
				(- n 1)))))
  (fast-expt-iter 1 b n))

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car s)
  (define (iter s current)
    (if (= (remainder s 2) 0)
	(iter (/ s 2) (+ current 1))
	current))
  (iter s 0))

(define (cdr s)
  (define (iter s current)
    (if (= (remainder s 3) 0)
	(iter (/ s 3) (+ current 1))
	current))
  (iter s 0))

(car (cons 4 5)) ;4
(cdr (cons 4 5)) ;5
