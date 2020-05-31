;11877 - The Coco-Cola Store

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    TOP:
    MOV AH,1
    INT 21H
    
    
    MOV BL,AL
    CMP BL,30H
    JE EXIT
    
    MOV AX,0
    SUB BL,30H        ;AX=0
    MOV AL,BL
    MOV CX,2        ;CL=02
    DIV CL
    
    MOV BL,AL
    ADD BL,48          ;AL=AL/CL
    
    ;MOV BL,AL
                    ;TO GET THE OTPUT
    PRINTN
    MOV AH,2
    MOV DL,BL
    INT 21H
    PRINTN
    JMP TOP
    
    EXIT:
    MOV AH,4CH
    INT 21H
    