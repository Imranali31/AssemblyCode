.MODEL SMALL
.STACK 100H
.DATA
    NL      DB  0AH,0DH,"$"
    MSG1    DB  0AH,0DH,"NUMBER OF LINE: $"  
    VAL DB ? 
    VAL2 DB ?
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
        
        MOV BL,VAL
        
        LOOP1:
            MOV CH,BL;
            MOV DH,' ' 
            MOV AH,2
            LOOP3:   
                   INT 21H
                   DEC CH
                   CMP CH,0
                   JGE LOOP3
                
               
            MOV CL,BL;
            LOOP2:
                MOV AH,2
                MOV DL,'*'
                INT 21H 
                INC CL
                CMP CL,VAL
                JLE LOOP2  
            DEC BL
            LEA DX,NL
            MOV AH,9
            INT 21H  
            CMP BL,0
            JE EXIT           
            JMP LOOP1
     EXIT :
        MOV AH,04CH
        INT 21H
            
        
        