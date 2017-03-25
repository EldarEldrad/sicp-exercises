#lang scheme

(define (make-interval a b) (cons a b))

(define lower-bound car)

(define upper-bound cdr)

