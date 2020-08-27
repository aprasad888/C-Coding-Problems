;;=============================================================
;;CS 2110 - Fall 2019
;;Homework 6 - Sum the Elements of a Linked List
;;=============================================================
;;Name:
;;=============================================================

.orig x3000

;; YOUR CODE GOES HERE

LD R3, LL ;;loads values
LDR R0, R3, 1 ;;loads length
AND R2, R2, 0 
LDI R1, LL
;;when first node is null
BRZ COMPLETE
  LOOP
    LDR R3, R1, 1
    ;; PUT THE ADDRESS OF THE NEXT VALUE INTO R1
    ADD R2, R2, R3
    AND R3, R3, 0
    ADD R3, R1, 0
    LDR R1, R3, 0
  BRNP LOOP

COMPLETE
ST R2, ANSWER
HALT 

LL .fill x6000
ANSWER .blkw 1
.end

.orig x4000
.fill x4008
.fill 5
.fill x400A
.fill 2
.fill x4002
.fill 9
.fill x0000 
.fill 3
.fill x4004
.fill 10
.fill x4006
.fill 7
.end

.orig x6000
.fill x4000
.fill 6
.end

