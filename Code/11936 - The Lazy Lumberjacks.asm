;11936 - The Lazy Lumberjacks

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA

VAR1 DW ?
VAR2 DW ?
VAR3 DW ?
VAR12 DW ?
VAR23 DW ?
VAR31 DW ?

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
    
    ADD AX,BX
    MOV VAR12,AX
    ADD AX,CX
    SUB AX,BX
    MOV VAR31,AX
    ADD BX,CX
    MOV VAR23,BX
    
    MOV AX,VAR1
    MOV BX,VAR23
    CMP BX,AX
    JLE EXIT_WRONG
    
    MOV AX,VAR2
    MOV BX,VAR31
    CMP BX,AX
    JLE EXIT_WRONG
    
    MOV AX,VAR3
    MOV BX,VAR12
    CMP BX,AX
    JLE EXIT_WRONG 
    
    JMP EXIT_OK
    
    EXIT_WRONG:
    CALL PTHIS
    DB 'Wrong!!',0
    PRINTN
    JMP START
    
    EXIT_OK:
    CALL PTHIS
    DB 'OK',0
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