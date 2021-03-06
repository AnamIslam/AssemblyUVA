;10696 - f91

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    
    START:
    CALL SCAN_NUM
    PRINTN
    MOV AX,CX
    
    CMP AX,0
    JE BREAK
    CMP AX,100
    JLE PRINT_91
    JMP PRINT_OTHER
    
    PRINT_91:
    CALL PTHIS
    DB 'F91(',0
    CALL PRINT_NUM_UNS
    CALL PTHIS
    DB ') =91',0
    PRINTN
    JMP START
    
    PRINT_OTHER:
    CALL PTHIS
    DB 'F91(',0
    CALL PRINT_NUM_UNS
    CALL PTHIS
    DB ')=',0
    SUB AX,10
    CALL PRINT_NUM_UNS
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