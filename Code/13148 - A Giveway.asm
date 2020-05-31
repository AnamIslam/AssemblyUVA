;13148 - A Giveway
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    START:
    CALL SCAN_NUM       ;SCAN NUM FUNCTION
    PRINTN              ;NEW LINE   
    MOV AX,CX
    
    CMP AX,0
    JE BREAK
    
    CMP AX,1
    JE PRINT_SPECIAL
    
    CMP AX,64
    JE PRINT_SPECIAL
    
    CMP AX,729
    JE PRINT_SPECIAL
    
    CMP AX,4096
    JE PRINT_SPECIAL
    
    CMP AX,15625
    JE PRINT_SPECIAL
    
    CMP AX,46656
    JE PRINT_SPECIAL
    
    JMP PRINT_ORDINARY
    
    PRINT_SPECIAL:
    PRINT "Special"
    PRINTN
    JMP START
    
    PRINT_ORDINARY:
    PRINT "Ordinary"
    PRINTN
    JMP START
    
    BREAK:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
END MAIN