#lang scheme

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(define (unique-pairs n)
  (flatmap (lambda (i)
	     (map (lambda (j) (list i j))
		  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (square x) (* x x))

(define (prime? n)
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

(unique-pairs 4) ;((2 1) (3 1) (3 2) (4 1) (4 2) (4 3))
(prime-sum-pairs 6)
