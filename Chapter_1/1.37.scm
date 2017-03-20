#lang scheme

(define (cont-frac-rec n-exp d-exp k)
  (define (rec current)
    (cond ((= current k) (/ (n-exp k)
			    (d-exp k)))
	  (else (/ (n-exp current)
		   (+ (d-exp current)
		      (rec (+ current 1)))))))
  (rec 1))

(define (cont-frac-iter n-exp d-exp k)
  (define (iter current result)
    (cond ((= current 1) (/ (n-exp current)
			    (+ (d-exp current) result)))
	  (else (iter (- current 1)
		      (/ (n-exp current)
			 (+ (d-exp current) result))))))
  (iter k 0))

(/ 1
   (cont-frac-rec (lambda (i) 1.0)
		  (lambda (i) 1.0)
		  15)) ;1.618

(/ 1
   (cont-frac-iter (lambda (i) 1.0)
		   (lambda (i) 1.0)
		   15)) ;1.618
