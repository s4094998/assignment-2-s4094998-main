.ORIG x3000
TRAP 0x29
TRAP 0x27
LD R7, NUMBER_TO_CONVERT ; load 237 into R7
LEA R4, MASK ; STORE BEGINNING ADDRESS OF MASK IN R4
AND R5, R5, #0 ; CLEARS R5 
ADD R6, R6, #15 ; COUNT FOR LOOP

LOOP
STI R6, TEMP_VALUE  ; SINCE RUN OUT OF REGISTERS, STORE R6 IN TEMPVAL              

ADD R6, R4, R5 ; R4 + 0 (ADDS ADDRESS OF MASK + 0, INCREMENTING)
LDR R6, R6, #0 ; LOAD VALUE OF R6 IN THAT MEMORY LOCATION
AND R6, R6, R7 ; AND MASK IN MEMORY LOCATION WITH NUMBER
BRz ZERO 
BRp ONE 


ZERO 
ADD R3, R3, #1 ; INCREASES Z POSITION 
TRAP 0x27 
LD R3, AIRBLOCK_ID
TRAP 0x27
BR NEXT_BIT


ONE 
ADD R3, R3, #1 
TRAP 0x27
LD R3, STONEBLOCK_ID
TRAP 0x27
BR NEXT_BIT



NEXT_BIT 
LDI R6, TEMP_VALUE ; LOAD ORIGINAL VALUE OF R6 (15) BACK 
ADD R5, R5, #1 ; INCREMENT R5 (ADDRESS OF MASK TO THE NEXT HEX)
ADD R6, R6, #-1 ; DECREMEMENT LOOP
TRAP 0x2C ; OUTPUT BLOCK 
BRzp LOOP
HALT









 
    MASK .FILL x0001    ; Masks to check each bit
      .FILL x0002
      .FILL x0004
      .FILL x0008
      .FILL x0010
      .FILL x0020
      .FILL x0040
      .FILL x0080
      .FILL x0100
      .FILL x0200
      .FILL x0400
      .FILL x0800
      .FILL x1000
      .FILL x2000
      .FILL x4000
      .FILL x8000
AIRBLOCK_ID .FILL #0
STONEBLOCK_ID .FILL #1
NUMBER_TO_CONVERT .FILL #237 ; Note: Please do not change the name of this constant
TEMP_VALUE .FILL x3100
.END