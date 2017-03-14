#lang scheme

(define (pascal-triangle row number)
  (if (or (= number 1) (= row number))
      1
      (+ (pascal-triangle (- row 1)
			  (- number 1))
	 (pascal-triangle (- row 1)
			  number))))

(pascal-triangle 1 1) ;1
(pascal-triangle 3 2) ;2
(pascal-triangle 4 3) ;3
(pascal-triangle 5 3) ;6
(pascal-triangle 7 5) ;15
(pascal-triangle 9 4) ;56
