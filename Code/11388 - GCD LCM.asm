;11388 - GCD LCM

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
I DW ?
N DW ?
VAR1 DW ?
VAR2 DW ?

.CODE

MAIN PROC
    
    START:
    CALL SCAN_NUM       ;INPUT TEST CASE
    PRINTN              ;NEW LINE
    MOV N,CX            ;N=CX
    MOV DX,0            ;DX=0
    
    TOP:                ;LOOP START
    CMP N,DX            ;IF(I>N)
    JE BREAK            ;BREAK
    CALL SCAN_NUM       ;NEW NUMBER INPUT
    PRINTN              ;NEW LINE
    MOV BX,CX           ;BX=CX
    CALL SCAN_NUM       ;NEW NUYMBER TAKEN
    PRINTN              ;NEW LINE
    INC DX              ;DX++
    
    MOV AX,BX           ;AX=BX
    XCHG CX,AX
    MOV BX,AX
    DIV CL              ;AX/CL
    
    CMP AH,0
    JE PRINT_NUM
    JMP PRINT_OTHER
    
    PRINT_NUM:          ;PRINTING NUMBER WHICH SUPPORT GCD LCM
    MOV AX,CX
    CALL PRINT_NUM_UNS
    PRINT " "
    MOV AX,BX
    CALL PRINT_NUM_UNS
    PRINTN
    INC I
    JMP TOP
    
    PRINT_OTHER:        ;PRINTING -1
    PRINT '-1'
    PRINTN
    INC I
    JMP TOP
    
    BREAK:              ;END
    MOV AH,4CH
    INT 21H
    MAIN ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END MAIN
    
    
     