#lang scheme

(define (raise x) (apply-generic 'raise x))

					;scheme-number-package
(put 'raise 'scheme-number
     (lambda (x) (make-rational x 1)))

					;rational-package
(put 'raise 'rational
     (lambda (x) (make-real (/ (numer x) (denom x)))))

					;real-package
(put 'raise 'real
     (lambda (x) (make-from-real-imag x 0)))
