#lang scheme

(define (make-interval a b) (cons a b))
(define upper-bound cdr)
(define lower-bound car)

(define (mul-interval x y)
  (let ((lx (lower-bound x))
	(ly (lower-bound y))
	(ux (upper-bound x))
	(uy (upper-bound y)))
    (cond ((and (>= lx 0) (>= ly 0))
	   (make-interval (* lx ly) (* ux uy)))
	  ((and (<= ux 0) (<= uy 0))
	   (make-interval (* ux uy) (* lx ly)))
	  ((and (>= lx 0) (<= uy 0))
	   (make-interval (* ux ly) (* lx uy)))
	  ((and (<= ux 0) (>= ly 0))
	   (make-interval (* lx uy) (* ux ly)))
	  (else (let ((p1 (* (lower-bound x) (lower-bound y)))
		      (p2 (* (lower-bound x) (upper-bound y)))
		      (p3 (* (upper-bound x) (lower-bound y)))
		      (p4 (* (upper-bound x) (upper-bound y))))
		  (make-interval (min p1 p2 p3 p4)
				 (max p1 p2 p3 p4)))))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* c p)))
(define (percent i)
  (/ (width i) (center i)))

(define i1 (make-center-percent 10 0.1))
(define i2 (make-center-percent 8 0.05))
(define i-res (mul-interval i1 i2))

(/ (* (+ (percent i1)
	 (percent i2))
      (center i1)
      (center i2))
   (center i-res)) ;0.149

(percent i-res) ;0.149
