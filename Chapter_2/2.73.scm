#lang scheme

(define variable? symbol?)

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
	((=number? a2 0) a1)
	((and (number? a1) (number? a2)) (+ a1 a2))
	(else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	((=number? m1 1) m2)
	((=number? m2 1) m1)
	((and (number? m1) (number? m2)) (* m1 m2))
	(else (list '* m1 m2))))

(define (make-exponentiation b e)
  (cond ((=number? b 0) 0)
	((=number? b 1) 1)
	((=number? e 0) 1)
	((=number? e 1) b)
	(else (list '** b e))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define addend cadr)
(define augend caddr)

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define multiplier cadr)
(define multiplicand caddr)

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define base cadr)
(define exponent caddr)

(define operator car)
(define operands cdr)

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp)) (operands exp)
	       var))))

(put 'deriv '+
     (lambda (x var) (make-sum (deriv (addend x) var)
				(deriv (augend x) var))))
(put 'deriv '*
     (lambda (x var) (make-sum
		      (make-product (multiplier x)
				    (deriv (multiplicand x) var))
		      (make-product (deriv (multiplier x) var)
				    (multiplicand x)))))

(put 'deriv '**
     (lambda (x var) (make-product
		      (make-product (exponent exp)
				    (make-exponentiation (base exp)
							 (- (exponent exp)
							    1)))
		      (deriv (base exp) var))))

;d: in this case you should change only change order of arguments in put 
