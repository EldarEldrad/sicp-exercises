#lang scheme

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enough? guess next) next)
	    (else (newline)
		  (display guess)
		  (try next)))))
  (try first-guess))
(define (average x1 x2)
  (/ (+ x1 x2) 2.0))


(newline)
(display "With average damping") ;7 iterations

(define x-exp-x
  (fixed-point (lambda (y) (average y
				    (/ (log 1000) (log y))))
	       2.0))

(newline)
(display "Without average damping") ;33 iterations

(define x-exp-x-wo-damping
  (fixed-point (lambda (y) (/ (log 1000) (log y)))
	       2.0))
