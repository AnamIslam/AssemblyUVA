;10071 - Back to High School Physics
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    
    START:              ;using start for loop
    MOV AH,1
    INT 21H
    MOV BL,AL           ;t=bl=al
    SUB BL,48
    PRINTN              ;new line
    INT 21H
    MOV BH,AL
    SUB BH,48           ;v=bh=al
    PRINTN
                        
    MOV AX,2            ;ax=2
    MUL BL              ;ax=2*t
    MUL BH              ;ax=2*t*v
    
    MOV BL,AL
    ADD BL,48
    
    MOV AH,2            ;printing
    MOV DL,BL
    INT 21H
    PRINTN
    JMP START
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN