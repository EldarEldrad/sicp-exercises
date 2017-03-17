#lang sicp
;you can download special sicp package for racket using
;raco pkg install sicp
;you should do it for running this program, because it is using the 'runtime' procedure that is missing in 'scheme' package

(#%require (only racket/base random))
;you need this line to successfully use 'random' procedure if you use 'sicp' package

(define (square x) (* x x))
(define (odd? x) (not (= (remainder x 2) 0)))

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


(define (timed-prime-test prime-predicate n)
  (start-prime-test prime-predicate n (runtime)))
(define (start-prime-test prime-predicate n start-time)
  (if (prime-predicate n)
      (report-prime n (- (runtime) start-time))))
(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes prime-predicate start finish)
  (cond ((> start finish) (newline))
	((odd? start)
	 (timed-prime-test prime-predicate start)
	 (search-for-primes prime-predicate (+ start 2) finish))
	(else (search-for-primes prime-predicate (+ start 1) finish))))

(search-for-primes prime? 1000 1019) ;1,1,1
(search-for-primes prime? 10000 10037) ;1,2,2
(search-for-primes prime? 100000 100043) ;4,4,3
(search-for-primes prime? 1000000 1000037) ;11,11,11

(search-for-primes fast-prime? 1000 1019) ;7,6,5
(search-for-primes fast-prime? 10000 10037) ;6,8,6
(search-for-primes fast-prime? 100000 100043) ;7,8,12
(search-for-primes fast-prime? 1000000 1000037) ;8,8,8

