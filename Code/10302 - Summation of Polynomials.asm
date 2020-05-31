;10302 - Summation of Polynomials

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
VARN DW ?
VARS DW ?

.CODE
MAIN PROC
    
    START:
    
    CALL SCAN_NUM
    MOV VARN,CX
    PRINTN
    
    MOV AX,1
    MOV CX,VARN
    
    MUL CX
    MUL CX
    INC CX
    MUL CX
    MUL CX
    MOV CX,4
    DIV CL
    MOV AH,0
    
    CALL PRINT_NUM_UNS
    PRINTN
    
    JMP START        
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END

    
    

