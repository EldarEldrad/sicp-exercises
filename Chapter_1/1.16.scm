#lang scheme

(define (square x) (* x x))

(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0) a)
	  ((even? n) (fast-expt-iter a
				     (square b)
				     (/ n 2)))
	  (else (fast-expt-iter (* a b)
				b
				(- n 1)))))
  (fast-expt-iter 1 b n))

(fast-expt 2 10) ;1024
(fast-expt 3 4) ;81
(fast-expt 5 3) ;125
(fast-expt 8 2) ;64
