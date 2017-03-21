#lang scheme

(define x-point car)
(define y-point cdr)
(define (make-point x y)
  (cons x y))

(define start-segment car)
(define end-segment cdr)
(define (make-segment p1 p2)
  (cons p1 p2))

(define (midpoint-segment segment)
  (make-point (/ (+ (x-point (start-segment segment))
		    (x-point (end-segment segment)))
		 2.0)
	      (/ (+ (y-point (start-segment segment))
		    (y-point (end-segment segment)))
		 2.0)))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  (newline))

(print-point (midpoint-segment (make-segment (make-point 5 2)
					     (make-point -1 0)))) ; (2.0, 1.0)
