#lang scheme

(define (attach-tag type-tag contents)
  (cond ((number? contents) contents)
	(else (cons type-tags contents))))
(define (type-tag datum)
  (cond ((number? datum) 'scheme-number)
	((pair? datum) (car datum))
	(else (error "Bad tagged datum -- TYPE-TAG" datum))))
(define (contents datum)
  (cond ((number? datum) 'scheme-number)
	((pair? datum) (cdr datum))
	(else (error "Bad tagged datum -- CONTENTS" datum))))
