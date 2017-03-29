#lang scheme

(define (frame-outline frame)
  (let ((lower-left (make-vect 0 0))
	(lower-right (make-vect 0 1))
	(upper-left (make-vect 1 0))
	(upper-right (make-vect 1 1)))
    (segment->painter
     (list (make-segment lower-left lower-right)
	   (make-segment lower-left upper-left)
	   (make-segment lower-right upper-right)
	   (make-segment upper-left upper-right)))))

(define (frame-x frame)
  (let ((lower-left (make-vect 0 0))
	(lower-right (make-vect 0 1))
	(upper-left (make-vect 1 0))
	(upper-right (make-vect 1 1)))
    (segment->painter
     (list (make-segment lower-left upper-right)
	   (make-segment lower-left upper-right)))))

(define (frame-diamond frame)
  (let ((lower-left (make-vect 0.5 0))
	(lower-right (make-vect 0 0.5))
	(upper-left (make-vect 0.5 1))
	(upper-right (make-vect 1 0.5)))
    (segment->painter
     (list (make-segment lower-left lower-right)
	   (make-segment lower-left upper-left)
	   (make-segment lower-right upper-right)
	   (make-segment upper-left upper-right)))))

;feel free to take any points to draw wave, there are no exact locations for segments
