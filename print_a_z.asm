.MODEL SMALL 
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV CX,0
    LOOP:
        MOV AL,CL
        ADD AL,97
        MOV DL,AL
        
        MOV AH,02
        INT 21H
        
        INC CX
        CMP CX,26
        JL LOOP
    MOV AH,04CH
    INT 21H
MAIN ENDP
END MAIN