;12372 - Packing for Holiday

INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.DATA

TC DW '?'
VAR1 DW '?'
VAR2 DW '?'
VAR3 DW '?' 


.CODE
MAIN PROC

START:
    CALL SCAN_NUM
    MOV AX,CX
    MOV TC,AX
    PRINTN 
    
    LOOP_1:
    CMP AX,0
    JE BREAK_LOOP_1
    PUSH AX
    DEC AX
    JMP LOOP_1
    
    BREAK_LOOP_1:
    
    MOV BX,TC
    
    LOOP_2:
    
    CMP BX,0
    JE BREAK_LOOP_2
    DEC BX
    CALL SCAN_NUM     ;INPUT THE 3 NUMBERS
    MOV VAR1,CX
    PRINTN
    
    CALL SCAN_NUM
    MOV VAR2,CX
    PRINTN
    
    CALL SCAN_NUM
    MOV VAR3,CX
    PRINTN
    
    
    MOV AX,VAR1
    CMP AX,20
    JG PRINT_BAD
    MOV AX,VAR2
    CMP AX,20
    JG PRINT_BAD
    MOV AX,VAR3
    CMP AX,20
    JG PRINT_BAD
    
    JMP PRINT_GOOD
    
    PRINT_BAD:
    PRINT "Case "
    POP AX
    CALL PRINT_NUM_UNS
    PRINT ": bad"
    PRINTN
    JMP LOOP_2
    
    PRINT_GOOD:
    PRINT "Case "
    POP AX
    CALL PRINT_NUM_UNS
    PRINT ": good"
    PRINTN
    JMP LOOP_2
     
    
    BREAK_LOOP_2:
   
   
    
    
    BREAK:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    
DEFINE_PTHIS
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS

END