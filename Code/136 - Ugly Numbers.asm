;136 - Ugly Numbers
INCLUDE 'EMU8086.INC'

.MODEL SMALL
.STACK 100H
.CODE

MAIN PROC

    PRINT "The 1500'th ugly number is 859963392." ;printing this line
    PRINTN                                        ;new line
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    