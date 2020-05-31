;11677 - Alarm Clock

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
H1 DW ?
H2 DW ?
M1 DW ?
M2 DW ?
T1 DW ?
T2 DW ?
.CODE

MAIN PROC
    
    START:
    CALL SCAN_NUM
    MOV H1,CX
    PRINTN
    CALL SCAN_NUM
    MOV M1,CX
    PRINTN
    CALL SCAN_NUM
    MOV H2,CX
    PRINTN
    CALL SCAN_NUM
    MOV M2,CX
    PRINTN
    
    MOV AX,H1          ;T1=H1*60+M1
    MOV CX,60
    MUL CX
    MOV CX,M1
    ADD AX,CX
    MOV T1,AX
    
    MOV AX,H2          ;T2=H2*60+M2
    MOV CX,60
    MUL CX
    MOV CX,M2
    ADD AX,CX
    MOV T2,AX
    
    MOV AX,T1
    MOV BX,T2
    CMP AX,0
    JNE NEXT_STEP
    CMP BX,0
    JE BREAK
    
    NEXT_STEP:
    CMP AX,BX
    JGE AX_GREATER
    SUB BX,AX          ;BX=BX-AX
    MOV AX,BX
    JMP PRINT_NUM
    
    AX_GREATER:
    ;MOV CX,1440
    ADD BX,1440
    SUB BX,AX
    MOV AX,BX
    
    PRINT_NUM:
    
    CALL PRINT_NUM_UNS
    PRINTN
    JMP START
    
    BREAK:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END 