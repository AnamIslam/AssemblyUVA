;12149 - Feynman
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    START:
    CALL SCAN_NUM      ;INPUT IN CX
    PRINTN             ;NEW LINE
    MOV AX,CX
    
    CMP AX,0           ;CMPERING AX WITH 0, IF AX==0 THE PROGRAM WILL TERMINATE
    JE BREAK
    
    MOV BX,0           ;BX=0
    TOP:               ;LOOP TO DO THE PROCESS
    MOV AX,CX          ;AX=CX
    MUL CX             ;AX=AX*CX
    ADD BX,AX          ;BX=BX+AX
    LOOP TOP
                       ;AX=BX
    MOV AX,BX
    
    CALL PRINT_NUM_UNS ;OUTPUT
    PRINTN
    JMP START
    
                       ;ENDING PROGRAM
    BREAK:
    MOV AH,4CH
    INT 21H
    MAIN ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
END