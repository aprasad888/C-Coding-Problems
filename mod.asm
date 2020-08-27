;;=============================================================
;;CS 2110 - Fall 2019
;;Homework 6 - Modulus
;;=============================================================
;;Name: Anusha Prasad
;;=============================================================

.orig x3000

    ;;YOUR CODE GOES HERE
    
LD R0, A ;; loads A into register 0
LD R1, B ;; loads B into register 1
NOT R2, R1 ;;Two's Complement (not b)
ADD R2, R2, 1 ;;Two's Complement (not b + 1)
ADD R3, R0, R2 ;;Two's Complement (a-b)
BRN ENDW1 

WHILE1               
ADD R0, R3, 0 ;; puts a-b in a
ADD R3, R0, R2 ;; updates a-b
BRZP WHILE1 ;; loops again if a-b >= 0

ENDW1
ST R0, ANSWER ;; will store a in Answer (mod)
HALT


A   .fill x703A
B   .fill x00FE

ANSWER .blkw 1

.end

 ;;ADD R2, R2, #0 ;; while loop check if (a-b) >= 0
                      ;; if negative will break loop
