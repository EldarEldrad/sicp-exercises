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

(define (repeated f n)
  (if (<= n 1)
      (lambda (x) (f x))
      (lambda (x)
	(f ((repeated f (- n 1)) x)))))

(define (average x1 x2)
  (/ (+ x1 x2)
     2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

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

(define (func x n)
  (fixed-point (repeated (average-damp (lambda (y)
					 (/ x
					    (fast-expt y (- n 1)))))
			 (/ (log n)
			    (log 2)))
	       1.0))

(func 9 2) ;3
(func 27 3) ;3
(func 81 4) ;3
(func 1024 10) ;2
