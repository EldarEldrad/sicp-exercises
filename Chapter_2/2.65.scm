#lang scheme

(define entry car)
(define left-branch cadr)
(define right-branch caddr)
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
	(let ((left-result (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result (partial-tree (cdr non-left-elts)
					      right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts (cdr right-result)))
		(cons (make-tree this-entry left-tree right-tree)
		      remaining-elts))))))))

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (right-branch tree)
					  result-list)))))
  (copy-to-list tree '()))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
	(cond ((= x1 x2)
	       (cons x1
		     (intersection-set (cdr set1)
				       (cdr set2))))
	      ((< x1 x2)
	       (intersection-set (cdr set1) set2))
	      ((< x2 x1)
	       (intersection-set set1 (cdr set2)))))))

(define (union-set set1 set2)
    (cond ((and (null? set1) (null? set2)) '())
	  ((null? set1) (cons (car set2)
			      (union-set set1 (cdr set2))))
	  ((null? set2) (cons (car set1)
			      (union-set (cdr set1) set2)))
	  ((= (car set1) (car set2)) (union-set (cdr set1) set2))
	  ((< (car set1) (car set2))
	   (cons (car set1)
		 (union-set (cdr set1) set2)))
	  (else (cons (car set2)
		      (union-set set1 (cdr set2))))))

(define tree1 (make-tree 7
			 (make-tree 3
				    (make-tree 1 '() '())
				    (make-tree 5 '() '()))
			 (make-tree 9
				    '()
				    (make-tree 11 '() '()))))
(define tree2 (make-tree 2
			 (make-tree 1 '() '())
			 (make-tree 6
				    (make-tree 4 '() '())
				    (make-tree 9
					       '()
					       (make-tree 10 '() '())))))

(list->tree (intersection-set (tree->list tree1)
			      (tree->list tree2)))
					;(1 () (9 () ()))
(list->tree (union-set (tree->list tree1)
			      (tree->list tree2)))
;(5 (2 (1 () ()) (3 () (4 () ()))) (9 (6 () (7 () ())) (10 () (11 () ()))))
