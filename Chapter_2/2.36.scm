#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (define (car-n seqs)
    (if (null? seqs)
	'()
	(cons (car (car seqs))
	      (car-n (cdr seqs)))))
  (define (cdr-n seqs)
    (if (null? seqs)
	'()
	(cons (cdr (car seqs))
	      (cdr-n (cdr seqs)))))
  (if (null? (car seqs))
      '()
      (cons (accumulate op
			init
			(car-n seqs))
	    (accumulate-n op
			  init
			  (cdr-n seqs)))))

(accumulate-n +
	      0
	      (list (list 1 2 3)
		    (list 4 5 6)
		    (list 7 8 9)
		    (list 10 11 12))) ;(22 26 30)
