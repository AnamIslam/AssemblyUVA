;10055 Hashmat the brave worrior

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    MOV AH,1            ;TAKING INPUT
    INT 21H
    MOV BL,AL
    INT 21H
    MOV CL,AL
    
    CMP BL,CL
    JGE BL_GREATER      ;BL GREATER
    
    SUB CL,BL           ;CL GREATER
    ADD CL,30H
    MOV BL,CL           ;BL=CL
    JMP PRINT
    
    BL_GREATER:
    SUB BL,CL
    ADD BL,30H
    JMP PRINT
    
    PRINT:              ;PRINTING RESULT
    PRINTN
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    
    