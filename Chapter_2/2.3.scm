#lang scheme

(define (square x) (* x x))

(define (sqrt x)
  (define (average x y) (/ (+ x y) 2))
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
	guess
	(sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(define x-point car)
(define y-point cdr)
(define (make-point x y)
  (cons x y))

(define start-segment car)
(define end-segment cdr)
(define (make-segment p1 p2)
  (cons p1 p2))

(define (segment-length segment)
  (let ((p1 (start-segment segment))
	(p2 (end-segment segment)))
    (sqrt (+ (square (- (x-point p1)
			(x-point p2)))
	     (square (- (y-point p1)
			(y-point p2)))))))

(define (rectangle1 width-segment height-segment)
  (cons width-segment height-segment))
(define width-segment car)
(define height-segment cdr)

(define (perimeter-rect rect)
  (* 2 (+ (segment-length (width-segment rect))
	  (segment-length (height-segment rect)))))

(define (area-rect rect)
  (* (segment-length (width-segment rect))
     (segment-length (height-segment rect))))

(define r (rectangle1 (make-segment (make-point 0 0)
				    (make-point 6 0))
		      (make-segment (make-point 0 0)
				    (make-point 0 4))))

(perimeter-rect r) ;20
(area-rect r) ;24
