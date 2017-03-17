#lang scheme

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson-integral f a b dx)
  (define (add-2dx x) (+ x dx dx))
  (/ (* (+ (* 4 (sum f (+ a dx) add-2dx b))
	   (* 2 (sum f (add-2dx a) add-2dx b))
	   (f a)
	   (f b))
	dx)
     3.0))

(integral cube 0 1 0.01)
(simpson-integral cube 0 1 0.01)
