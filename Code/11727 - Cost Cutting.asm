;11727 - Cost Cutting

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA

VAR1 DW ?
VAR2 DW ?
VAR3 DW ?

.CODE

MAIN PROC
    

    CALL SCAN_NUM
    PRINTN
    MOV DX,CX
    START:
    CMP DX,0
    JE BREAK
    DEC DX
    CALL SCAN_NUM
    PRINTN
    MOV VAR1,CX
    CALL SCAN_NUM
    PRINTN
    MOV VAR2,CX
    CALL SCAN_NUM
    PRINTN
    MOV VAR3,CX
    
    MOV AX,VAR1
    MOV BX,VAR2
    MOV CX,VAR3
    
    CMP AX,BX
    JGE CMP_CX_AX
    XCHG AX,BX 
    
    CMP_CX_AX:
    CMP AX,CX
    JGE CMP_BX_CX
    XCHG AX,CX
    
    CMP_BX_CX:
    CMP BX,CX
    JGE EXIT
    XCHG BX,CX
    
    EXIT:
    MOV AX,BX
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