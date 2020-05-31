;13025 - Back to the Past
.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'May 29, 2013 Wednesday $'
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    