#lang scheme

(define entry car)
(define left-branch cadr)
(define right-branch caddr)
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
	      (cons (entry tree)
		    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (right-branch tree)
					  result-list)))))
  (copy-to-list tree '()))

(define tree1 (make-tree 7
			 (make-tree 3
				    (make-tree 1 '() '())
				    (make-tree 5 '() '()))
			 (make-tree 9
				    '()
				    (make-tree 11 '() '()))))
(define tree2 (make-tree 3
			 (make-tree 1 '() '())
			 (make-tree 7
				    (make-tree 5 '() '())
				    (make-tree 9
					       '()
					       (make-tree 11 '() '())))))
(define tree3 (make-tree 5
			 (make-tree 3
				    (make-tree 1 '() '())
				    '())
			 (make-tree 9
				    (make-tree 7 '() '())
				    (make-tree 11 '() '()))))

(tree->list-1 tree1) ;(1 3 5 7 9 11)
(tree->list-2 tree1) ;(1 3 5 7 9 11)
(tree->list-1 tree2) ;(1 3 5 7 9 11)
(tree->list-2 tree2) ;(1 3 5 7 9 11)
(tree->list-1 tree3) ;(1 3 5 7 9 11)
(tree->list-2 tree3) ;(1 3 5 7 9 11)

;for tree->list-1 we have O(n*log n), because append has O(n)
;for tree->list-2 we have O(n)
