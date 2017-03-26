#lang scheme

(define lists1 (list 1 3 (list 5 7) 9))
(define lists2 (list (list 7)))
(define lists3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(cadr (cadr (cdr lists1))) ;7
(car (car lists2)) ;7
(cadr (cadr (cadr (cadr (cadr (cadr lists3)))))) ;7
