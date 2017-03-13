#lang scheme

(define (good-enough? guess x)
  (< (abs (/ (- guess (improve guess x)) guess)) 0.001))
(define (square x) (* x x))
(define (abs x) (if (> x 0) x (- x)))
(define (average x y)
  (/ (+ x y) 2)) 
(define (improve guess x)
  (average guess (/ (+ (/ x
			  (square guess))
		       (* 2.0 guess))
		    3.0)))
(define (cube-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
		 x)))

(cube-root-iter 1.0 8)
(cube-root-iter 1.0 64)
					;2
					;4

