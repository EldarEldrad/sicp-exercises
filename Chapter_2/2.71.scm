#lang scheme

					;such tree will always have one pattern: every node, except the last, have exactly one leaf
;so, to encode the most frequent symbol we need only one bit, for least frequent we need N-1 bit
