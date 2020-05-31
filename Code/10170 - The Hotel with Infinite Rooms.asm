;10170 - The Hotel with Infinite Rooms
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA
VARS DW ?
VARD DW ?

.CODE
MAIN PROC
    
    START:
    CALL SCAN_NUM
    MOV VARS,CX
    PRINTN
    CALL SCAN_NUM
    MOV VARD,CX
    PRINTN
    
    MOV AX,VARS
    MOV BX,VARD
    MOV CX,AX
    
    LOOP_2:
    CMP AX,BX
    JGE BREAK_LOOP_2
    INC CX
    ADD AX,CX
    JMP LOOP_2
    
    BREAK_LOOP_2:
    
    MOV AX,CX
    CALL PRINT_NUM_UNS
    PRINTN
    JMP START
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END
    