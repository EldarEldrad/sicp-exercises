#lang scheme

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2.0))

(define (iterative-improve good-enough? improve-guess)
  (lambda (guess)
    (let ((next-guess (improve-guess guess)))
      (if (good-enough? guess next-guess)
	  next-guess
	  ((iterative-improve good-enough? improve-guess)
	   next-guess)))))

(define (sqrt x)
  (define (good-enough? n m)
    (< (/ (abs (- n m)) n) 0.001))
  ((iterative-improve good-enough?
		      (lambda (g) (average g (/ x g))))
   1.0))

(sqrt 16) ;4
(sqrt 49) ;7
(sqrt 100) ;10

(define (fixed-point f x)
  (define (good-enough? n m)
    (< (abs (- n m)) 0.001))
  ((iterative-improve good-enough?
		      f)
   x))
