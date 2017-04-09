#lang scheme

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define symbol-leaf cadr)
(define weight-leaf caddr)

(define (make-code-tree left right)
  (list left
	right
	(append (symbols left) (symbols right))
	(+ (weight left) (weight right))))

(define left-branch car)
(define right-branch cadr)
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) #t)
	(else (element-of-set? x (cdr set)))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
	'()
	(let ((next-branch
	       (choose-branch (car bits) current-branch)))
	  (if (leaf? next-branch)
	      (cons (symbol-leaf next-branch)
		    (decode-1 (cdr bits) tree))
	      (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
	((= bit 1) (right-branch branch))
	(else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
	      (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
	((element-of-set? symbol (symbols (left-branch tree)))
	 (cons 0 (encode-symbol symbol (left-branch tree))))
	((element-of-set? symbol (symbols (right-branch tree)))
	 (cons 1 (encode-symbol symbol (right-branch tree))))
	(else (error "symbol doesn't exist -- ENCODE-SYMBOL"
		     symbol))))

(define (make-leaf-set pairs)
  (define (iter current remains)
    (if (null? remains)
	current
	(iter (adjoin-ordered-leaves (make-leaf
				      (caar remains)
				      (cadar remains))
				     current)
	      (cdr remains))))
  (iter '() pairs))

(define (adjoin-ordered-leaves x pairs)
  (cond ((or (null? pairs) (<= (weight x)
			       (weight (car pairs))))
	 (cons x pairs))
	(else (cons (car pairs)
		    (adjoin-ordered-leaves x (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves)
  (define (iter leaves current)
    (cond ((null? (cdr leaves)) current)
	  (else
	   (let ((code-tree (make-code-tree (car leaves)
					    (cadr leaves))))
	     (iter (adjoin-ordered-leaves code-tree
					  (cddr leaves))
		   code-tree)))))
  (iter leaves '()))

(define rock-pairs '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1)))
(define generated-tree (generate-huffman-tree rock-pairs))
(define rock-song '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))

(encode rock-song generated-tree) ;84 bits
;using fixed-length code we have 3*36 = 108 bits
