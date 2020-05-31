;11547 - Automatic Answer

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
TS DW ?
VAR1 DW ?
;VAR2 DW ?
;SUM DW ?

.CODE
MAIN PROC
    
    CALL SCAN_NUM
    MOV TS,CX
    PRINTN
    
    MOV BX,TS
    LOOP_1:
    CMP BX,0
    JE BREAK_LOOP_1
    CALL SCAN_NUM
    MOV VAR1,CX
    PRINTN
    
    MOV AX,VAR1
    MOV CX,15
    MUL CX
    ADD AX,962
    
    MOV CX,100
    DIV CL
    MOV DL,AH
    MOV AX,0
    MOV AL,DL
    MOV CX,10
    DIV CL
    MOV AH,0
    
    CMP AX,0
    JG PRINT_AX
    MOV DX,10
    ADD AX,DX
    SUB DX,AX
    MOV AX,DX
    
    PRINT_AX:
    CALL PRINT_NUM_UNS
    PRINTN
    
    DEC BX
    JMP LOOP_1
    
    
    
    
    
    BREAK_LOOP_1:    
    
    
    
    
        
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END
