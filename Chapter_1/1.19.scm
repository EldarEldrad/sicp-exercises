#lang scheme

					;its easy to see that p'= p^2 + q^2 and q' = q^2 + 2pq
					;so, program is:
(define (square x) (* x x))

(define (fib n)
  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
	  ((even? count) (fib-iter a
				   b
				   (+ (square p)
				      (square q))
				   (+ (square q)
				      (* 2 p q))
				   (/ count 2)))
	  (else (fib-iter (+ (* b q) (* a q) (* a p))
			  (+ (* b p) (* a q))
			  p
			  q
			  (- count 1)))))
  (fib-iter 1 0 0 1 n))

(fib 1) ;1
(fib 2) ;1
(fib 3) ;2
(fib 4) ;3
(fib 5) ;5
(fib 6) ;8
(fib 7) ;13
(fib 8) ;21
(fib 50) ;12586269025
