#lang scheme

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (same-parity first . arg)
  (define (iter cur res)
    (cond ((null? cur) res)
	  ((= (remainder (- first (car cur)) 2) 0)
	   (iter (cdr cur) (append res (list (car cur)))))
	  (else (iter (cdr cur) res))))
  (iter arg (cons first '())))

(same-parity 1 2 3 4 5 6 7) ;(1 3 5 7)
(same-parity 2 3 4 5 6 7) ;(2 4 6)
