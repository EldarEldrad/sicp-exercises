#lang scheme

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5)
					;5
(new-if (= 1 1) 0 5)
					;0

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (square x) (* x x))
(define (abs x) (if (> x 0) x (- x)))
(define (average x y)
  (/ (+ x y) 2))
(define (improve guess x)
  (average guess (/ x guess)))
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))
					;endless loop, because sqrt-iter will be computed every step, regardless if guess is already good enough

(sqrt-iter 1.0 9.0)
