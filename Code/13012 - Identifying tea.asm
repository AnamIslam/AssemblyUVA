;13012 - Identifying tea

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    START:
    MOV AH,1
    INT 21H 
    PRINTN
    MOV BX,AX
    MOV BH,0
    
    MOV DX,0
    MOV CX,5
    
    TOP:
    MOV AH,1
    INT 21H
    MOV BH,AL
    PRINTN
    CMP BL,BH
    JNE LAST
    
    INC DL
    
    LAST:
    LOOP TOP
    
    ADD DL,30H
    
    MOV AH,2
    INT 21H
    
    PRINTN
    
    JMP START
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    