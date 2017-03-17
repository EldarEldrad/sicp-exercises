#lang scheme
;formally yes, we can simply use
(define (expmod base exp m)
  (remainder (fast-expr base exp) m))
;but evaluation of fast-expr will be excessively long and we need to storage huge intermediate results if 'exp' is big enough
