#lang scheme

(define (apply-generic op . args)
  (define (iter type-tags args)
    (if (null? type-tags)
	(error "No method for these types -- ITER")
	(let ((type1 (car type-tags)))
	  (let ((filtered-args (conditional-map
				(lambda (x)
				  (let ((type2 (type-tag x)))
				    (if (eq? type1 type2)
					x
					(let ((t2->t1 (get-corcion type2 type1)))
					  (if (null? t2->t1)
					      #f
					      (t2->t1 x))))))
				args)))
	    (or filtered-args
		(iter (cdr type-tags) args))))))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if (not (null? proc))
	  (apply proc (map contents args))
	  (apply apply-generic (cons op (iter type-tags args)))))))

(define (conditional-map proc sequence)
  (define (iter proc sequence result)
    (if (null? sequence)
	(reverse result)
	(let ((item (proc (car sequnce))))
	  (if item
	      (iter proc (cdr sequence) (cons item result))
	      #f))))
  (iter proc sequence '()))
