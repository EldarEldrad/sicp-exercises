#lang scheme

(define (cont-frac n-exp d-exp k)
  (define (iter current result)
    (cond ((= current 1) (/ (n-exp current)
			    (+ (d-exp current) result)))
	  (else (iter (- current 1)
		      (/ (n-exp current)
			 (+ (d-exp current) result))))))
  (iter k 0))

(define (square x) (* x x))

(define (tangent r)
     (cont-frac (lambda (i) (if (= i 1) r (- (square r))))
		(lambda (i) (- (* 2 i) 1))
		10))

(tangent 0) ;0
(tangent (/ 3.1415926 4)) ;0.9999
