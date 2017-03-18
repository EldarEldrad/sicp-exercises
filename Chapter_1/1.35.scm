#lang scheme
;indeed, golden ratio f satisfies equation
;f^2 = f + 1
;this can be rewritten in equivalent form dividing whole equation by f
;f = 1 + 1/f

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))
(define (average x1 x2)
  (/ (+ x1 x2) 2.0))

(define golden-ratio
  (fixed-point (lambda (y) (average y
				    (+ 1 (/ 1 y))))
	       1.0))

golden-ratio ;1.618
