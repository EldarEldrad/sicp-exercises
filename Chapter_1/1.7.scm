#lang scheme

(define (good-enough? guess x)
  (< (abs (/ (- guess (improve guess x)) guess)) 0.001))
(define (square x) (* x x))
(define (abs x) (if (> x 0) x (- x)))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(sqrt-iter 1.0 0.000000000000000000000000000000000000000000000000000000000001)
(sqrt-iter 1.0 1000000000000000000000000000000000000000000000000000000000000)
