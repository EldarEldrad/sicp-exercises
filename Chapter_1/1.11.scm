#lang scheme

(define (f-rec n)
  (if (< n 3)
      n
      (+ (f-rec (- n 1))
	 (* 2
	    (f-rec (- n 2)))
	 (* 3
	    (f-rec (- n 3))))))

(define (f-iter n)
  (define (f oldest old current n)
    (if (= n 0)
	oldest
	(f old
	   current
	   (+ current
	      (* 2 old)
	      (* 3 oldest))
	   (- n 1))))
  (f 0 1 2 n))

(f-rec 0) ;0
(f-rec 1) ;1
(f-rec 2) ;2
(f-rec 3) ;4
(f-rec 4) ;11
(f-rec 5) ;25
(f-rec 6) ;59

(f-iter 0) ;0
(f-iter 1) ;1
(f-iter 2) ;2
(f-iter 3) ;4
(f-iter 4) ;11
(f-iter 5) ;25
(f-iter 6) ;59
