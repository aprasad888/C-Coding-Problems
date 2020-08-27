;;=============================================================
;;CS 2110 - Fall 2019
;;Homework 6 - Bubble Sort
;;=============================================================
;;Name:Anusha Prasad
;;=============================================================

.orig x3000

;;PUT YOUR CODE HERE


AND R0, R0, 0 ;;clears x 
LD R1, LENGTH  ;;loads length for y
ADD R1, R1, -1 ;; creates y


WHILE1  ;;outer while loop                  


AND R0, R0, 0 ;x = 0 cleared again
NOT R2, R1 ;;Two's complement not y
ADD R2, R2, 1 ;; Two's complement not y + 1
ADD R2, R0, R2 ;; x-y
BRZP ENDW1 ;; if (x-y) >= 0 while escape while loop decrementing y
  
WHILE2      ;; inner while loop                     

LD R2, ARRAY ;; loads array into register 2
ADD R2, R2, R0 ;;saves memory address of ARR[x] into register 2
LDR R2, R2, 0 ;;retrieves value in memory address and puts into register 2
LD R6, ARRAY ;;loads array again into register 6
ADD R6, R6, R0 ;;saves memory address into register 6 ARR[x+1]
LDR R3, R6, 1 ;; retrieves value in memory address and puts into register 6
NOT R4, R3 ;;2's complement for comparing [x+1] and [x]
ADD R4, R4, 1 ;;2's complement 
ADD R4, R2, R4 ;; [x] - [x+1]


BRNZ ENDW2 ;;breaks to incrementing x otherwise

       
SWAP

ADD R5, R2, 0 ;;saving for temp
LD R4, ARRAY ;; loads array
ADD R4, R4, R0 ;;saves memory address
STR R3, R4, 0 ;;stores [x+1] into [x]
ADD R4, R4, 1 ;;saves memory address
STR R5, R4, 0 ;;stores [x] into [x+1]
      

ENDW2 ;;end of second while loop work

ADD R0, R0, 1 ;;incrementing x
NOT R2, R1 ;;2's complement for x-y check
ADD R2, R2, 1 ;;2's complement for x-y check
ADD R2, R0, R2 ;;2's complement for x-y check
BRN WHILE2 ;;either goes back in loop or halts 

ENDW1 ;;end of first while loop work

ADD R1, R1, -1 ;;decrements y
BRZP WHILE1 ;;either goes back to beginning of loop or halts 
       
HALT 


ARRAY .fill x4000
LENGTH .fill 7
.end

.orig x4000
.fill 4
.fill 9
.fill 0
.fill 2
.fill 9
.fill 3
.fill 10
.end
