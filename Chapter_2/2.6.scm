#lang scheme

(define (square x) (* x x))

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (+ arg1 arg2)
  (lambda (f) (lambda (x) ((arg2 f) ((arg1 f) x)))))

((zero square) 5) ;5
((one square) 5) ;25
((two square) 5) ;625

(((+ zero zero) square) 5) ;5
(((+ zero one) square) 5) ;25
(((+ one zero) square) 5) ;25
(((+ two zero) square) 5) ;625
(((+ zero two) square) 5) ;625
(((+ one one) square) 5) ;625

