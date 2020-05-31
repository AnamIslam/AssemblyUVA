;11172 - Relational Operator

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    MOV AH,1         ;INPUT TEST CASE
    INT 21H
    AND CX,0
    MOV CL,AL
    SUB CL,30H
    
    TOP:              ;NEW LINE
    PRINTN
    MOV AH,1          ;INPUT NUM1
    INT 21H
    MOV BL,AL         ;BL=NUM1
    INT 21H
    MOV BH,AL         ;BH=NUM2
    PRINTN
    
    CMP BL,BH           ;COMPARING
    JE PRINT_EQUAL
    CMP BL,BH
    JG PRINT_GREATER
    JMP PRINT_SMALLER
    
    PRINT_EQUAL:
    
    MOV AH,2            ;PRINT EQUAL
    MOV DL,61           ;ASCI 61 '='
    INT 21H
    LOOP TOP
    JMP E   
    
    PRINT_GREATER:
    
    MOV AH,2            ;PRINT GREATER
    MOV DL,62           ;ASCI 62 '>'
    INT 21H 
    LOOP TOP
    JMP E
    
    PRINT_SMALLER:
    
    MOV AH,2            ;PRINT SMALLER
    MOV DL,60           ;ASCI 60 '<'
    INT 21H
    LOOP TOP
    JMP E    
    
    E:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN