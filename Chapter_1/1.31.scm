#lang scheme

(define (product-rec term a next b)
  (if (> a b)
      1.0
      (* (term a)
	 (product-rec term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1.0))

(define (inc x) (+ x 1))
(define (dec x) (- x 1))
(define (even? n) (= (remainder n 2) 0))
(define (to-greatest-even x)
  (if (even? x)
      x
      (inc x)))
(define (to-lowest-odd x)
  (if (even? x)
      (dec x)
      x))

(/ (* 4 (product-rec to-greatest-even 2 inc 40))
   (product-rec to-lowest-odd 3 inc 41))

(/ (* 4 (product-iter to-greatest-even 2 inc 40))
   (product-iter to-lowest-odd 3 inc 41))
