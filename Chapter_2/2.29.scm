#lang scheme

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define left-branch car)
(define right-branch cadr)

(define branch-length car)
(define branch-structure cadr)

(define (make-mobile-alt left right)
  (cons left right))
(define (make-branch-alt length structure)
  (cons length structure))
(define left-branch-alt car)
(define right-branch-alt cdr)
(define branch-length-alt car)
(define branch-structure-alt cdr)

(define (structure-weight structure)
  (if (pair? structure)
      (mobile-weight structure)
      structure))

(define (mobile-weight mobile)
  (let ((l-structure (branch-structure (left-branch mobile)))
	(r-structure (branch-structure (right-branch mobile))))
    (+ (structure-weight l-structure)
       (structure-weight r-structure))))

(define (total-weight mobile)
  (mobile-weight mobile))

(define (balanced? mobile)
  (let ((l-structure (branch-structure (left-branch mobile)))
	(r-structure (branch-structure (right-branch mobile)))
	(l-length (branch-length (left-branch mobile)))
	(r-length (branch-length (right-branch mobile))))
    (= (* l-length
	  (structure-weight l-structure))
       (* r-length
	  (structure-weight r-structure)))))

(define mobile1 (make-mobile (make-branch 2 1)
			     (make-branch 1 2)))
(define mobile2 (make-mobile (make-branch 3 mobile1)
			     (make-branch 9 1)))
(define mobile3 (make-mobile (make-branch 3 mobile2)
			     (make-branch 8 2)))

(total-weight mobile3) ;6
(balanced? mobile1) ;#t
(balanced? mobile2) ;#t
(balanced? mobile3) ;#f
