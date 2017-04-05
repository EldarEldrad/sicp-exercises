#lang scheme

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((and (element-of-set? (car set1) set2)
	      (not (element-of-set? (car set1) (cdr set1))))
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (define (iter set1 set2 cur)
    (cond ((and (null? set1) (null? set2)) cur)
	  ((null? set1) (iter set1
			      (cdr set2)
			      (adjoin-set (car set2) cur)))
	  (else (iter (cdr set1) set2 (adjoin-set (car set1)
						  cur)))))
  (iter set1 set2 '()))

(define set-1 (list 1 2 3 4 2 1 3))
(define set-2 (list 3 4 5 6 3 5 6))

(intersection-set set-1 set-2) ;(4 3)
(union-set set-1 set-2) ;(1 2 3 4 5 6)
