;11854 - Egypt

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA

VAR1 DW ?
VAR2 DW ?
VAR3 DW ?
.CODE

MAIN PROC
    

    START:
    CALL SCAN_NUM
    PRINTN
    MOV AX,CX
    MUL CX
    MOV VAR1,AX
    CALL SCAN_NUM
    PRINTN
    MOV AX,CX
    MUL CX
    MOV VAR2,AX
    CALL SCAN_NUM
    PRINTN
    MOV AX,CX
    MUL CX
    MOV VAR3,AX
    
    MOV AX,VAR1
    MOV BX,VAR2
    MOV CX,VAR3
    
    CMP AX,0
    JNE PROCESS
    CMP BX,0
    JNE PROCESS
    CMP CX,0
    JNE PROCESS
    JMP BREAK
    
    PROCESS:
    ADD AX,BX
    CMP AX,CX
    JE EXIT_RIGHT
    JMP EXIT_WRONG
    
    EXIT_WRONG:
    CALL PTHIS
    DB 'wrong',0
    PRINTN
    JMP START
    
    EXIT_RIGHT:
    CALL PTHIS
    DB 'right',0
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