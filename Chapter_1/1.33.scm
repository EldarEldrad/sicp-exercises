#lang scheme

(define (filtered-accumulate predicate? combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
	  ((predicate? a) (iter (next a)
				(combiner (term a) result)))
	  (else (iter (next a)
		      result))))
  (iter a null-value))

(define (square x) (* x x))
(define (inc x) (+ x 1))
(define (identity x) x)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (prime? n)
  (define (next number)
    (if (= number 2)
	3
	(+ number 2)))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
	  ((divides? test-divisor n) test-divisor)
	  (else (find-divisor n (next test-divisor)))))
  (= (smallest-divisor n) n))

(define (sum-of-squares-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))
(define (product-of-relative-prime n)
  (define (relative-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate relative-prime? * 1 identity 1 inc n))

(sum-of-squares-prime 2 20) ;1027
(product-of-relative-prime 10) ;189
