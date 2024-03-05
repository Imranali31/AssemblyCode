.MODEL SMALL 
.STACK 100H 
.DATA 
    MESSAGE DB 10, 13, "ENTER A NUMBER: $" 
.CODE 
 
    MAIN: 
        MOV AX, @DATA 
        MOV DS, AX 
         
        LEA DX, MESSAGE 
        MOV AH, 9 
        INT 21H 
         
        MOV AH, 01H 
        INT 21H 
         
        MOV CH, 10 
        MOV CL, 00H       
         
        CMP AL, 3AH 
        SUB AL, 30H 
        MOV BH, AL 
        MOV BL, 01H 
  loop: 
                    
        MOV DL, 0DH 
        MOV AH, 02H 
        INT 21H            
         
        MOV DL, 0AH 
        MOV AH, 02H 
        INT 21H            
         
        MOV DL, '0' 
        MOV AH, 02H 
        INT 21H 
         
         
        MOV DL, BH 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
                
        MOV DL,20h
        MOV AH ,02h
        INT 21H
                
        MOV DL, 58h
        MOV AH, 02h 
        INT 21H 
        
        MOV DL,20h
        MOV AH ,02h
        INT 21H
         
        MOV AL, BL 
        MUL BH 
         
        AAM 
         
        PUSH AX 
        
         
        MOV AH, 00H 
        MOV AL, BL 
        AAA 
         
         
         
        MOV CL, AH 
        MOV BL, AL 
         
         
        MOV DL, CL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, BL 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
  RESULT:
        MOV DL,20h
        MOV AH ,02h
        INT 21H    
        MOV DL, '=' 
        MOV AH, 02H 
        INT 21H 
        
        MOV DL,20h
        MOV AH ,02h
        INT 21H        
        POP AX 
         
        MOV DH, AL 
        MOV DL, AH 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H 
         
        MOV DL, DH 
        ADD DL, 30H 
        MOV AH, 02H 
        INT 21H  
         
        INC BL 
        DEC CH 
        CMP CH, 0 
        JNE loop 

         
   
   EXIT:          
        MOV AH, 04CH 
        INT 21H
          
   END MAIN 