;12531 - Hours and Minutes

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    START:
    CALL SCAN_NUM
    PRINTN
    MOV AX,CX
    
    MOV CX,6
    DIV CL
    
    CMP AH,0
    JE PRINT_Y
    JMP PRINT_N
    
    PRINT_Y:
    CALL PTHIS
    DB 'Y',0
    PRINTN
    JMP START
    
    PRINT_N:
    CALL PTHIS
    DB 'N',0
    PRINTN
    JMP START
    
    BREAK:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
DEFINE_PTHIS
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS

END