#lang scheme

(define (make-from-mag-ang m a)
  (define (dispatch op)
    (cond ((eq? op 'magnitude) m)
	  ((eq? op 'angle) a)
	  ((eq? op 'real-imag) (* m (cos a)))
	  ((eq? op 'imag-part) (* m (sin a)))
	  (else (error "Unknown op -- MAKE-FROM-MAG-ANG" op))))
  dispatch)
