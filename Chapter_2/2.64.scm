#lang scheme

(define make-tree list)

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

(define tree (list 1 3 5 7 9 11))

(list->tree tree) ;(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))
;partial-tree divides given list in three parts using (quotient (- n 1) 2). Number of left elements eqaul to this number forms left-branch, next element is entry of tree and remaining elements are right-branch. These branches are constructed recursevily and then final tree constructed up from below
;partial-tree has O(n) order of growth
