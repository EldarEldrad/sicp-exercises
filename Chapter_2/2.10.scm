#lang scheme

(define (make-interval a b) (cons a b))
(define upper-bound cdr)
(define lower-bound car)

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (let ((l (lower-bound y))
	(u (upper-bound y)))
    (if (> (* l u) 0)
	(mul-interval x
		(make-interval (/ 1.0 (upper-bound y))
			       (/ 1.0 (lower-bound y))))
	(display "Error: divisor spans zero"))))

(div-interval (make-interval 1.0 6.0)
	      (make-interval 0.5 2.0)) ;(0.5, 12.0)

(div-interval (make-interval 1.0 6.0)
	      (make-interval -0.5 2.0)) ;ERROR
