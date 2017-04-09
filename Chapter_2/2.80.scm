#lang scheme

(define (=zero? x) (apply-generic '=zero? x))

					;scheme-number-package
(put '=zero? 'scheme-number
     (lambda (x) (= x 0)))

					;rational-package
(put '=zero? 'rational
     (lambda (x) (and (= (numer x) 0) (not (= (denom x) 0)))))

					;complex-package
(put '=zero? 'complex
     (lambda (x) (= (magnitude x) 0)))
