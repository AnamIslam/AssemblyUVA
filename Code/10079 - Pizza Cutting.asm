;10079 - Pizza Cutting
INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
VAR1 DW ?
VAR2 DW ?
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LOOP_START:
    CALL INPUT_NUMBER ;CALLING INPUT FUNCTION
    CMP AX,0
    JE EXIT_FULL
    MOV VAR1,AX
    PRINTN
    
    PROCESS:
    MOV AX,1
    MOV CX,VAR1       
    TOP:              ;LOOP
    
    ADD AX,CX
    LOOP TOP
    
    
    
    CALL OUTPUT_NUMBER
    JMP LOOP_START     ;LOOP OUTER
    
    
    EXIT_FULL:    
    MAIN ENDP
    JMP LL              ;JUMPING TO FINI9SH THE PROGRAM

INPUT_NUMBER PROC
    AND BX,0        ;BX=0
    AND CX,0        ;CX=0
    MOV CL,10D      ;CL=10
    
    INPUT:
    MOV AH,1
    INT 21H
    AND DX,0
    MOV DL,AL
    MOV CX,10D
    
    CMP DL,0DH
    JNE NUMBER_IN
    JMP NUMBER_SAVE
    
    NUMBER_IN:
    SUB DX,30H
    AND AX,0
    MOV AX,BX
    MUL CL
    
    ADD AX,DX
    MOV BX,AX
    JMP INPUT
    
    NUMBER_SAVE:
    MOV AX,BX
    RET
    
    INPUT_NUMBER ENDP
    
OUTPUT_NUMBER PROC
    MOV BX,0000H
    
    PART:
    MOV CX,10D
    DIV CL      ;AX/CL
    
    MOV [0000H+BX],AH
    MOV AH,0
    
    ADD BX,2H
    
    CMP AL,0
    JNE PART   
    
    PRINT_DATA:
    SUB BX,2H
    MOV AH,2
    MOV DX,[0000H+BX]
    ADD DX,30H  
    INT 21H
    CMP BX,0
    JNE PRINT_DATA
    PRINTN
    RET
    
    OUTPUT_NUMBER ENDP
    LL:
END MAIN
    
        