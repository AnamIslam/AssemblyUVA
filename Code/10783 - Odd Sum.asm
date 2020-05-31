;10783 - Odd Sum

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
TS DW ?
VAR1 DW ?
VAR2 DW ?
SUM DW ?

.CODE
MAIN PROC
    
    CALL SCAN_NUM
    MOV TS,CX
    PRINTN
    
    TOP:
    MOV AX,CX
    PUSH CX
    LOOP TOP
    
    LOOP_1:
    CALL SCAN_NUM
    MOV VAR1,CX
    PRINTN
    
    CALL SCAN_NUM
    MOV VAR2,CX
    PRINTN
    
    MOV SUM,0
    
    MOV BX,VAR1
    MOV DX,VAR2
    
    MOV CX,2 
    LOOP_2:
    CMP BX,DX
    JG BREAK_LOOP_2 
    MOV AX,BX
    DIV CL
    CMP AH,0
    JE NEXT_STEP 
    MOV AX,SUM
    ADD AX,BX
    MOV SUM,AX
    NEXT_STEP:
    INC BX
    JMP LOOP_2
    
    BREAK_LOOP_2:
    
    PRINT_NUM:
    
    PRINT 'Case '
    POP AX
    CMP AX,0
    JNE DX_0
    MOV DX,1
    JMP PRINT_NEXT
    
    DX_0:
    MOV DX,0
    
    PRINT_NEXT:
    CALL PRINT_NUM_UNS
    PRINT ': '
    MOV AX,SUM
    CALL PRINT_NUM_UNS
    PRINTN
    
    CMP DX,1
    JMP LOOP_1 
    
    
    BREAK_LOOP_1:
    
    
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END
