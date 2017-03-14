#lang scheme

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

(A 1 10)
;1024
(A 2 4)
;65536
(A 3 3)
;65536

(define (f n) (A 0 n))
;(f n) ===> 2n
(define (g n) (A 1 n))
;(g n) ===> 2^n
(define (h n) (A 2 n))
;(h n) ===> 2^(2^(...^2)) - n times

(f 0) ;0
(f 1) ;2
(f 2) ;4
(f 3) ;6
(f 4) ;8

(g 0) ;0
(g 1) ;2
(g 2) ;4
(g 3) ;8
(g 4) ;16

(h 0) ;0
(h 1) ;2
(h 2) ;4
(h 3) ;16
(h 4) ;65536
