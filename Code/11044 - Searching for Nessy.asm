;11044 - Searching for Nessy
INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
TC DW ?
VAR1 DW ?
VAR2 DW ?

.CODE

MAIN PROC
    CALL SCAN_NUM
    MOV TC,CX
    PRINTN
    
    
    LOOP_1:
    CALL SCAN_NUM
    MOV VAR1,CX
    PRINTN
    CALL SCAN_NUM
    MOV VAR2,CX
    PRINTN
    
    MOV DX,TC
    MOV CX,3
    MOV AX,VAR1
    DIV CL
    
    MOV BL,AL
    
    MOV AX,VAR2
    DIV CL
    MOV AH,0
    MUL BL
    
    CALL PRINT_NUM_UNS
    PRINTN
    
    DEC DX
    MOV TC,DX
    CMP DX,0
    JE BREAK_LOOP_1
    
    JMP LOOP_1
    
    BREAK_LOOP_1:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END
    