#lang scheme

					;some implementations don't contain inc and dec, so we should define it
(define (inc x) (+ x 1))
(define (dec x) (- x 1))

;we name procedures "add1" and "add2" to avoid collisions with + in "inc" procedure
(define (add1 a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(add1 4 5)
					;(add1 4 5)
					;(inc (add1 3 5))
					;(inc (inc (add1 2 5)))
					;(inc (inc (inc (add1 1 5))))
					;(inc (inc (inc (inc (add1 0 5)))))
					;(inc (inc (inc (inc 5))))
					;(inc (inc (inc 6)))
					;(inc (inc 7))
					;(inc 8)
					;9
					;recursive process

(define (add2 a b)
  (if (= a 0)
      b
      (add2 (dec a) (inc b))))

(add2 4 5)
					;(add2 4 5)
					;(add2 3 6)
					;(add2 2 7)
					;(add2 1 8)
					;(add2 0 9)
					;9
					;iterative process

