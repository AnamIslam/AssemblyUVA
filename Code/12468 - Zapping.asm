;12468 - Zapping

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA

VAR1 DW ?
VAR2 DW ?
VAR3 DW ?
VAR4 DW ?

.CODE

MAIN PROC
    
    START:
    CALL SCAN_NUM
    PRINTN
    MOV VAR1,CX
    CALL SCAN_NUM
    PRINTN
    MOV VAR2,CX
    
    MOV AX,VAR1
    MOV BX,VAR2
    
    CMP AX,-1
    JNE PROCESS
    CMP BX,-1
    JE BREAK
            
    PROCESS:        
    CMP AX,BX
    JGE AX_BX
    XCHG AX,BX
    
    AX_BX:
    MOV CX,AX
    SUB CX,BX
    MOV VAR3,CX
    ADD BX,100
    SUB BX,AX
    MOV VAR4,BX
    MOV AX,VAR3
    
    CMP AX,BX
    JLE PRINT_AX
    JMP PRINT_BX
    
    PRINT_AX:
    CALL PRINT_NUM_UNS
    PRINTN
    JMP START
    
    PRINT_BX:
    MOV AX,BX
    CALL PRINT_NUM_UNS
    PRINTN
    JMP START
    
    
    BREAK:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
DEFINE_PTHIS
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS

END