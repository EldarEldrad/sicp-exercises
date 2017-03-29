#lang scheme

(define (split outer inner)
  (lambda (painter n)
    (if (= n 0)
	painter
	(let ((smaller (up-split painter (- n 1))))
	  (outer painter (inner smaller smaller))))))
