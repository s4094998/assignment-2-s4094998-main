.ORIG x3000
TRAP 0X29
TRAP 0x27
LD R3, A_X; insert A_X to R3 
LD R4, A_Y
LD R5, A_Z
NOT R3, R3; not r3 into r4 
ADD R3, R3, #1 ; add 1 to turn into negative 
ADD R3, R3, R0 ; add r4(negative of A_X) and r0 (x)

BRzp SKIPAX 
NOT R3, R3
ADD R3, R3, #1
SKIPAX

NOT R4, R4
ADD R4, R4, #1
ADD R4, R4, R1


BRzp SKIPAY
NOT R4, R4
ADD R4, R4, #1
SKIPAY

NOT R5, R5
ADD R5, R5, #1
ADD R5, R5, R2

BRzp SKIPAZ
NOT R5, R5
ADD R5, R5, #1
SKIPAZ

ADD R6, R3, R4
ADD R6, R6, R5

LD R3, B_X; insert A_X to R3 
LD R4, B_Y
LD R5, B_Z
NOT R3, R3; not r3 into r4 
ADD R3, R3, #1 ; add 1 to turn into negative 
ADD R3, R3, R0 ; add r4(negative of A_X) and r0 (x)


BRzp SKIPBX 
NOT R3, R3
ADD R3, R3, #1
SKIPBX

NOT R4, R4
ADD R4, R4, #1
ADD R4, R4, R1


BRzp SKIPBY
NOT R4, R4
ADD R4, R4, #1
SKIPBY

NOT R5, R5
ADD R5, R5, #1
ADD R5, R5, R2


BRzp SKIPBZ
NOT R5, R5
ADD R5, R5, #1
SKIPBZ

ADD R7, R3, R4
ADD R7, R7, R5

NOT R6, R6 
ADD R6, R6, #1 
ADD R7, R7, R6 
BRz EQUAL 
BRp YLARGER 
BRn XLARGER 

EQUAL 
LEA R0, INPUT1
TRAP 0X28
HALT 

YLARGER 
LEA R0, INPUT2
TRAP 0X28
HALT

XLARGER
LEA R0, INPUT3
TRAP 0X28
HALT



HALT
A_X .FILL #1
A_Y .FILL #2
A_Z .FILL #3
B_X .FILL #20
B_Y .FILL #32
B_Z .FILL #-8
INPUT1 .STRINGZ "The player is equally far from both points"
INPUT2 .STRINGZ "The player is closer to point A"
INPUT3 .STRINGZ "The player is closer to point B"
.END