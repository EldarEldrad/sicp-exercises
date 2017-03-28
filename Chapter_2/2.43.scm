#lang scheme

;Louis calculates (queen-cols (- k 1)) board-size times at every step, so its literally take T*(board-size)^(board-size) time to execute the program
