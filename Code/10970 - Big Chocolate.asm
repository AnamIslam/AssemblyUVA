;10970 Big Chocolate
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    START:
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
    PRINTN
    INT 21H
    MOV BH,AL
    SUB BH,48
    PRINTN
    
    MOV AL,BL
    MUL BH
    SUB AL,1
    
    MOV BL,AL
    ADD BL,48
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    PRINTN
    JMP START
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN