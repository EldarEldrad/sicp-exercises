#lang scheme

;using 2.71 special case we have order of growth O(1) for most frequent symbol and O(n^2) for least frequent symbol, because we travrse n node down the tree and at each step we calculate element-of-set? with O(n) order of growth
