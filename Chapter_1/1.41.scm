#lang scheme

(define (inc x) (+ x 1))

(define (double f)
  (lambda (x)
    (f (f x))))

((double inc) 5) ;7
(((double (double double)) inc) 5) ;21
