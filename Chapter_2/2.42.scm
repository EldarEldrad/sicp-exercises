#lang scheme

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

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board '())

(define (safe? k positions)
  (define (not-under-hit? checked current diff)
    (cond ((null? current) #t)
	  ((or (= checked (car current))
	       (= (+ diff checked) (car current))
	       (= (- checked diff) (car current))) #f)
	  (else (not-under-hit? checked (cdr current) (+ diff 1)))))
  (not-under-hit? (car positions) (cdr positions) 1))

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(queens 4)
(queens 8)
