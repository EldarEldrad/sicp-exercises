#lang scheme

(define (equal? list1 list2)
  (cond ((and (null? list1) (null? list2)) #t)
	((or (null? list1) (null? list2)) #f)
	((and (pair? (car list1)) (pair? (car list2))
	      (equal? (car list1)) (equal? (car list2)))
	 (equal? (cdr list1) (cdr list2)))
	((eq? (car list1) (car list2)) (equal? (cdr list1)
					       (cdr list2)))
	(else #f)))

(equal? '(this is a list) '(this is a list)) ;#t
(equal? '(this is a list) '(this (is a) list)) ;#f
(equal? '(two words) '(two words again)) ;#f
