;12478 - Hardest Problem Ever(Easy)
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC

    PRINT "KABIR" ;printing this line
    PRINTN                                        ;new line
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    