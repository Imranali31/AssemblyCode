.MODEL SMALL
.STACK 100H
.DATA
    NL      DB  0AH,0DH,"$"
    MSG1    DB  0AH,0DH,"NUMBER OF LINE: $"  
    VAL DB ?
.CODE
    START:
        MOV AX,@DATA
        MOV DS,AX
        
        LEA DX,MSG1
        MOV AH,9
        INT 21H   
        
        MOV AH,1
        INT 21H 
        SUB AL,48
        MOV VAL,AL  
        
        LEA DX,NL
        MOV AH,9
        INT 21H
       
        MOV BL,1
        
        LOOP1:
            MOV CX,BX
            
            LOOP2:
                CMP BL ,VAL
                JG EXIT
                MOV AH,2
                MOV DL,'*'
                INT 21H
                LOOP LOOP2  
            INC BL
            LEA DX,NL
            MOV AH,9
            INT 21H 
            JMP LOOP1
     EXIT :
        MOV AH,04CH
        INT 21H
            
        
        