#lang scheme

(define (square x) (* x x))

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (square-tree1 tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (square-tree1 sub-tree)
	     (square sub-tree)))
       tree))

(define (square-tree2 tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (square tree))
	(else (cons (square-tree2 (car tree))
		    (square-tree2 (cdr tree))))))

(square-tree1
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))) ;(1 (4 (9 16) 25) (36 49))
(square-tree2
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))) ;(1 (4 (9 16) 25) (36 49))
