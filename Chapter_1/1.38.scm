#lang scheme

(define (cont-frac n-exp d-exp k)
  (define (iter current result)
    (cond ((= current 1) (/ (n-exp current)
			    (+ (d-exp current) result)))
	  (else (iter (- current 1)
		      (/ (n-exp current)
			 (+ (d-exp current) result))))))
  (iter k 0))

(define (d-exp i)
  (if (= (remainder i 3) 2)
      (/ (+ i 1)
	 1.5)
      1.0))
(define e
  (+ 2
     (cont-frac (lambda (i) 1.0)
		d-exp
		15)))

e ;2.71
