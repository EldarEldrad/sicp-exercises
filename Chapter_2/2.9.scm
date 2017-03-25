#lang scheme

					;let l1 and u1 - lower and upper bound of first interval, l2 and u2 - lower and upper bound of second interval.
					;then w1 = (u1 - l1)/2 - width of first interval, w2 = (u2 - l2)/2 - width of second interval
					;bounds of sum of these intervals are:
					;l3 = l1 + l2, u3 = u1 + u2
					; and width is
					;w3 = (u3 - l3)/2 = (u1 + u2 - l1 - l2)/2 = (u1 - l1)/2 + (u2 - l2)/2 = w1 + w2
					;for difference we have
					;l4 = l1 - u2, u4 = u1 - l2
					;w4 = (u1 - l2 - l1 + u2)/2 = (u1 - l1)/2 + (u2 - l2)/2 = w1 + w2

					;for multiplication let's take intervals (0, 2) and (1, 7)
					;their product is (0, 14)
					;but for (0, 2) and (5, 7) the product is also (0, 14)
;so, product width doesn't depend entirely on widths of it's mutliplicants
