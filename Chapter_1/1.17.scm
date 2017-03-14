#lang scheme

(define (halve x) (/ x 2))
(define (double x) (* x 2))

(define (fast-mult a b)
  (cond ((= b 0) 0)
	((even? b) (double (fast-mult a (halve b))))
	(else (+ a (fast-mult a (- b 1))))))

(fast-mult 10 6) ;60
(fast-mult 13 11) ;143
(fast-mult 4 7) ;28
(fast-mult 594 291) ;172854
