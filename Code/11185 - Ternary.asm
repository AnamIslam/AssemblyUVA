;11185 - Ternary

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
TS DW ?

.CODE
MAIN PROC
    
    START:
    CALL SCAN_NUM
    MOV TS,CX
    
    
    MOV DX,0
    MOV AX,TS
    
    CMP AX,-1
    JE PROG_BREAK      
    PRINTN
    MOV AX,TS      
    LOOP_1:
    MOV CX,3
    DIV CL
    MOV BX,0
    MOV BL,AL
    MOV AL,AH
    MOV AH,0
    PUSH AX
    INC DX
    MOV AX,BX
    CMP AX,0
    JE BREAK_LOOP_1
    JMP LOOP_1
    
    BREAK_LOOP_1:
    
    PRINT_NUM:
    CMP DX,0
    JE BREAK_PRINT_NUM
    POP AX
    CALL PRINT_NUM_UNS
    DEC DX
    JMP PRINT_NUM
    
    BREAK_PRINT_NUM:
    
    PRINTN
    
    JMP START
    PROG_BREAK:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END
