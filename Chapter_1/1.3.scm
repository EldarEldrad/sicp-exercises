#lang scheme

(define (square x) (* x x))

(define (sum-of-squares-two-large a b c)
  (cond ((and (>= a c) (>= b c)) (+ (square a) (square b)))
	((and (>= a b) (>= c b)) (+ (square a) (square c)))
	(else (+ (square b) (square c)))))

(sum-of-squares-two-large 1 2 3)
(sum-of-squares-two-large 9 1 1)
(sum-of-squares-two-large -2 -4 -1)
(sum-of-squares-two-large 4 4 4)
(sum-of-squares-two-large -4 0 2)
(sum-of-squares-two-large 100 25 10)

					;13
					;82
					;5
					;32
					;4
					;10625
