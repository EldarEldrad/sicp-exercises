#lang scheme

(define (gcd a b)
  (cond ((> b a) (gcd b a))
	((= b 0) a)
	(else (gcd b (remainder a b)))))

(define (make-rat n d)
  (define (abs x) (if (> x 0) x (- x)))
  (let ((g (gcd (abs n) (abs d))))
    (if (> (* n d) 0)
	(cons (/ (abs n) g) (/ (abs d) g))
	(cons (/ (- (abs n)) g) (/ (abs d) g)))))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(define numer car)
(define denom cdr)

(print-rat (make-rat 1 3)) ;1/3
(print-rat (make-rat -1 3)) ;-1/3
(print-rat (make-rat 1 -3)) ;-1/3
(print-rat (make-rat -1 -3)) ;1/3

