#lang scheme

(define (halve x) (/ x 2))
(define (double x) (* x 2))

(define (fast-mult a b)
  (define (fast-mult-iter curr a b)
    (cond ((= b 0) curr)
	  ((even? b) (fast-mult-iter curr
				     (double a)
				     (halve b)))
	  (else (fast-mult-iter (+ curr a)
				a
				(- b 1)))))
  (fast-mult-iter 0 a b))

(fast-mult 10 6) ;60
(fast-mult 13 11) ;143
(fast-mult 4 7) ;28
(fast-mult 594 291) ;172854
