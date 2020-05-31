;11150 - Cola
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    START:         ;LOOP
    MOV AH,1       ;INPUT
    INT 21H
    MOV BL,AL
    SUB BL,48
    PRINTN
    
    MOV AX,0
    MOV AL,BL     ;PROCESS
    MOV CX,2
    DIV CL
    
    
    ADD BL,AL
    ADD BL,48
    
    MOV AH,2       ;OUTPUT
    MOV DL,BL
    INT 21H
    PRINTN
    JMP START      ;GOTO LOOP START
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN