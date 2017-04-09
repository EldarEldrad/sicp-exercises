#lang scheme

(define (get-record employee division)
  ((get 'get-record division) employee))

(define (get-salary record division)
  ((get 'get-salary division) record))

(define (find-employee-record employee divisions)
  (cond ((null? divisions) '())
	((is-employee-in-division? (car divisions))
	 (get-record employee (car divisions)))
	(else (find-employee-record employee (cdr divisions)))))
