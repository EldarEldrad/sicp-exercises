#lang scheme

(define (prime-sum-pairs n s)
       (filter (lambda (triple)
		 (sum-lower-or-equal? triple s))
	       (ordered-triples n)))

(define (ordered-triples n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
		    (map (lambda (k) (list i j k))
			 (enumerate-interval 1 (- j 1))))
		  (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (sum-lower-or-equal? triple s)
  (<= (accumulate + 0 triple) s))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(prime-sum-pairs 5 10) ;((3 2 1) (4 2 1) (4 3 1) (4 3 2) (5 2 1) (5 3 1) (5 3 2) (5 4 1))
