.MODEL SMALL
.STACK 100H
.DATA
    MSG1:    DB  0AH,0DH,"Enter the string: $"
    MSG2 :   DB  0AH,0DH,"PALINDROME $"
    MSG3:    DB  0AH,0DH,"NOT PALINDROME $"   
    BUFFER  DB  80 DUP(0)
.CODE
    START:
        MOV AX,@DATA
        MOV DS,AX
        LEA DX,MSG1
        MOV AH,9
        INT 21H
        
        
        LEA SI,BUFFER
        LEA DI,BUFFER
        
        
        MOV AH,1
        INPUT:
            INT 21H
            CMP AL,0DH
            JE FINISH
            MOV [DI],AL
            INC DI
            JMP INPUT
        FINISH:
            MOV AL,"&"
            MOV [DI],AL
        CHECK:
            DEC DI
            MOV AL,[SI]
            CMP [DI],AL
            JNE NOT_PALINDROME
            
            INC SI
            CMP SI,DI
            JL CHECK
        PALINDROME:
            MOV AH,9
            LEA DX,MSG2
            INT 21H
            JMP EXIT
        NOT_PALINDROME:
            MOV AH,9
            LEA DX, MSG3
            INT 21H
EXIT:
    MOV AH,4CH
    INT 21H
      