;10346 - Peter's Smokes
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
    VAR1 DW ?
    VAR2 DW ?
    RESULT DW ?
.CODE
MAIN PROC
    
    START:
    CALL SCAN_NUM     ;INPUT TAKEN
    MOV VAR1,CX
    PRINTN
    CALL SCAN_NUM
    MOV VAR2,CX
    PRINTN
    
    MOV AX,VAR1
    MOV RESULT,AX
    LOOP_1:
    MOV AX,VAR1
    ;MOV RESULT,AX
    MOV CX,VAR2
    DIV CL
    
    MOV BX,0
    MOV BL,AH
    MOV AH,0
    ADD BX,AX
    MOV VAR1,BX
    MOV DX,RESULT
    ADD DX,AX
    MOV RESULT,DX
    
    CMP BX,CX
    JL BREAK_LOOP_1
    JMP LOOP_1
    
    BREAK_LOOP_1:
    MOV AX,RESULT
    CALL PRINT_NUM_UNS
    PRINTN
    JMP START
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END
    
    
    
    
     