;;=============================================================
;;CS 2110 - Fall 2019
;;Homework 6 - Count the Vowels in a String
;;=============================================================
;;Name:
;;=============================================================

.orig x3000

	;;INSERT CODE AT THIS LOCATION
AND R0, R0, 0 ;;clearing register 0 (vcount)
AND R1, R1, 0 ;;clearing register 1 (i)

WHILE 
LD R2, STRING  ;;beginning loop through string array
    
ADD R2, R2, R1 ;;saving memory address based on increment i
LDR R2, R2, 0 ;;getting value at string address and putting in register 2
       
       BRZ ENDW1 ;;stores vcount and halts
       
       LD R3, A ;; loads A (character)
       NOT R4, R3 ;;2's complement check for if ([x] - A)
       ADD R4, R4, 1 ;;2's complement check for if ([x] - A)
       ADD R4, R2, R4 ;;2's complement check for if ([x] - A)
       
       BRZ INCREMENT ;; increments when above expression is 0
 
       ADD R5, R3, 4 ;; Makes E (character)
       NOT R4, R5 ;;2's complement check for if ([x] - E)
       ADD R4, R4, 1 ;;2's complement check for if ([x] - E)
       ADD R4, R2, R4 ;;2's complement check for if ([x] - E)
  
       BRZ INCREMENT ;; increments when above expression is 0
 
       ADD R5, R5, 4 ;; Makes I (character)
       NOT R4, R5 ;;2's complement for [x] - i
       ADD R4, R4, 1
       ADD R4, R2, R4 
    
       BRZ INCREMENT ;; increments when above expression is 0

       ADD R5, R5, 6 ;; Makes o (character)
       NOT R4, R5 ;;2's complement for [x] - o
       ADD R4, R4, 1
       ADD R4, R2, R4 

       BRZ INCREMENT ;; increments when above expression is 0

       ADD R5, R5, 6 ;; Makes u (character)
       NOT R4, R5 ;;2's complement for [x] - u
       ADD R4, R4, 1
       ADD R4, R2, R4

       BRZ INCREMENT ;; increments when above expression is 0
       
       BRNP CHANGE ;;increments i

INCREMENT 
ADD R0, R0, 1 ;;increment count

CHANGE 
ADD R1, R1, 1 ;;increment i

BR WHILE ;; will loop back if necessary

ENDW1
ST R0, ANSWER

HALT

A .fill x41    ;; A in ASII
STRING .fill x4000
ANSWER .blkw 1
.end

.orig x4000
.stringz "TWENTY ONE TEN"
.end