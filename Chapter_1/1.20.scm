#lang scheme

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40) ;2

					;normal order
					;(gcd 206 40)
					;(gcd 40 (remainder 206 40))
					;(gcd 40 6)
					;(gcd 6 (remainder 40 6))
					;(gcd 6 4)
					;(gcd 4 (remainder 6 4))
					;(gdc 4 2)
					;(gcd 2 (remainder 4 2))
					;(gcd 2 0)
					;2
					;totally 4 remainders evaluated

					;aplicative order
					;(gcd 206 40)
					;(gcd 40 (remainder 206 40)) , r1 not zero
					;(gcd (remainder 206 40) (remainder 40 (remainder 206 40))), r2 not zero
					;(gcd 2remainders 4remainders), r3 not zero
					;(gcd 4remainders 7remainders), r4 is zero
					;so, it's totally 1+2+4+7+4=18 remainders evaluated
