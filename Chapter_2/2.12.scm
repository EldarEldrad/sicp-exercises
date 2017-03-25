#lang scheme

(define (make-interval a b) (cons a b))
(define upper-bound cdr)
(define lower-bound car)

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

(make-center-percent 10 0.05) ;(9.5, 10.5)

(percent (make-interval 96.0 104.0)) ;0.04
