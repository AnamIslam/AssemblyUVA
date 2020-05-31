;11332 - Summing Digits
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
VAR1 DW ?
VARR DW ?
.CODE
MAIN PROC
    
    START:
    CALL SCAN_NUM
    MOV VAR1,CX
    PRINTN
    
    MOV CX,VAR1        ;IF(N==0)BREAK
    CMP CX,0
    JE BREAK_PROG
    
    MOV VARR,0
    
    LOOP_1:             ;WHILE(N>9)
    MOV AX,VAR1
    CMP AX,9
    JLE BREAK_LOOP_1
    LOOP_2:             ;WHILE(N!=0)
    MOV AX,VAR1
    CMP AX,0
    JE BREAK_LOOP_2
    MOV CX,10
    DIV CL
    MOV DX,0
    MOV BX,0
    MOV DL,AH
    MOV AH,0
    MOV VAR1,AX
    MOV BX,VARR
    ADD BX,DX
    MOV VARR,BX
    JMP LOOP_2
    
    BREAK_LOOP_2:
    MOV AX,VARR
    MOV VAR1,AX
    MOV VARR,0
    
    JMP LOOP_1
    
    BREAK_LOOP_1:
    MOV AX,VAR1
    CALL PRINT_NUM_UNS
    PRINTN
    JMP START
    
     
    BREAK_PROG:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END
