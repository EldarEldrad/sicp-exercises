#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (map-s proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map-s proc (cdr items)))))

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

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map-s (lambda (matrix) (dot-product matrix v)) m))

(define (transpose matrix)
  (accumulate-n cons '() matrix))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map-s (lambda (matrix) (matrix-*-vector cols matrix)) m)))

(dot-product (list 1 2 3) (list 4 5 6)) ;32
(matrix-*-vector (list (list 3 5 7)
		       (list 1 4 3)
		       (list 2 2 0))
		 (list 0 3 2)) ;(29 18 6)
(transpose (list (list 1 2)
		 (list 3 4))) ;((1 3) (2 4))
(matrix-*-matrix (list (list 1 2)
		       (list 4 5))
		 (list (list 0 6)
		       (list 7 3))) ;((14 12) (35 39))
