#lang scheme

(define (square x) (* x x))

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

(define (fast-prime? n)
  (define (fast-prime-inner? n times)
    (define (expmod base exp m)
      (cond ((= exp 0) 1)
	    ((even? exp)
	     (remainder (square (expmod base (/ exp 2) m))
			m))
	    (else
	     (remainder (* base (expmod base (- exp 1) m))
			m))))
    (define (fermat-test n)
      (define (try-it a)
	(= (expmod a n n) a))
      (try-it (+ 1 (random (- n 1)))))
    (cond ((= times 0) #t)
	  ((fermat-test n) (fast-prime-inner? n (- times 1)))
	  (else #f)))
  (fast-prime-inner? n 5))

(prime? 561) ;#f
(prime? 1729) ;#f
(prime? 2821) ;#f

(fast-prime? 561) ;#t
(fast-prime? 1729) ;#t
(fast-prime? 2821) ;#t
